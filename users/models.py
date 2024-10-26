from django.db import models
from staff.models import vehicles

# Create your models here.
class UserRole(models.Model):
    role_id=models.AutoField(primary_key=True)
    role_name=models.CharField(max_length=255,default="",unique=True)

    def __str__(self):
        return self.role_name

class user(models.Model):

    user_roleid=models.ForeignKey(UserRole,on_delete=models.CASCADE,default="")
    #user_id=models.AutoField(primary_key=True)
    user_name=models.CharField(max_length=255,default="")
    user_password=models.CharField(max_length=500,default="")
    #con_password=models.CharField(max_length=500,default="")
    user_email=models.EmailField(primary_key=True,max_length=255,default="")
    user_mobile=models.CharField(max_length=255,default="")
    #user_gender=models.CharField(max_length=10,default="")
    user_dob=models.CharField(max_length=255,default="")
    user_image=models.CharField(max_length=255,null=True)
    user_isactive=models.BooleanField(default=True)
    def __str__(self):
        return self.user_name
class booking(models.Model):
    vehicle_id=models.ForeignKey(vehicles,on_delete=models.CASCADE,default="")
    user_email=models.ForeignKey(user,on_delete=models.CASCADE,default="")

    booking_id=models.AutoField(primary_key=True)

    booking_startdate=models.CharField(max_length=255,default="")
    booking_enddate=models.CharField(max_length=255,default="")

    pickup_point=models.CharField(max_length=255,default="")
    location=models.CharField(max_length=255,default="")
    reviews=models.CharField(max_length=255,null=True)
    booking_iscancel=models.BooleanField(default=False)

    booking_isactive=models.BooleanField(default=True)

    def __str__(self):
        return self.location

class cancelcharges(models.Model):
    cancel_id=models.AutoField(primary_key=True)
    booking_id=models.ForeignKey(booking,on_delete=models.CASCADE,default="")
    user_email=models.ForeignKey(user,on_delete=models.CASCADE,default="")
    pending_charges=models.IntegerField(default="")

    cancel_isactive=models.BooleanField(default=True)

    def __str__(self):
        return self.pending_charges


