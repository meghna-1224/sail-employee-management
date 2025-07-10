from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.hashers import make_password
from .models import (
    CustomUser,
    Department,
    EmployeeProfile,
    Post,
    TrainingProgram,
    EmployeeTrainingRecord,
)

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ('email', 'role')

    def save(self, commit=True):
        user = super().save(commit=False)

        prefix = ''
        if user.role == 'employee':
            prefix = 'EMP'
        elif user.role == 'hr':
            prefix = 'HR'
        elif user.role == 'gm':
            prefix = 'GM'

        last_user = CustomUser.objects.filter(role=user.role).order_by('-id').first()
        if last_user and last_user.username.startswith(prefix):
            num = int(last_user.username.replace(prefix, '')) + 1
        else:
            num = 1

        user.username = f"{prefix}{num:04d}"

        if commit:
            user.save()
        return user


class EmployeeCreationForm(forms.Form):
    email = forms.EmailField(label="Email", required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)
    first_name = forms.CharField(max_length=30, required=True)
    last_name = forms.CharField(max_length=30, required=True)
    phone = forms.CharField(max_length=15, required=True)
    dob = forms.DateField(
        widget=forms.TextInput(attrs={"type": "date"}),
        required=True
    )
    department = forms.ModelChoiceField(queryset=Department.objects.all(), required=True)
    post = forms.ModelChoiceField(queryset=Post.objects.all(), required=True)  
    salary = forms.DecimalField(max_digits=10, decimal_places=2, required=True)  

    def save(self):
        # Determine next EMP ID
        last_user = CustomUser.objects.filter(role="employee").order_by("-id").first()
        if last_user and last_user.username.startswith("EMP"):
            num = int(last_user.username.replace("EMP", "")) + 1
        else:
            num = 1
        username = f"EMP{num:04d}"

        # Create user
        user = CustomUser.objects.create(
            username=username,
            email=self.cleaned_data["email"],
            password=make_password(self.cleaned_data["password"]),
            first_name=self.cleaned_data["first_name"],
            last_name=self.cleaned_data["last_name"],
            role="employee",
        )

        # Create employee profile
        EmployeeProfile.objects.create(
            user=user,
            phone=self.cleaned_data["phone"],
            dob=self.cleaned_data["dob"],
            department=self.cleaned_data["department"],
            post=self.cleaned_data["post"],
            salary=self.cleaned_data["salary"],
        )

        return user


class EmployeeEditForm(forms.ModelForm):
    class Meta:
        model = EmployeeProfile
        fields = ["phone", "dob", "department", "post", "salary"]  


class TrainingProgramForm(forms.ModelForm):
    class Meta:
        model = TrainingProgram
        fields = ['title', 'description', 'start_date', 'end_date', 'trainer', 'venue']


class EmployeeTrainingRecordForm(forms.ModelForm):
    class Meta:
        model = EmployeeTrainingRecord
        fields = ['employee', 'training_program', 'status', 'attendance']
