from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse
from .models import Product
from django.template import loader
from .forms import CommentsForm
from .forms import ReviewsForm
from user.models import User


def displayAllProducts(request):
    pass
    latest_product_list = Product.objects.order_by('-product_rate')[:5]
    template = loader.get_template('products/homepage.html')
    context = {
        'latest_product_list': latest_product_list,
    }
    output = ', '.join(
        [product.product_name for product in latest_product_list])
    return HttpResponse(template.render(context, request))


def displayCatDetails(request, cat_id):
    return HttpResponse("You're looking for category %s." % cat_id)


def displayBrandDetails(request, brand_id):
    return HttpResponse("You're looking for Brand %s." % brand_id)


def displayProductDetails(request, product_id):
    # get_object_or_404(Product, pk=product_id)
    product = Product.objects.get(id=product_id)
    user = User.objects.get(id=request.user.id)
    template = 'products/ItemPage.html'
    if request.method == 'POST':
        form = CommentsForm(request.POST)
        if form.is_valid():
            new_form = form.save(commit=False)
            new_form.user = user
            new_form.product = product
            new_form.save()
    else:
        form = CommentsForm()
    context = {
        'form':  form,
        'product': product,
    }
    return render(request, template, context)


def Review(request, product_id):
    product = Product.objects.get(id=product_id)
    user = User.objects.get(id=request.user.id)
    template = 'products/ItemPage.html'
    if request.method == 'POST':
        form = ReviewsForm(request.POST)
        if form.is_valid():
            new_form = form.save(commit=False)
            new_form.user = user
            new_form.product = product
            new_form.save()
    else:
        form = ReviewsForm()
    context = {
        'form':  form,
    }
    return render(request, template, context)
