from django.contrib.auth.models import AbstractUser
from django.db import models
from django.conf import settings
from django.utils import timezone
from datetime import time

class CustomUser(AbstractUser):
    ROLE_CHOICES = (
        ('employee', 'Employee'),
        ('hr', 'HR'),
        ('gm', 'General Manager'),
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES)
    email = models.EmailField(unique=False, blank=True, null=True)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    def save(self, *args, **kwargs):
        if not self.username:
            prefix = ''
            if self.role == 'employee':
                prefix = 'EMP'
            elif self.role == 'hr':
                prefix = 'HR'
            elif self.role == 'gm':
                prefix = 'GM'

            last_user = CustomUser.objects.filter(role=self.role).order_by('-id').first()
            if last_user and last_user.username.startswith(prefix):
                num = int(last_user.username.replace(prefix, '')) + 1
            else:
                num = 1
            self.username = f"{prefix}{num:04d}"
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.username} ({self.role})"


class Department(models.Model):
    name = models.CharField(max_length=100)
    general_manager = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        limit_choices_to={'role': 'gm'},
        related_name='managed_departments'
    )

    def __str__(self):
        return self.name
    
class Post(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class EmployeeProfile(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15)
    dob = models.DateField()
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.SET_NULL, null=True, blank=True)
    date_of_joining = models.DateField(null=True, blank=True)
    supervisor = models.CharField(max_length=100, blank=True, null=True)
    department_location = models.CharField(max_length=100, blank=True, null=True)
    salary = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)  # 💰

    def __str__(self):
        return f"{self.user.username} - {self.user.email or 'No Email'}"
    
class SalaryRecord(models.Model):
    employee = models.ForeignKey(EmployeeProfile, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    month = models.DateField(help_text="Use the first day of the month to indicate which month this record is for")

    def __str__(self):
        return f"{self.employee.user.get_full_name()} - {self.month.strftime('%B %Y')} - ₹{self.amount}"


class HRProfile(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    contact_phone = models.CharField(max_length=15)

    hr_role = models.CharField(
        max_length=50,
        choices=[
            ('general', 'General HR'),
            ('payroll', 'Payroll HR'),
            ('training', 'Training HR'),
        ],
        default='general'
    )

    def __str__(self):
        return f"{self.user.username} - {self.get_hr_role_display()}"
    
    def department_name(self):
        if self.hr_role == 'general':
            return "Human Resources Department"
        elif self.hr_role == 'payroll':
            return "Payroll Department"
        elif self.hr_role == 'training':
            return "Training Department"
        return "HR Department"
    
class BankDetail(models.Model):
    employee = models.OneToOneField(EmployeeProfile, on_delete=models.CASCADE)
    bank_name = models.CharField(max_length=100)
    account_number = models.CharField(max_length=30)
    ifsc_code = models.CharField(max_length=20)
    verified = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.employee.user.username} - {self.bank_name}"

class TaxRecord(models.Model):
    employee = models.ForeignKey(EmployeeProfile, on_delete=models.CASCADE)
    financial_year = models.CharField(max_length=9)  # e.g., "2025-2026"
    tax_amount = models.DecimalField(max_digits=10, decimal_places=2)
    tax_percentage = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return f"{self.employee.user.username} - {self.financial_year}"
    

class TrainingProgram(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()
    trainer = models.CharField(max_length=100)
    venue = models.CharField(max_length=200)

    def __str__(self):
        return self.title

class EmployeeTrainingRecord(models.Model):
    STATUS_CHOICES = [
        ('ENROLLED', 'Enrolled'),
        ('COMPLETED', 'Completed'),
        ('PENDING', 'Pending'),
    ]

    employee = models.ForeignKey(EmployeeProfile, on_delete=models.CASCADE)
    training_program = models.ForeignKey(TrainingProgram, on_delete=models.CASCADE)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='ENROLLED')
    attendance = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.employee.user.get_full_name()} - {self.training_program.title}"

class AttendanceRecord(models.Model):
    employee = models.ForeignKey(EmployeeProfile, on_delete=models.CASCADE)
    punch_time = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return f"{self.employee.user.username} - {self.punch_time}"
    

SHIFT_TIMES = {
    'A': (time(6, 0), time(14, 0)),   # 6:00 AM – 2:00 PM
    'B': (time(14, 0), time(22, 0)),  # 2:00 PM – 10:00 PM
    'C': (time(22, 0), time(6, 0)),   # 10:00 PM – 6:00 AM (next day)
    "General": (time(9, 0), time(18, 0)),  # General Shift
}

class Attendance(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    employee = models.ForeignKey(EmployeeProfile, on_delete=models.CASCADE, null=True, blank=True)
    date = models.DateField()
    punch_in = models.DateTimeField()
    punch_out = models.DateTimeField(null=True, blank=True)  # allow empty
    shift = models.CharField(max_length=10)
    late = models.BooleanField(default=False)


    def __str__(self):
        return f"{self.user.username} - {self.date}"
    




