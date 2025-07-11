from django.core.management.base import BaseCommand
from accounts.models import Attendance, EmployeeProfile
from accounts.models import SHIFT_TIMES
from django.utils import timezone
import random
from datetime import timedelta, datetime

class Command(BaseCommand):
    help = 'Generate simulated attendance records for all employees'

    def handle(self, *args, **options):
        employees = EmployeeProfile.objects.all()
        if not employees:
            self.stdout.write(self.style.WARNING("No employees found."))
            return

        today = timezone.now().date()

        for employee in employees:
            for i in range(10):  
                
                random_days_ago = random.randint(1, 30)
                day = today - timedelta(days=random_days_ago)

                
                shift_label = random.choice(['A', 'B', 'C', 'General'])
                shift_start, shift_end = SHIFT_TIMES[shift_label]

                
                punch_in_time = datetime.combine(day, shift_start) + timedelta(minutes=random.randint(0, 15))

                
                scheduled_start = datetime.combine(day, shift_start)
                grace_time = scheduled_start + timedelta(minutes=10)
                late = punch_in_time > grace_time

                
                if shift_label == 'C' and shift_end < shift_start:
                    punch_out_day = day + timedelta(days=1)
                else:
                    punch_out_day = day

                punch_out_time = datetime.combine(punch_out_day, shift_end) + timedelta(minutes=random.randint(0, 15))

                
                Attendance.objects.create(
                    employee=employee,
                    user=employee.user,
                    date=day,
                    punch_in=punch_in_time,
                    punch_out=punch_out_time,
                    shift=shift_label,
                    late=late  
                )

                self.stdout.write(self.style.SUCCESS(
                    f"Generated attendance for {employee.user.username} on {day} ({shift_label} shift, {'late' if late else 'on time'})"
                ))
