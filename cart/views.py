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
from .forms import CheckoutForm
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
    visa = Visa()
    order = Purchase()
  
    if request.method == "GET":

        form = CheckoutForm()
        return render(request ,'purchase.html', {'form':form,'cart':cart,'cartLen':cartlength})
        
    elif request.method == "POST":

        print("entered post")            
        form =CheckoutForm(request.POST or None)

        if form.is_valid():
            
            print("test" +form.cleaned_data)
           
            order.cartUser =user
            order.cart = cart

            address_option =form.cleaned_data.get('address_option')
            if address_option =='same':
                address = Profile.objects.filter(user__id=user.id).address1
                print(address)
                order.address = address
            else:
                address = form.data.get('shipping_address')
                order.address = address
                order.address_details = form.data.get('address_details')
                order.city = form.data.get('city')
            print(address_option)
            if form.cleaned_data.get('save_new_address'):
                order.save()


            payment =form.cleaned_data.get('payment_option')
            if payment =='cash':
                order.cash = True
                order.visaInfo = None
            else:
                order.cash = False
                visa.card_owner = form.cleaned_data.get('card_owner')
                visa.card_number = form.cleaned_data.get('card_number')
                visa.card_expiry = form.cleaned_data.get('card_expiry')
                visa.cvv = form.cleaned_data.get('cvv')

            if form.cleaned_data.get('save_card_info'):
                visa.save()


        return render(request ,'orderReady.html', {'cart':order.cart})

    else:
        print("form ain't valid??")
        #return redirect("cart:purchasePage") #here we may render the order page when we create one



