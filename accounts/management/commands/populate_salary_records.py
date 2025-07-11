from django.core.management.base import BaseCommand
from accounts.models import EmployeeProfile, TaxRecord
from faker import Faker
import random
from decimal import Decimal

class Command(BaseCommand):
    help = "Populate sample tax records for all employees without duplication"

    def handle(self, *args, **kwargs):
        fake = Faker()
        employees = EmployeeProfile.objects.all()

        
        financial_years = ["2022-2023", "2023-2024", "2024-2025"]

        created_count = 0
        skipped_count = 0

        for emp in employees:
            for year in financial_years:
                
                if TaxRecord.objects.filter(employee=emp, financial_year=year).exists():
                    skipped_count += 1
                    continue

                
                tax_percentage = round(random.uniform(5, 30), 2)
                tax_percentage_decimal = Decimal(str(tax_percentage))

                
                if emp.salary:
                    tax_amount = (emp.salary * tax_percentage_decimal) / Decimal('100')
                else:
                    tax_amount = Decimal(str(round(random.uniform(20000, 100000), 2)))

                
                TaxRecord.objects.create(
                    employee=emp,
                    financial_year=year,
                    tax_amount=tax_amount,
                    tax_percentage=tax_percentage_decimal,
                )
                created_count += 1

        self.stdout.write(
            self.style.SUCCESS(f"✅ Created {created_count} tax records. Skipped {skipped_count} existing records.")
        )
