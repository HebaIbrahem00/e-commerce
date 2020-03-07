from django.db import models
from user.models import User
from products.models import Product
# for now this will store info when 

class Visa(models.Model):
    pass

class Purchase(models.Model):
    cartUser= models.ForeignKey(User,on_delete=models.CASCADE)
    cartProduct= models.ForeignKey(Product,on_delete=models.CASCADE)
    cash=models.BooleanField()  #if true visa coulmn would be null
    visaInfo=models.ForeignKey(Visa,on_delete=models.CASCADE)



