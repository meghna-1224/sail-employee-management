from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from .views import CustomPasswordResetView

urlpatterns = [
    path('', views.welcome, name="welcome"),
    path('employee/login/', views.employee_login, name='employee_login'),
    path('hr/login/', views.hr_login, name='hr_login'),
    path('logout/', views.user_logout, name="logout"),   
    path('employee/dashboard/', views.employee_dashboard, name="employee_dashboard"),
    path('employee/view-reports/', views.view_reports, name='view_reports'),
    path('employee/approve-requests/', views.approve_requests, name='approve_requests'),
    path('hr/dashboard/', views.hr_dashboard, name="hr_dashboard"),
    path('hr/add-employee/', views.add_employee, name="add_employee"),
    path('hr/employees/', views.employee_list, name="employee_list"),
    path('forgot-id/', views.forgot_id, name="forgot_id"),

    # ✅ Built-in password reset views
    path('forgot-password/', CustomPasswordResetView.as_view(), name='password_reset'),

    path('forgot-password/done/', auth_views.PasswordResetDoneView.as_view(
        template_name='accounts/password_reset_done.html'
    ), name='password_reset_done'),

    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(
        template_name='accounts/password_reset_confirm.html'
    ), name='password_reset_confirm'),

    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(
        template_name='accounts/password_reset_complete.html'
    ), name='password_reset_complete'),

    path("employee/<int:employee_id>/edit/", views.edit_employee, name="edit_employee"),
    path("employee/<int:employee_id>/delete/", views.delete_employee, name="delete_employee"),
    path("employee/<int:employee_id>/reset_password/", views.reset_employee_password, name="reset_employee_password"),
    path('change_password/', views.change_password, name='change_password'),
    path('hr/download-payroll-report/', views.download_payroll_report, name='download_payroll_report'),
    path('hr/view-bank-details/', views.view_bank_details, name='view_bank_details'),
    path('hr/view-tax-reports/', views.view_tax_reports, name='view_tax_reports'),
    path('training_hr/dashboard/', views.training_hr_dashboard, name='training_hr_dashboard'),
    path('training_hr/add/', views.add_training_program, name='add_training_program'),
    path('training_hr/assign/', views.assign_employee_training, name='assign_employee_training'),
    path('attendance-dashboard/', views.attendance_dashboard, name='attendance_dashboard'),
    path('punch-in/', views.punch_in, name='punch_in'),
    path('punch-out/', views.punch_out, name='punch_out'),
    path('my-attendance/', views.my_attendance, name='my_attendance'),
    path("employees/<int:emp_id>/profile/", views.view_employee_profile, name="view_employee_profile"),
]
