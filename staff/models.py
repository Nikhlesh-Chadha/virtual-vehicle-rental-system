from django.db import models
#from users.models import user


# Create your models here.
class vehicle_types(models.Model):
    type_id=models.AutoField(primary_key=True)
    type_name=models.CharField(max_length=255,default="")
    type_price=models.IntegerField(default="")
    type_isactive=models.BooleanField(default=True)
    def __str__(self):
        return self.type_name

class vehicle_company(models.Model):
    company_id=models.AutoField(primary_key=True)
    company_name=models.CharField(max_length=255,default="")
    company_isactive=models.BooleanField(default=True)
    def __str__(self):
        return self.company_name

class vehicles(models.Model):
    vehicle_id=models.AutoField(primary_key=True)
    vehicle_name=models.CharField(max_length=255,default="")
    vehicle_description=models.CharField(max_length=255,default="")
    vehicle_image=models.CharField(max_length=255,null=True)
    type_id=models.ForeignKey(vehicle_types,on_delete=models.CASCADE,default="")
    company_id=models.ForeignKey(vehicle_company,on_delete=models.CASCADE,default="")
    vehicles_isactive=models.BooleanField(default=True)
    vehicle_isavaliable=models.BooleanField(default=True)
    u_email=models.CharField(max_length=255,default="",null=True)


    def __str__(self):
        return self.vehicle_name

