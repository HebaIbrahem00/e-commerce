import datetime
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.template import loader
from Cart.models import Cart,Favorite
from user.models import User
from products.models import Product

def addToCart ( request , user_id, product_id):
#this shall be invoked when the button of addToCart is clicked
#here we will check first in the table if there is a record(cart) with the user_id, if not we will create else we will add 3latol??

    obj = Cart()
    obj.addingDate = datetime.datetime.now()
    obj.cartUser = User.objects.get(id=user_id)
    obj.cartProduct = Product.objects.get(id=product_id)
    obj.save()
    #return HttpResponse() of success and/or a pop up message telling the user so 

def showCart (request):
    user=request.user
    cart=Cart.objects.filter(cartUser__id=user.id)
    print(cart)
    return render(request , 'Cart.html', {'userCart':cart})



def deleteCartItem(request,id):
    Cart.objects.filter(cartProduct__id=id).delete()
    return redirect("cart:cartPage")
    


def moveToFav(request,id):
    user=request.user
    obj=Favorite()
    obj.userF=User.objects.get(id=user.id)
    obj.product=Product.objects.get(id=id)
    obj.save()


    Cart.objects.filter(cartProduct__id=id).delete()
    return redirect("cart:cartPage")






def showFav(request):
    user=request.user
    fav=Favorite.objects.filter(userF__id=user.id)
    print(fav)

    return render(request,'favorites.html',{'userFav':fav})  

def deleteFavItem(request,pid):
    Favorite.objects.filter(product__id=pid).delete()
    return redirect("cart:userFavorites")

def moveToCart(request,pid):
    user=request.user
    objx = Cart()
    objx.addingDate = datetime.datetime.now()
    objx.cartUser = User.objects.get(id=user.id)
    objx.cartProduct = Product.objects.get(id=pid)
    objx.save()
    Favorite.objects.filter(product__id=id).delete()

    return redirect("cart:userFavorites")    