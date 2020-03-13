from django.db import models
from products.models import Product
from user.models import User

class Cart(models.Model):
    cartUser= models.ForeignKey(User,on_delete=models.CASCADE)
    cartProduct= models.ForeignKey(Product,on_delete=models.CASCADE)
    quantity = models.CharField(null=False,max_length=255,default="1")
    addingDate =models.DateField(auto_now= True)
