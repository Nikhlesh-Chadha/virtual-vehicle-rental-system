from django.conf.urls import url
from company import views

app_name='company'

urlpatterns = [
    #url(r'^signup/',views.signup,name='signup'),
    #url(r'^login/',views.login,name='login'),
    #url(r'^admin/',views.admin,name='admin'),
    url(r'^$',views.companyindex,name='companyindex'),
    url(r'^addstaff/',views.addstaff,name='addstaff'),
    url(r'^logout/',views.logout,name='logout'),
    ]
