from django.db import models
from user.models import User
from products.models import Product
from cart.models import Cart

from creditcards.models import CardNumberField, CardExpiryField, SecurityCodeField

class Visa(models.Model):

    card_owner = models.CharField(max_length=100, blank=True)
    card_number = CardNumberField(('card number') ,null=True)
    card_expiry = CardExpiryField(('expiration date'), null=True)
    cvv = SecurityCodeField(('security code'), null=True)

    


class Purchase(models.Model):
    cartUser = models.ForeignKey(User,on_delete=models.CASCADE)
    cart = models.ForeignKey(Cart,on_delete=models.CASCADE ,null= True)
    cash =models.BooleanField()  #if true visa coulmn would be null
    visaInfo = models.ForeignKey(Visa ,on_delete=models.CASCADE)
    address = models.CharField(max_length=100, blank=True)
    address_details = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=100, blank=True)


 