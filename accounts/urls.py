from django.conf.urls import url
from django.urls import path
from . import views

app_name = 'accounts'
urlpatterns = [
   
    path('profile/<slug:slug>', views.profile, name='profile'),

]
