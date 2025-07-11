from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Department, EmployeeProfile, HRProfile, CustomUser, SalaryRecord, BankDetail, TaxRecord, TrainingProgram, EmployeeTrainingRecord, AttendanceRecord, Attendance, Post
from .forms import CustomUserCreationForm 

class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    model = CustomUser
    list_display = ('username', 'role', 'email', 'is_staff', 'is_active')
    list_filter = ('role', 'is_staff', 'is_active')
    fieldsets = UserAdmin.fieldsets + (
        (None, {'fields': ('role',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'role', 'password1', 'password2'),
        }),
    )
    search_fields = ('username', 'email')
    ordering = ('username',)


admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(Department)
admin.site.register(EmployeeProfile)
admin.site.register(HRProfile)
admin.site.register(SalaryRecord)
admin.site.register(BankDetail)
admin.site.register(TaxRecord)
admin.site.register(TrainingProgram)
admin.site.register(EmployeeTrainingRecord)
admin.site.register(AttendanceRecord)
admin.site.register(Attendance)
admin.site.register(Post)