from django.conf.urls import url
from bussinessuser import views

app_name='bussinessuser'

urlpatterns = [
    url(r'^$',views.bussiness_index,name='bussiness_index'),
    url(r'^addvehicle',views.add_vehicle,name='add_vehicle'),
    url(r'^viewvehicle',views.viewvehicle,name='viewone'),
    url(r'^updatevehicle',views.updatevehicle,name='update'),
    url(r'^deletevehicle/',views.deletevehicle,name='delete'),

    ]
