from django.shortcuts import render,redirect
from django.http import HttpResponse
from users.forms import NewUserForm,BookingForm,cancelcharges_form
from .models import user,UserRole,booking as b,cancelcharges
from staff.models import vehicle_types,vehicle_company,vehicles as v
import smtplib

from django.core.files.storage import FileSystemStorage
from django.shortcuts import get_object_or_404

from django.contrib.auth.hashers import make_password,check_password
from django.contrib.auth.hashers import BCryptSHA256PasswordHasher

# Create your views here.
def base(request):
    return render(request,'index.html')
def adminbase(request):
    return render(request,'adminbase.html')
def signup(request):
    form=NewUserForm()


    if request.method=="POST":
        #return  render(request,'success.html')
        user_image=None
        if request.FILES['user_image']:
            myfile=request.FILES['user_image']
            fs=FileSystemStorage()
            filename=fs.save(myfile.name,myfile)
            user_image=fs.url(filename)
            user_image=myfile.name

        form=NewUserForm(request.POST)
        #if form.is_valid():
        #return  render(request,'success.html')
        f=form.save(commit=False)
        f.user_name=request.POST['username']
        f.user_password=request.POST['password']
        f.con_password=request.POST['conpassword']
        f.user_password=make_password(request.POST['password'])
        f.user_mobile=request.POST['mobilenumber']
        f.user_dob=request.POST['dob']
        f.user_email=request.POST['emailid']
        f.user_image=user_image
        userrole=UserRole()
        id=int(request.POST['userrole'])
        if(id==1):
            userrole.role_id=1
            userrole.role_name="bussinessuser"
        if(id==2):
            userrole.role_id=2
            userrole.role_name="customer"
        f.user_roleid=userrole

        mobile=request.POST["mobilenumber"]
        u_pass=request.POST['password']
        c_pass=request.POST['conpassword']

        m=len(mobile)

        if(u_pass!=c_pass):
            return render(request,'signup.html',{'passwd':'passwd'})
        if(m<10):
            return render(request,'signup.html',{'mobileless':'mobileless'})
        if(m>10):
            return render(request,'signup.html',{'mobilegreater':'mobilegreater'})
        """if(isNAN(mobile)):
            return render(request,'signup.html',{'number':'number'})"""
        """if((mobile.charAt(0)!=9) and (mobile.charAt(0)!=8) and (mobile.charAt(0)!=7)):
            return render(request,'signup.html',{'startwith':'startwith'})"""


        f.save()
        return  render(request,'success.html')
    else:
        print("form invalid")
    return render(request,'signup.html',{'form':form})

def login(request):
    vid=0
    context={
        "message":"please log in",
        "error":False
    }
    if(request.GET["id"]):
        vid=request.GET["id"]
    if(request.method=="POST"):
        pwd=""
        try:
            getUser=user.objects.get(user_email=request.POST['username'])
            context['msg']=getUser
            pwd=request.POST['password']
            pwd2=getUser.user_password

            result=check_password(pwd,pwd2)
        except:
            context['message']="wrong username"
            context['error']=True

            return render(request,'login.html',{'wrnguname':'sucess'})

        if(result==True):
            request.session['authenticated']=True

            request.session['roleid']=getUser.user_roleid_id
            request.session['user_image']=getUser.user_image
            request.session['user_name']=getUser.user_name
            request.session['emailid']=request.POST["username"]
            request.session['password']=request.POST["password"]
            if(request.session['roleid']==1):
                return redirect('/bussinessuser/')
            if(request.session['roleid']==2):
                return redirect('/users/userindex/?vid='+vid)
            if(request.session['roleid']==3):
                return redirect('/company/')
            if(request.session['roleid']==4):
                return redirect('/staff/')
        else:
            context['message']="wrong password"
            context['error']=True
            return render(request,'login.html',{'wrngpass':'success'})



    #loginform=LoginUserForm()
    return render(request,'login.html',context)

def logout(request):
    return render(request,'successlogout.html')
def about(request):
    return render(request,'aboutus.html')
def contact(request):
    return render(request,'contact.html')

def profile_info(request):
    if(request.session['authenticated']==True):


         a=request.session['emailid']
         profiledata=user.objects.get(user_email=a)
         return render(request,'profile.html',{'profiledata':profiledata})
    else:
        return render(request,'notlogin.html')

def change_pass(request):
    if request.method=="POST":
        email=request.session["emailid"]
        oldpwd=request.POST['oldpassword']
        newpwd=request.POST['newpassword']
        conpwd=request.POST['conpassword']
        us=user.objects.get(user_email=email)
        b=us.user_password
        if(check_password(oldpwd,b)):
             if(newpwd==conpwd):
                 addUser=user(
                     user_email=email,
                     user_password=make_password(newpwd)
                 )
                 addUser.save(update_fields=["user_password"])
                 return render(request,'changePassword.html',{'correctpwd':'success'})
             else:
                return render(request,'changePassword.html',{'mismatchpassword':'sucess'})
        else:
            return render(request,'changePassword.html',{'wrngpwd':'success'})
    return render(request,'changePassword.html')

def updateprofile(request):
    emailid=request.GET["id"]
    selectprofile=user.objects.get(user_email=emailid)
    if request.method=="POST":
        user_image=None
        if request.FILES:
            myfile=request.FILES['user_image']
            fs=FileSystemStorage()
            filename=fs.save(myfile.name,myfile)
            user_image=fs.url(filename)
            user_image=myfile.name
        else:
            user_image=selectprofile.user_image
        email=request.POST['emailid']
        name=request.POST['user_name']
        dob=request.POST['dob']
        mobile=request.POST['mobilenumber']
        update=user(
                     user_email=email,
                     user_name=name,
                     user_dob=dob,
                     user_mobile=mobile,
                     user_image=user_image
                 )
        update.save(update_fields=["user_name","user_dob","user_mobile","user_image"])
        view1=user.objects.get(user_email=email)
        return render(request,'profile.html',{'id':emailid,'profile':selectprofile,'profiledata':view1})

    return render(request,'updateprofile.html',{'id':emailid,'profile':selectprofile})

def booking(request):
    view1=v.objects.all()
    viewtype=vehicle_types.objects.all()

    return render(request,'viewallvehicle.html',{'view1':view1,'viewtype':viewtype,'booked':'success'})
def category1(request):
    cat=request.GET["category"]
    id=0
    if(cat=="Sport utility vehicle"):
        id=1
    if(cat=="Sedan"):
        id=2
    if(cat=="Hatchback"):
        id=5
    view1=v.objects.all()
    viewtype=vehicle_types.objects.all()

    return render(request,'categoryvehicle.html',{'view1':view1,'id':id,'viewtype':viewtype})
def bookingvehicle(request):
    book=request.GET["id"]
    if(book>0):
        book1=v.objects.get(vehicle_id=book)
        return render(request,'booking_vehicle.html',{'book':book,'book1':book1})
def userindex(request):
    id=request.GET["vid"]

    if(request.session['authenticated']==True):

        email=request.session['emailid']
        usdata=b.objects.filter(user_email=email)


        if(int(id)>0):
            book1=v.objects.get(vehicle_id=id)
            book2=vehicle_types.objects.all()

            form=BookingForm()
            vehobj=v()
            emailobj=user()
            if request.method == "POST":

                form=BookingForm(request.POST)
                f=form.save(commit=False)
                f.booking_startdate=request.POST['booking_startdate']
                f.booking_enddate=request.POST['booking_enddate']
                f.location=request.POST['location']
                f.pickup_point=request.POST['pickup_point']
                vehobj.vehicle_id=request.POST['vehicle_id']
                f.vehicle_id=vehobj
                emailobj.user_email=request.session['emailid']
                f.user_email=emailobj
                f.save()
                update=v(vehicle_id=id,vehicle_isavaliable=0)
                update.save(update_fields=["vehicle_isavaliable"])
                view1=v.objects.all()
                try:
                    uname=request.session['emailid']
                    price=request.POST['type_price']
                    description=request.POST['vehicle_description']
                    emailsendbooking(uname,price,description)
                except:
                    return render(request,'userindex.html',{'usdata':usdata,'vid':id,'book1':book1,'book2':book2,'view1':view1})

                return render(request,'userindex.html',{'usdata':usdata,'vid':id,'book1':book1,'book2':book2,'view1':view1})

            else:

                return render(request,'userindex.html',{'usdata':usdata,'vid':id,'book1':book1,'book2':book2})


        return render(request,'userindex.html',{'usdata':usdata})

    else:
        return render(request,'notlogin.html')

def emailsendbooking(username,price,description):
    server=smtplib.SMTP("smtp.gmail.com",587)
    server.starttls()
    (220,b'2.7.0 Accepted')
    server.login('rk170195@gmail.com','123raman')
    server.sendmail('rk170195@gmail.com',username,
                    "Welcome to our VVRS."
                    "\n your vehicle price is"+price+
                    "and description is="+description)
    server.sendmail()
def forgotpassword(request):
    if(request.method == "POST"):
        pwd=""
        try:
            getUser=user.objects.get(user_email=request.POST['username'])
            pwd=getUser.user_password
            try:
                uname=request.POST['username']
                password=pwd
                emailsendfrgt(uname,password)
            except:
                pass
            return render(request,'login.html',{'frgtpass':'success'})
        except:
            return render(request,'forgotpassword.html',{'wrnguname':'success'})
    return render(request,'forgotpassword.html')
def emailsendfrgt(email,password):
    server=smtplib.SMTP("smtp.gmail.com",587)
    server.starttls()
    (220,b'2.7.0 Accepted')
    server.login('rk170195@gmail.com','123raman')
    server.sendmail('rk170195@gmail.com',email,
                    "\n your "+email+
                    "and password is="+password)
    server.sendmail()

def mybooking(request):

    userid=request.session["emailid"]
    cancel1=b.objects.filter(user_email=userid,booking_iscancel=0)
    id=0
    bid=0
    if(len(cancel1)>0):
        for i in cancel1:
            id=i.vehicle_id_id
            bid=i.booking_id


        id=int(id)
        bid=int(bid)
        bookdata=v.objects.filter(vehicle_id=id)
        bbid=0
        bkid=0
        bprice=0
        bvehid=id
        for i in bookdata:
            bbid=i.type_id_id
            #bkid=i.booking_id

        bookdate=b.objects.filter(booking_id=bid)
        vehtype=vehicle_types.objects.filter(type_id=bbid)
        for i in vehtype:

            bprice=i.type_price

        return render(request,'mybooking.html',{'cancel1':cancel1,'book_data':bookdata,'vehtype':vehtype,'bookdate':bookdate,'id':id,'bkid':bid,'bprice':bprice,'bvehid':bvehid})
    else:
        return render(request,'mybooking.html',{'cancel1':cancel1})



def cancel(request):
    bookingid=int(request.GET["id"])
    email=request.GET["ue"]
    price=request.GET["pr"]
    vehid=int(request.GET["vehid"])
    price=int(price)/2

    update=b(booking_id=bookingid,booking_iscancel=1)
    update.save(update_fields=["booking_iscancel"])

    update1=v(vehicle_id=vehid,vehicle_isavaliable=1)
    update1.save(update_fields=["vehicle_isavaliable"])

    ccf=cancelcharges_form()

    f=ccf.save(commit=False)
    f.pending_charges=price


    bobj=b()

    bobj.booking_id=bookingid

    f.booking_id=bobj

    uobj=user()
    uobj.user_email=email
    f.user_email=uobj
    f.cancel_isactive=1

    f.save()

    userid=request.session["emailid"]
    cancel1=b.objects.filter(user_email_id=userid,booking_iscancel=0)
    if(len(cancel1)>0):
        id=int(cancel1.vehicle_id_id)
        bookdata=v.objects.filter(vehicle_id=id)
        vehtype=vehicle_types.objects.get(type_id=bookdata.type_id_id)
        return render(request,'mybooking.html',{'cancel1':cancel1,'book_data':bookdata,'vehtype':vehtype,'mymsg1':'success' })
    else:
        return render(request,'mybooking.html',{'cancel1':cancel1})

