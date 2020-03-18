import datetime
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.template import loader
from cart.models import Cart ,Favorite
from user.models import User
from products.models import Product



def showCart (request):
    user=request.user
    cart=Cart.objects.filter(cartUser__id=user.id)
    print(cart)
    totalCost=0
    for item in cart:
        totalCost+=item.cartProduct.product_price
    return render(request , 'cart.html', {'userCart':cart,'total':totalCost})



def deleteCartItem(request,id):
    Cart.objects.filter(cartProduct__id=id).delete()
    return redirect("cart:cartPage")
    


def moveToFav(request,id):
    user=request.user
    obj=Favorite()
    obj.user=User.objects.get(id=user.id)
    obj.product=Product.objects.get(id=id)
    obj.save()


    Cart.objects.filter(cartProduct__id=id).delete()
    return redirect("cart:cartPage")




def showFav(request):
    user=request.user
    fav=Favorite.objects.filter(user__id=user.id)
    print(fav)

    return render(request,'favorites.html',{'userFav':fav})  

def deleteFavItem(request,pid):

    Favorite.objects.filter(product__id=pid).delete()
    return redirect("cart:userFavorites")

def moveToCart(request , pid):

    user =request.user
    objx = Cart()
    objx.addingDate = datetime.datetime.now()
    objx.cartUser = User.objects.get(id=user.id)
    objx.cartProduct = Product.objects.get(id=pid)
    objx.quantity=1
    objx.save()
    Favorite.objects.filter(product__id=pid).delete()

    return redirect("cart:userFavorites")  
