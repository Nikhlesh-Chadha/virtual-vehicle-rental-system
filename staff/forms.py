from django import forms
from staff.models import vehicle_types,vehicle_company,vehicles


class NewUserForm(forms.ModelForm):
    class Meta():
        model=vehicle_types
        exclude=["type_id","type_name","type_price"]

class NewUserFormcompany(forms.ModelForm):
    class Meta():
        model=vehicle_company
        exclude=["company_id","company_name"]

class NewUserFormvehicles(forms.ModelForm):
    class Meta():
        model=vehicles
        exclude=["vehicle_id","vehicle_name","vehicle_description",
                 "vehicle_image","type_id","company_id","vehicle_isavaliable","u_email"]

