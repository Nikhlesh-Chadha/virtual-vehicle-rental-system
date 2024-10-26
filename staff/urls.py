from django.conf.urls import url
from staff import views

app_name='staff'

urlpatterns = [
    url(r'^$',views.staffindex,name='staffindex'),
    url(r'^types/',views.add_vehiclestypes,name='add_vehiclestypes'),
    url(r'^company/',views.add_company,name='add_company'),
    url(r'^vehicles/',views.vehicles,name='vehicles'),
    url(r'^viewcompany/',views.viewcompany,name='viewcompany'),
    url(r'^viewtype/',views.viewtype,name='viewtype'),
    url(r'^viewall/',views.viewallvehicles,name='viewall'),
    url(r'^updatevehicle/',views.updatevehicle,name='updatevehicle'),
    url(r'^deletevehicle/',views.deletevehicle,name='deletevehicle'),

    ]
