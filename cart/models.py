from django.db import models
from products.models import Product
from django.contrib.auth.models import User
from django.urls import reverse



class Cart(models.Model):
    cartUser = models.ForeignKey(User, on_delete=models.CASCADE)
    cartProduct = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.CharField(null=False, max_length=255, default="1")
    addingDate = models.DateField(auto_now=True)

  
    
    def productIdURLdel(self):

        return reverse("cart:deleteCartItem",kwargs={'id': self.cartProduct.id })

    def productIdURLmov(self):

        return reverse("cart:moveToFav",kwargs={'id': self.cartProduct.id })

    def cart(self):
        return reverse("cart:purchaseActual",kwargs={'cart':self})    


class Favorite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    addDate = models.DateField(auto_now=True)

    def pIdURLdel(self):

        return reverse("cart:deleteFavItem",kwargs={'pid': self.product.id })

    def pIdURLmov(self):

        return reverse("cart:moveToCart",kwargs={'pid': self.product.id })

