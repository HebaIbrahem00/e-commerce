from django.contrib import admin
from .models import Favourite
from .models import Reviews
from .models import Comments



admin.site.register(Favourite)
admin.site.register(Reviews)
admin.site.register(Comments)