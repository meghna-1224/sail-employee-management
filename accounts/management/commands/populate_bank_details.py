from django.core.management.base import BaseCommand
from accounts.models import EmployeeProfile, BankDetail
from faker import Faker
from random import choice, randint

class Command(BaseCommand):
    help = "Populate sample bank details for all employees"

    def handle(self, *args, **kwargs):
        fake = Faker()
        bank_names = [
            "State Bank of India", "HDFC Bank", "ICICI Bank", "Axis Bank", "Punjab National Bank"
        ]

        created_count = 0

        for emp in EmployeeProfile.objects.all():
            if not hasattr(emp, 'bankdetail'):
                bank = choice(bank_names)
                acc_no = ''.join([str(randint(0, 9)) for _ in range(12)])
                ifsc = bank[:4].upper() + '0' + str(randint(1000, 9999))

                BankDetail.objects.create(
                    employee=emp,
                    bank_name=bank,
                    account_number=acc_no,
                    ifsc_code=ifsc,
                    verified=choice([True, False])
                )
                created_count += 1

        self.stdout.write(self.style.SUCCESS(f"✅ Created {created_count} bank detail records."))
