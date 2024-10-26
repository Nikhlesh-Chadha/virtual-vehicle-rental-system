from django import forms
from users.models import user,booking,cancelcharges


class NewUserForm(forms.ModelForm):
    class Meta():
        model=user
        #fields='__all__'
        exclude=["user_id","user_name","user_mobile","user_dob","user_roleid","user_gender","user_email","user_image","user_password"]
class BookingForm(forms.ModelForm):
    class Meta():
        model=booking
        exclude=["vehicle_id","user_email","booking_id","pickup_point","location","reviews","booking_isactive"]

class cancelcharges_form(forms.ModelForm):
    class Meta():
        model=cancelcharges
        exclude=["cancel_id","booking_id","user_email","pending_charges","cancel_isactive"]
