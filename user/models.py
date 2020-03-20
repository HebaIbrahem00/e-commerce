from django.db import models
from products.models import Product
from django.utils import timezone
from django.contrib.auth.models import User

class Favourite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    
    class Meta:
        unique_together =  ['user', 'product']



class Reviews(models.Model):
    RATING_CHOICES = (
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    )
    user = models.ForeignKey(User, on_delete = models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    Review = models.IntegerField(choices=RATING_CHOICES)
    #Review = models.IntegerField(null=False)
    Date = models.DateTimeField(null=False, default=timezone.now)

    class Meta:
        unique_together = ['user', 'product']



class Comments(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    Comment = models.CharField(max_length=250)
    Date = models.DateTimeField(null=False,  default=timezone.now)
    class Meta:
        unique_together = ['user', 'product', 'Comment']
    
