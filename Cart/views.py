import datetime
from django.shortcuts import render
from django.http import HttpResponse

from django.template import loader
from Cart.models import Cart
from user.models import User
from products.models import Product

def addToCart ( request , user_id, product_id):
#this shall be invoked when the button of addToCart is clicked
    obj = Cart()
    obj.addingDate = datetime.datetime.now()
    obj.cartUser = User.objects.get(id=user_id)
    obj.cartProduct = Product.objects.get(id=product_id)
    obj.save()
    #return HttpResponse() of success and/or a pop up message telling the user so 

def showCart ( request):
    cart=Cart.objects.all() #list of all records in the cart 
    print(cart)

   # return render(request , 'Cart.html', {'userCart':cart,'productName':'','productImg':,'dateAdded':'cart.'})
    return render(request , 'Cart.html', {'userCart':cart})