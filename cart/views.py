import datetime
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.template import loader
from cart.models import Cart ,Favorite
from django.contrib.auth.models import User
from accounts.models import Profile
from products.models import Product
from purchase.models import Visa , Purchase 
from cart.forms import CheckoutForm
from django.http import HttpResponse, HttpResponseNotFound, Http404,  HttpResponseRedirect



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


def showPurchase(request):
    user =request.user
    cart =Cart.objects.filter(cartUser__id=user.id)
    cartlength =len(cart)
    form1 = CheckoutForm()
    return render(request ,'purchase.html', {'form':form1,'cart':cart,'cartLen':cartlength})
        
   


def handleForm(request):
    user =request.user

    cart=Cart.objects.filter(cartUser__id=user.id)
    visa = Visa()
    order = Purchase()          
    form = CheckoutForm(request.POST )
    address_option =form.data['address_option']
    print("adress option "+ address_option)
   # if form.is_valid():
    # form.save()
   # print("test" +form.cleaned_data)
            
    order.cartUser =user
    order.city = form.data['city']
    

        
    if address_option =='same':
        usr = Profile.objects.get(user__id=user.id) 
        address = usr.address1
        print(address)
        order.address = address
    else:
        address = form.data['shipping_address']
        order.address = address
        order.address_details = form.data['address_details']
        order.city = form.data['city']
       


    payment =form.data['payment_option']
    print(payment)
    if payment =='cash':
        order.cash = True
        order.visaInfo = None
    else:
        order.cash = False
        visa.card_owner = form.data.get('card_owner')
        visa.card_number = form.data.get('card_number')
        visa.card_expiry = form.data.get('card_expiry')
        visa.cvv = form.data.get('cvv')

    if form.data.get('save_card_info'):
        visa.save()


   # Cart.objects.filter(cartUser__id=user.id).delete()            
        
        
    return render(request ,'orderReady.html', {'cart':cart, 'order':order,'payment':payment})

    
    