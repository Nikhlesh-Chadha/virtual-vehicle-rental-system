from django.conf.urls import url
from users import views

app_name='users'

urlpatterns = [
        url(r'^$',views.base,name='base'),

    url(r'^signup/',views.signup,name='signup'),
    url(r'^login/',views.login,name='login'),
    url(r'^logout/',views.logout,name='logout'),
    url(r'^contact/',views.contact,name='contact'),
    url(r'^profile/',views.profile_info,name='profile_info'),
    url(r'^changepass/',views.change_pass,name='change_pass'),
    url(r'^updateprofile/',views.updateprofile,name='updateprofile'),
    url(r'^booking/',views.booking,name='booking'),

    url(r'^category/',views.category1,name='category1'),
    url(r'^bookvehicle/',views.bookingvehicle,name='bookingvehicle'),
    url(r'^userindex/',views.userindex,name='userindex'),
    url(r'^forgotpassword/',views.forgotpassword,name='forgotpassword'),
    url(r'^mybooking/',views.mybooking,name='mybooking'),
    url(r'^cancel/',views.cancel,name='cancel'),
        url(r'^about/',views.about,name='about'),

]
