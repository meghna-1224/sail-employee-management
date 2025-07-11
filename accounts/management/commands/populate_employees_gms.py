from django.core.management.base import BaseCommand
from accounts.models import CustomUser, EmployeeProfile, Department
from faker import Faker
import random

class Command(BaseCommand):
    help = "Bulk create Employees and General Managers, assigning supervisor names properly."

    def handle(self, *args, **kwargs):
        fake = Faker()

        
        excluded_departments = ["C&IT", "Legal & Corporate Affairs"]
        departments = Department.objects.exclude(name__in=excluded_departments)

        if not departments.exists():
            self.stdout.write(self.style.ERROR("No departments left to assign employees!"))
            return

        num_employees = 10

        for _ in range(num_employees):
            department = random.choice(departments)

            supervisor_name = (
                f"{department.general_manager.first_name} {department.general_manager.last_name}"
                if department.general_manager
                else "Not Assigned"
            )

            
            user = CustomUser.objects.create_user(
                username=None,  
                password="EMPsecure@123",
                email=fake.email(),
                first_name=fake.first_name(),
                last_name=fake.last_name(),
                role="employee"
            )

            
            EmployeeProfile.objects.create(
                user=user,
                phone=fake.numerify(text="9#########"),
                dob=fake.date_of_birth(minimum_age=22, maximum_age=60),
                department=department,
                date_of_joining=fake.date_between(start_date="-4y", end_date="today"),
                supervisor=supervisor_name,
                department_location=fake.city(),
                salary=random.randint(30000, 80000)
            )

        self.stdout.write(self.style.SUCCESS(f"✅ Created {num_employees} Employee records."))

        
        num_gms = 3

        for _ in range(num_gms):
            gm_user = CustomUser.objects.create_user(
                username=None,  
                password="GMsecure@123",
                email=fake.email(),
                first_name=fake.first_name(),
                last_name=fake.last_name(),
                role="gm"
            )

        self.stdout.write(self.style.SUCCESS(f"✅ Created {num_gms} General Manager records."))
