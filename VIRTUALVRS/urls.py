"""VIRUALVRS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from users import views
from django.conf.urls.static import static
from django.conf import settings

app_name="home"

urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$',views.base,name='base'),
    url(r'^adminbase/',views.adminbase,name='adminbase'),
    url(r'^users/',include('users.urls')),
    url(r'^company/',include('company.urls')),
    url(r'^staff/',include('staff.urls')),
    url(r'^bussinessuser/',include('bussinessuser.urls')),
    #url(r'^base1/',views.base1,name='base1'),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
