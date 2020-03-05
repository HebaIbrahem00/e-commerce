from django.db import models

class Category(models.Model):
    cat_name = models.CharField(max_length=50)


class Sub_Category(models.Model):
    cat = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_cat_name = models.CharField(max_length=50)

class Brand(models.Model):
    sub_cat = models.ForeignKey(Sub_Category, on_delete=models.CASCADE)
    brand_name = models.CharField(max_length=50)

class Product(models.Model):
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=50)
    product_color = models.CharField(max_length=50)
    product_price = models.IntegerField()
    product_amount = models.IntegerField()
    product_rate = models.IntegerField()
    product_ratedby = models.IntegerField()