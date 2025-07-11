from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.hashers import make_password
from django.contrib.auth.forms import SetPasswordForm, PasswordChangeForm
from .models import CustomUser, EmployeeProfile, HRProfile, Department, SalaryRecord, BankDetail, TaxRecord, TrainingProgram, EmployeeTrainingRecord
from .forms import EmployeeCreationForm, EmployeeEditForm, TrainingProgramForm, EmployeeTrainingRecordForm
from datetime import datetime
from django.contrib.auth.views import PasswordResetView as DjangoPasswordResetView
from django.urls import reverse
from django.utils import timezone
from django.shortcuts import redirect
from .models import Attendance, SHIFT_TIMES
from datetime import timedelta, datetime



def welcome(request):
    return render(request, "accounts/welcome.html")

def employee_login(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user and user.role in ["employee", "gm"]:
            login(request, user)
            return redirect("employee_dashboard")
        else:
            return render(request, "accounts/employee_login.html", {"error": "Invalid credentials"})
    return render(request, "accounts/employee_login.html")

def hr_login(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user and user.role == "hr":
            login(request, user)
            return redirect("hr_dashboard")
        else:
            return render(request, "accounts/hr_login.html", {"error": "Invalid credentials"})
    return render(request, "accounts/hr_login.html")

@login_required
def user_logout(request):
    logout(request)
    return redirect("welcome")

@login_required
def employee_dashboard(request):
    user = request.user
    is_gm = user.role == "gm"
    is_hr = user.role == "hr"
    profile = None

    if user.role == "employee" or is_hr or is_gm:
        try:
            profile = EmployeeProfile.objects.get(user=user)
        except EmployeeProfile.DoesNotExist:
            profile = None

    return render(
        request,
        "accounts/employee_dashboard.html",
        {
            "profile": profile,
            "show_profile_dropdown": True,
            "is_gm": is_gm,
            "is_hr": is_hr,
        }
    )

@login_required
def hr_dashboard(request):
    if request.user.role != "hr":
        return redirect("login")

    profile = HRProfile.objects.get(user=request.user)
    hr_role = profile.hr_role  

    if hr_role == "general":
        departments = Department.objects.all()
        employees = EmployeeProfile.objects.all()
        selected_department = request.GET.get("department")
        if selected_department:
            employees = employees.filter(department_id=selected_department)

        return render(
            request,
            "accounts/hr_dashboard.html",
            {
                "profile": profile,
                "departments": departments,
                "employees": employees,
                "selected_department": selected_department,
                "show_profile_dropdown": True,
                "is_hr": True,
            }
        )

    elif hr_role == "payroll":
        
        month_param = request.GET.get("month")
        salary_records = SalaryRecord.objects.all().order_by("-month")

        if month_param:
            
            try:
                year_str, month_str = month_param.split("-")
                year = int(year_str)
                month = int(month_str)
                salary_records = salary_records.filter(
                    month__year=year,
                    month__month=month
                )
            except (ValueError, IndexError):
                
                pass

        return render(
            request,
            "accounts/hr_payroll_dashboard.html",
            {
                "profile": profile,
                "total_employees": EmployeeProfile.objects.count(),
                "payroll_processed": salary_records.count(),
                "pending_bank_verifications": 8,
                "recent_joinings": EmployeeProfile.objects.order_by("-date_of_joining")[:5],
                "salary_records": salary_records,
                "notices": "Next salary processing date is July 31.",
                "selected_month": month_param,
                "show_profile_dropdown": True,
                "is_hr": True,
            }
        )

    elif hr_role == "training":
        programs = TrainingProgram.objects.all().order_by('-start_date')
        records = EmployeeTrainingRecord.objects.select_related('employee', 'training_program')

        return render(
            request,
            "accounts/training_hr_dashboard.html",
            {
                "profile": profile,
                "programs": programs,
                "records": records,
                "show_profile_dropdown": True,
                "is_hr": True,
            }
        )

    else:
        return redirect("welcome")



@login_required
def add_employee(request):
    if request.user.role != "hr":
        return redirect("login")

    if request.method == "POST":
        form = EmployeeCreationForm(request.POST)
        if form.is_valid():
            user = CustomUser.objects.create(
                email=form.cleaned_data["email"],
                password=make_password(form.cleaned_data["password"]),
                first_name=form.cleaned_data["first_name"],
                last_name=form.cleaned_data["last_name"],
                role="employee",
            )
            EmployeeProfile.objects.create(
                user=user,
                phone=form.cleaned_data["phone"],
                dob=form.cleaned_data["dob"],
                department=form.cleaned_data["department"],
            )
            return redirect("employee_list")
    else:
        form = EmployeeCreationForm()

    return render(request, "accounts/add_employee.html", {"form": form})

@login_required
def employee_list(request):
    if request.user.role != "hr":
        return redirect("login")

    employees = EmployeeProfile.objects.all()
    return render(request, "accounts/employee_list.html", {"employees": employees})

def forgot_id(request):
    user_id = None
    error = None

    if request.method == "POST":
        email = request.POST.get("email")
        try:
            user = CustomUser.objects.get(email=email)
            user_id = user.username
        except CustomUser.DoesNotExist:
            error = "No user found with that email."

    return render(request, "accounts/forgot_id.html", {"user_id": user_id, "error": error})

@login_required
def edit_employee(request, employee_id):
    if request.user.role != "hr":
        return redirect("login")

    employee = get_object_or_404(EmployeeProfile, id=employee_id)
    if request.method == "POST":
        form = EmployeeEditForm(request.POST, instance=employee)
        if form.is_valid():
            form.save()
            return redirect("employee_list")
    else:
        form = EmployeeEditForm(instance=employee)

    return render(request, "accounts/edit_employee.html", {"form": form})

@login_required
def delete_employee(request, employee_id):
    if request.user.role != "hr":
        return redirect("login")

    employee = get_object_or_404(EmployeeProfile, id=employee_id)
    employee.user.delete()
    return redirect("employee_list")

@login_required
def reset_employee_password(request, employee_id):
    if request.user.role != "hr":
        return redirect("login")

    employee = get_object_or_404(EmployeeProfile, id=employee_id)
    user = employee.user
    form = SetPasswordForm(user, request.POST or None)

    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect("hr_dashboard")

    return render(request, "accounts/reset_employee_password.html", {
        "form": form,
        "employee": employee
    })

@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            return redirect('welcome')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'accounts/change_password.html', {'form': form})

def gm_required(user):
    return user.is_authenticated and user.role == "gm"

@login_required
@user_passes_test(gm_required)
def view_reports(request):
    return render(request, "accounts/view_reports.html")

@login_required
@user_passes_test(gm_required)
def approve_requests(request):
    return render(request, "accounts/approve_requests.html")

import csv
from django.http import HttpResponse

@login_required
def download_payroll_report(request):
    if request.user.role != "hr":
        return redirect("login")

    profile = HRProfile.objects.get(user=request.user)
    if profile.hr_role != "payroll":
        return redirect("hr_dashboard")

    
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="payroll_report.csv"'

    writer = csv.writer(response)
    writer.writerow(['Employee', 'Department', 'Month', 'Salary'])

    from .models import SalaryRecord

    records = SalaryRecord.objects.all().order_by("-month")
    for record in records:
        writer.writerow([
            record.employee.user.get_full_name(),
            record.employee.department.name,
            record.month,
            record.amount
        ])

    return response

@login_required
def view_bank_details(request):
    if request.user.role != "hr":
        return redirect("login")

    profile = HRProfile.objects.get(user=request.user)
    if profile.hr_role != "payroll":
        return redirect("hr_dashboard")

    
    return HttpResponse("<h2>Bank Details Page Coming Soon</h2>")

@login_required
def view_tax_reports(request):
    if request.user.role != "hr":
        return redirect("login")

    profile = HRProfile.objects.get(user=request.user)
    if profile.hr_role != "payroll":
        return redirect("hr_dashboard")

    
    return HttpResponse("<h2>Tax Reports Page Coming Soon</h2>")

@login_required
def view_bank_details(request):
    if request.user.role != "hr":
        return redirect("login")

    bank_details = BankDetail.objects.select_related('employee', 'employee__user', 'employee__department').all()

    return render(request, "accounts/view_bank_details.html", {
        "bank_details": bank_details,
        "show_profile_dropdown": True
    })

@login_required
def view_tax_reports(request):
    if request.user.role != "hr":
        return redirect("login")

    tax_records = TaxRecord.objects.select_related('employee', 'employee__user', 'employee__department').all()

    return render(request, "accounts/view_tax_reports.html", {
        "tax_records": tax_records,
        "show_profile_dropdown": True
    })

@login_required
def training_hr_dashboard(request):
    if request.user.hrprofile.hr_role != 'training':
        return redirect('unauthorized') 

    programs = TrainingProgram.objects.all().order_by('-start_date')
    records = EmployeeTrainingRecord.objects.select_related('employee', 'training_program')

    hr_name = request.user.get_full_name()

    return render(request, 'accounts/training_hr_dashboard.html', {
        'programs': programs,
        'records': records,
        'hr_name': hr_name,
        'profile': request.user.hrprofile,
        'show_profile_dropdown': True
    })


def add_training_program(request):
    if not request.user.is_authenticated or request.user.hrprofile.hr_role != 'training':
        return redirect('unauthorized')

    if request.method == 'POST':
        form = TrainingProgramForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('training_hr_dashboard')
    else:
        form = TrainingProgramForm()

    return render(request, 'accounts/add_training_program.html', {'form': form})


def assign_employee_training(request):
    if not request.user.is_authenticated or request.user.hrprofile.hr_role != 'training':
        return redirect('unauthorized')

    if request.method == 'POST':
        form = EmployeeTrainingRecordForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('training_hr_dashboard')
    else:
        form = EmployeeTrainingRecordForm()

    return render(request, 'accounts/assign_employee_training.html', {'form': form})

from django.contrib.auth.views import PasswordResetView
from django.contrib.auth import get_user_model
from django.template.response import TemplateResponse
from django.contrib.auth.tokens import default_token_generator
from django.utils.http import urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.urls import reverse

class CustomPasswordResetView(PasswordResetView):
    template_name = 'accounts/password_reset_form.html'
    subject_template_name = 'accounts/password_reset_subject.txt'
    email_template_name = 'accounts/password_reset_email.html'
    success_url = '/forgot-password/'

    def form_valid(self, form):
        
        UserModel = get_user_model()
        email = form.cleaned_data["email"]

        try:
            user = UserModel.objects.get(email=email)
        except UserModel.DoesNotExist:
            
            return super().form_valid(form)

        
        uid = urlsafe_base64_encode(force_bytes(user.pk))
        token = default_token_generator.make_token(user)
        reset_url = self.request.build_absolute_uri(
            reverse('password_reset_confirm', kwargs={'uidb64': uid, 'token': token})
        )

        
        return TemplateResponse(
            self.request,
            'accounts/password_reset_done_with_link.html',
            {
                'reset_url': reset_url,
                'email': email,
            }
        )
    


from django.shortcuts import render
from .models import Attendance, EmployeeProfile
from datetime import date

@login_required
def attendance_dashboard(request):
    employees = EmployeeProfile.objects.all()
    records = Attendance.objects.all().order_by('-date')

    
    selected_employee = request.GET.get('employee')
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    if selected_employee:
        records = records.filter(employee_id=selected_employee)
    if start_date:
        records = records.filter(date__gte=start_date)
    if end_date:
        records = records.filter(date__lte=end_date)

    
    for record in records:
        if record.punch_in and record.punch_out:
            duration = record.punch_out - record.punch_in
            record.hours_worked = round(duration.total_seconds() / 3600, 2)
        else:
            record.hours_worked = None

    context = {
        'records': records,
        'employees': employees,
    }
    return render(request, 'accounts/attendance_dashboard.html', context)


from django.contrib import messages
from django.shortcuts import redirect
from django.utils import timezone
from .models import Attendance

@login_required
def punch_in(request):
    user = request.user
    today = timezone.localdate()

    profile = EmployeeProfile.objects.filter(user=user).first()
    if not profile:
        messages.error(request, "You must be logged in as an employee to punch in.")
        return redirect("my_attendance")

    existing = Attendance.objects.filter(
        user=user,
        date=today,
        punch_out__isnull=True
    ).first()
    if existing:
        messages.error(request, "You have already punched in. Please punch out before punching in again.")
        return redirect("my_attendance")

    Attendance.objects.create(
        user=user,
        employee=profile,
        date=today,
        punch_in=timezone.now(),
        shift="General",
    )
    messages.success(request, "Punch in recorded.")
    return redirect("my_attendance")



@login_required
def punch_out(request):
    user = request.user
    today = timezone.localdate()

    
    record = Attendance.objects.filter(
        user=user,
        date=today,
        punch_out__isnull=True
    ).first()
    if not record:
        messages.error(request, "You have not punched in yet.")
        return redirect('my_attendance')

    
    record.punch_out = timezone.now()
    record.save()
    messages.success(request, "Punch out recorded.")
    return redirect('my_attendance')



from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.utils import timezone
from .models import Attendance, EmployeeProfile, SHIFT_TIMES

@login_required
def my_attendance(request):
    
    try:
        profile = EmployeeProfile.objects.get(user=request.user)
    except EmployeeProfile.DoesNotExist:
        messages.error(request, "You do not have an employee profile. Attendance tracking is only for employees.")
        return redirect('hr_dashboard')  

    today = timezone.localdate()

    
    record = Attendance.objects.filter(employee=profile, date=today).first()

    if request.method == 'POST':
        action = request.POST.get('action')
        if action == 'punch_in':
            if record:
                messages.error(request, "You have already punched in today.")
            else:
                now = timezone.localtime()
                
                shift_start_time = SHIFT_TIMES['General'][0]
                scheduled_start = timezone.make_aware(datetime.combine(today, shift_start_time))

                
                late = now > scheduled_start + timedelta(minutes=10)

                Attendance.objects.create(
                    employee=profile,
                    user=request.user,
                    date=today,
                    punch_in=now,
                    shift='General',
                    late=late
                )
                if late:
                    messages.warning(request, "Punch in successful, but you are marked as late.")
                else:
                    messages.success(request, "Punch in successful. You are on time.")
            return redirect('my_attendance')

        elif action == 'punch_out':
            if not record:
                messages.error(request, "You have not punched in today.")
            elif record.punch_out:
                messages.error(request, "You have already punched out today.")
            else:
                now = timezone.now()
                duration = now - record.punch_in
                hours_worked = duration.total_seconds() / 3600

                if hours_worked < 4:
                    messages.error(request, "You cannot punch out before completing at least 4 hours.")
                else:
                    record.punch_out = now
                    record.save()
                    messages.success(request, "Punch out successful.")

    
    recent_records = Attendance.objects.filter(employee=profile).order_by('-date')[:30]

    context = {
        'record': record,
        'recent_records': recent_records,
    }
    return render(request, 'accounts/my_attendance.html', context)

@login_required
def view_employee_profile(request, emp_id):
    if request.user.role != "hr":
        return redirect("login")
    emp = get_object_or_404(EmployeeProfile, id=emp_id)
    return render(request, "accounts/employee_profile.html", {"emp": emp})












