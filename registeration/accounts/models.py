from django.db import models
# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
import datetime
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100, blank=True)
    last_name = models.CharField(max_length=100, blank=True)
    email = models.EmailField(max_length=150)
    phone = models.CharField(max_length=11, editable="true",blank=True)
    gender = models.CharField(default='F',max_length=20)
    birthDate = models.DateField(default=datetime.date.today)
    address1 = models.TextField(editable="true",max_length=100,blank=True)
    address2 = models.TextField(editable="true",max_length=100,blank=True)
    slug = models.SlugField(blank=True,null=True)
    image = models.ImageField(("image"),upload_to='profile_img',blank=True ,null=True)
    creditNumber = models.CharField(max_length=19, editable="true",blank=True)
    signup_confirmation = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username

@receiver(post_save, sender=User)
def update_profile_signal(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()