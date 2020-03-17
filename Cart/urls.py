from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls import url

app_name = 'cart'

urlpatterns = [

    path('Cart/', views.showCart ,name='cartPage'),
    path('deleteCartItem/<id>', views.deleteCartItem ,name='deleteCartItem'),
    path('move/<id>', views.moveToFav ,name='moveToFav'),

    path('favorites/', views.showFav ,name='userFavorites'),
    path('removeItem/<pid>', views.deleteFavItem ,name='deleteFavItem'),
    path('move/<pid>', views.moveToCart ,name='moveToCart'),
]
