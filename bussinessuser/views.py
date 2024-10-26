from django.shortcuts import render,redirect
from django.http import HttpResponse
from staff.forms import NewUserForm,NewUserFormcompany,NewUserFormvehicles
from staff.models import vehicle_types,vehicle_company,vehicles as v
from users.models import user
from django.core.files.storage import FileSystemStorage

def bussiness_index(request):
        return render(request,'bussiness_index.html')
def add_vehicle(request):
     email=request.session['emailid']
     usdata=v.objects.filter(u_email=email)
     form=NewUserFormvehicles()
     if request.method=="POST":
        vehicle_image=None
        if request.FILES['vehicle_image']:
            myfile=request.FILES['vehicle_image']
            fs=FileSystemStorage()
            filename=fs.save(myfile.name,myfile)
            vehicle_image=fs.url(filename)
            vehicle_image=myfile.name

        form=NewUserFormvehicles(request.POST)
        f=form.save(commit=False)
        f.vehicle_name=request.POST['vehicle_name']
        f.vehicle_description=request.POST['vehicle_description']
        f.vehicle_image=vehicle_image
        f.u_email=request.session['emailid']

        typerole=vehicle_types()
        id=int(request.POST['typerole'])
        if(id==1):
            typerole.type_id=1
            typerole.type_name="Sport utility vehicle"
            typerole.type_price=20000
        if(id==2):
            typerole.type_id=2
            typerole.type_name="Sedan"
            typerole.type_price=30000
        if(id==5):
            typerole.type_id=5
            typerole.type_name="Sedan"
            typerole.type_price=40000

        f.type_id=typerole

        companyrole=vehicle_company()
        id=int(request.POST['companyrole'])
        if(id==1):
            companyrole.company_id=1
            companyrole.company_name="honda"
        if(id==2):
            companyrole.company_id=2
            companyrole.company_name="maruti"
        if(id==3):
            companyrole.company_id=3
            companyrole.company_name="skoda"
        if(id==4):
            companyrole.company_id=4
            companyrole.company_name="hyundai"
        if(id==5):
            companyrole.company_id=3
            companyrole.company_name="nissan"


        f.company_id=companyrole

        f.save()
        return  render(request,'add_vehicle.html',{'mymsg':'success','usdata':usdata})
     else:
        print("form invalid")

     company=vehicle_company.objects.all()
     vehicletype=vehicle_types.objects.all()

     return render(request,'add_vehicle.html',{'form':form,'company':company,'vehicletype':vehicletype,'usdata':usdata})

def viewvehicle(request):

        #vehicleid=request.GET["id"]
        #view1=v.objects.get(vehicle_id=vehicleid)
        email=request.session['emailid']
        view1=v.objects.filter(u_email=email)
        viewtype=vehicle_types.objects.all()
        return render(request,'viewvehicles.html',{'view1':view1,'viewtype':viewtype})
def updatevehicle(request):
    vehicleid=request.GET["id"]
    selectvehicle=v.objects.get(vehicle_id=vehicleid)
    if request.method=="POST":
        veh_image=None
        if request.FILES:
            myfile=request.FILES['vehicle_image']
            fs=FileSystemStorage()
            filename=fs.save(myfile.name,myfile)
            veh_image=fs.url(filename)
            veh_image=myfile.name
        else:
            veh_image=selectvehicle.vehicle_image
        name=request.POST['vehicle_name']
        description=request.POST['vehicle_description']
        image=veh_image

        update=v(
                    vehicle_id=vehicleid,
                     vehicle_name=name,
                     vehicle_description=description,
                     vehicle_image=veh_image
                 )
        update.save(update_fields=["vehicle_name","vehicle_description","vehicle_image"])
        view1=v.objects.filter(vehicle_id=vehicleid)
        return render(request,'viewvehicles.html',{'id':vehicleid,'vehicle':selectvehicle,'view1':view1})
    return render(request,'updatevehicle_bussi.html',{'id':vehicleid,'vehicle':selectvehicle})
def deletevehicle(request):
        vehicleid=request.GET['id']
        try:
            deleteUser=v.objects.get(vehicle_id=vehicleid)
            #vd=deleteUser.vehicle_id
            deleteUser.delete()
            view1=v.objects.all()
            return render(request,'viewvehicles.html',{'view1':view1})
        except:
            view1=v.objects.all()
            return render(request,'viewvehicles.html',{'view1':view1})
