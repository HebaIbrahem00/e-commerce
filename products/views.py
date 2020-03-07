from django.shortcuts import render
from django.http import HttpResponse
from .models import Product
from django.template import loader



def displayAllProducts(request):
    pass
    latest_product_list = Product.objects.order_by('-product_rate')[:5]
    template = loader.get_template('products/homepage.html')
    context = {
        'latest_product_list': latest_product_list,
    }
    output = ', '.join([product.product_name for product in latest_product_list])
    return HttpResponse(template.render(context, request))

def displayCatDetails(request, cat_id):
    return HttpResponse("You're looking for category %s." % cat_id)

def displayBrandDetails(request, brand_id):
    return HttpResponse("You're looking for Brand %s." % brand_id)

def displayProductDetails(request,product_id):
    return HttpResponse("You're looking for product %s." % product_id)
    