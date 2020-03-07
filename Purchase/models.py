from django.db import models

# for now this will store info when 

class Purchase(models.Model):
     cartUser= models.ForeignKey(User,on_delete=models.CASCADE)
    cartProduct= models.ForeignKey(Product,on_delete=models.CASCADE)
    cash=models.BooleanField()  #if true visa coulmn would be null
    visaInfo=models.ForeignKey(Visa,on_delete=models.CASCADE)



class Visa(models.Model):
    pass