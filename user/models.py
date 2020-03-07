from django.db import models
from products.models import Product


class User(models.Model):
    firstName = models.CharField(null=False, max_length=20)
    last_name = models.CharField(null=False, max_length=20)
    email = models.EmailField(editable="true", null="false")
    phone = models.CharField(max_length=11, editable="true")
    gender = models.CharField(max_length=20)
    birthDate = models.DateField()
    address1 = models.TextField(editable="true")
    address2 = models.TextField(editable="true")
    creditNumber = models.CharField(max_length=19, editable="true")
    image = models.ImageField(upload_to="user_imgs")

    def _str_(self):
        # pass
        return self.firstName

class Favourite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    class Meta:
        unique_together =  ['user', 'product']



class Reviews(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    Review = models.IntegerField(null=False)
    Date = models.DateTimeField(null=False)
    class Meta:
        unique_together = ['user', 'product']


class Comments(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    Comment = models.CharField(max_length=250)
    Date = models.DateTimeField(null=False)
    class Meta:
        unique_together = ['user', 'product', 'Comment']
    