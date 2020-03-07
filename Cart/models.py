from django.db import models
from Products import Product
from Users import User

class Cart(models.Model):
    cartUser= models.ForeignKey(User,on_delete=models.CASCADE)
    cartProduct= models.ForeignKey(Product,on_delete=models.CASCADE)
    addingDate =models.DateField()

    pass
