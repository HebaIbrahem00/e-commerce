from django.conf.urls import url
from django.urls import path
from . import views

app_name = 'accounts'
urlpatterns = [
   
   # path('profile/<slug:slug>', views.profile, name='profile'),
    path('view_profile/', views.edit_profile, name='view_profile'),
    path('view_profile/edit_profile/', views.edit_profile, name='edit_profile'),
    path('delete_profile/', views.delete_profile, name='delete_profile'),
    path('delete_user/', views.delete_user, name='delete_user'),
]
