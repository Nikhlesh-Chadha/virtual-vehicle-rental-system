from django.shortcuts import render,redirect
from django.http import HttpResponse
from staff.forms import NewUserForm,NewUserFormcompany,NewUserFormvehicles
from staff.models import vehicle_types,vehicle_company,vehicles as v
from django.core.files.storage import FileSystemStorage



def add_vehiclestypes(request):
     form=NewUserForm()
     if request.method=="POST":
          form=NewUserForm(request.POST)
          f=form.save(commit=False)
          f.type_price=request.POST['price']
          #vehicletype=vehicle_types()
          id=int(request.POST['vehicletype'])
          if(id==1):
             f.type_name="Sport utility vehicle"

          if(id==2):
             f.type_name="Sedan"
          if(id==3):
            f.type_name="Hatchback"

          f.save()
          return  render(request,'vehicle_types.html',{'mymsg':'success'})
     else:
        print("form invalid")
     return render(request,'vehicle_types.html',{'form':form})
def add_company(request):
     form=NewUserFormcompany()
     if request.method=="POST":
          form=NewUserFormcompany(request.POST)
          f=form.save(commit=False)
          f.company_name=request.POST['company_name']
          f.save()
          return  render(request,'vehicle_company.html',{'mymsg':'success'})
     else:
        print("form invalid")
     return render(request,'vehicle_company.html',{'form':form})
def vehicles(request):
     #email=request.session['emailid']
     #usdata=v.objects.filter(u_email=email)
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
        return  render(request,'vehicles.html',{'mymsg':'success'})
     else:
        print("form invalid")

     company=vehicle_company.objects.all()
     vehicletype=vehicle_types.objects.all()

     return render(request,'vehicles.html',{'form':form,'company':company,'vehicletype':vehicletype})
def staffindex(request):
    if(request.session['authenticated']==True):
        return render(request,'staffindex.html')
    else:
        return render(request,'notlogin.html')

def viewcompany(request):
        company1=vehicle_company.objects.all()
        return render(request,'viewcompany.html',{'company1':company1})
def viewtype(request):
        viewtype=vehicle_types.objects.all()
        return render(request,'viewVehicle_type.html',{'viewtype':viewtype})
def viewallvehicles(request):
        view1=v.objects.all()
        viewtype=vehicle_types.objects.all()

        return render(request,'view_vehicles.html',{'view1':view1,'viewtype':viewtype})
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
        view1=v.objects.all()
        return render(request,'view_vehicles.html',{'id':vehicleid,'vehicle':selectvehicle,'view1':view1})
    return render(request,'updatevehicle.html',{'id':vehicleid,'vehicle':selectvehicle})
def deletevehicle(request):
        vehicleid=request.GET['id']
        try:
            deleteUser=v.objects.get(vehicle_id=vehicleid)
            #vd=deleteUser.vehicle_id
            deleteUser.delete()
            view1=v.objects.all()
            return render(request,'view_vehicles.html',{'view1':view1})
        except:
            view1=v.objects.all()
            return render(request,'view_vehicles.html',{'view1':view1})
        #view1=v.objects.all()
        #return render(request,'view_vehicles.html',{'deletedvehicle':'success','view1':view1})
