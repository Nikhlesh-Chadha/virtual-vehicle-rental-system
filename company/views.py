from django.shortcuts import render,redirect
from django.http import HttpResponse
from users.forms import NewUserForm
from users.models import user,UserRole
import smtplib
from django.core.files.storage import FileSystemStorage

from django.contrib.auth.hashers import make_password,check_password
from django.contrib.auth.hashers import BCryptSHA256PasswordHasher

def companyindex(request):

    if(request.session['authenticated']==True):
        return render(request,'companyindex.html')
    else:
        return render(request,'notlogin.html')
def addstaff(request):
 #mymsg={"message":""}
 if(request.session['authenticated']==True):

     if request.method=="POST":
        user_image=None
        if request.FILES['user_image']:
            myfile=request.FILES['user_image']
            fs=FileSystemStorage()
            filename=fs.save(myfile.name,myfile)
            user_image=fs.url(filename)
            user_image=myfile.name
        #return  render(request,'success.html')
        form=NewUserForm(request.POST)
        f=form.save(commit=False)
        f.user_name=request.POST['username']
        f.user_password=request.POST['password']
        f.user_password=make_password(request.POST['password'])
        f.user_mobile=request.POST['mobilenumber']
        f.user_dob=request.POST['dob']
        f.user_email=request.POST['emailid']
        f.user_image=user_image
        userrole=UserRole()

        userrole.role_id=4
        userrole.role_name="staff"
        #f.userrole.role_id=userrole
        f.user_roleid=userrole

        f.save()
        try:
            uname=request.POST['emailid']
            password=request.POST['password']
            emailsend(uname,password)
        except:
            pass

        return render(request,'addstaff.html',{'mymsg':'success'})
     else:
        print("invalid")

     return render(request,'addstaff.html')
 else:
      return render(request,'notlogin.html')

def logout(request):
     request.session['authenticated']=False
     return redirect('/users/logout/')

def emailsend(username,password):
    server=smtplib.SMTP("smtp.gmail.com",587)
    server.starttls()
    (220,b'2.7.0 Accepted')
    server.login('rk170195@gmail.com','123raman')
    server.sendmail('rk170195@gmail.com',username,
                    "Welcome to our VVRS."
                    "\n your userid is"+username+
                    "and password is="+password)
    server.sendmail()
