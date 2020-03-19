from django.db import models
# from user.models import User

class Category(models.Model):
    cat_name = models.CharField(max_length=50)
    # cat_img = models.ImageField(upload_to="cat_imgs",default="empty.jpg")

    def __str__(self):
        return self.cat_name

class Sub_Category(models.Model):
    cat = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_cat_name = models.CharField(max_length=50)
    #sub_cat_img = models.ImageField(upload_to="subcat_imgs",default="subcat_imgs/empty.jpg")


    def __str__(self):
        return self.sub_cat_name

class Brand(models.Model):
    sub_cat = models.ForeignKey(Sub_Category, on_delete=models.CASCADE)
    brand_name = models.CharField(max_length=50)

    def __str__(self):
        return self.brand_name+" "+self.sub_cat.sub_cat_name

class Product(models.Model):
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=50)
    product_color = models.CharField(max_length=50)
    product_price = models.IntegerField()
    product_amount = models.IntegerField()
    product_rate = models.IntegerField()
    product_desc = models.TextField(null=True, blank=True)
    # product_ratedby = models.IntegerField()
    image1 = models.ImageField(upload_to="product_imgs",default="product_imgs/empty.png")
    image2 = models.ImageField(upload_to="product_imgs",default="product_imgs/empty.png")
    image3 = models.ImageField(upload_to="product_imgs",default="product_imgs/empty.png")
    
    def __str__(self):
        return self.product_name
    
    
