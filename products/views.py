from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from products.models import Product
# from products.models import Brand
from products.models import Sub_Category
from products.models import Category
from django.core.paginator import Paginator





def display_home_page(request):
    # latest_product_list = Product.objects.order_by('-product_rate')[:5]
    # latest_product_list = Product.objects.order_by('-product_rate')
    latest_cat_list = Category.objects.all()

    latest_product_list = Product.objects.all()
    paginator = Paginator(latest_product_list, 5)
    page_number = request.GET.get('page')
    latest_product_list = paginator.get_page(page_number)

    latest_sub_cat_list = Sub_Category.objects.order_by('-cat')
    # template = loader.get_template('products/index.html')
    context = {
        'latest_product_list': latest_product_list,
        'latest_sub_cat_list':latest_sub_cat_list,
        'latest_cat_list':latest_cat_list,
        'current_name':"mohamed",
    }
    return render(request, 'products/index.html', context)
    # return HttpResponse("You're looking for category %s." % latest_cat_list)
    # return HttpResponse(template.render(context, request))

def displayCatDetails(request, cat_id):
    latest_cat_list = Category.objects.all()
    table = ' products_product '
    brand_join_cond = ' join products_brand on brand_id = products_brand.id '
    sub_cat_join_cond = ' join products_sub_category on sub_cat_id = products_sub_category.id  '
    cat_join_cond =' join products_category on cat_id = products_category.id '
    condition = ' WHERE products_category.id = %s ' % cat_id

    query = 'SELECT * from '+table+brand_join_cond+sub_cat_join_cond+cat_join_cond+condition
    
    search_product_list = Product.objects.raw(query)
    paginator = Paginator(search_product_list, 5)
    page_number = request.GET.get('page')
    search_product_list = paginator.get_page(page_number)
    context = {
        'search_product_list': search_product_list,
        'latest_cat_list': latest_cat_list
    }

    return render(request, 'products/search.html', context)

    # return HttpResponse("You're looking for category %s." % cat_id)

def displaySubCatDetails(request, sub_category_id):
    latest_cat_list = Category.objects.all()

    join_condition = 'join products_brand on brand_id = products_brand.id join products_sub_category on sub_cat_id = products_sub_category.id '
    query = 'SELECT * FROM products_product '+join_condition+' WHERE products_sub_category.id = %s' % sub_category_id
    # print(query)
    search_product_list = Product.objects.raw(query)
    print(search_product_list)

    template = loader.get_template('products/search.html')
    context = {
        'search_product_list': search_product_list,
        'latest_cat_list': latest_cat_list
    }
    return HttpResponse(template.render(context, request))
    # sub_cat=Sub_Category.objects.filter(pk=sub_cat_id)
    # sub
    # sub_cat = Sub_Category.objects.get(id=1)
    # brands = sub_cat.brand_set.filter(sub_cat_id=sub_category_id)
    # brands = sub_cat.brand_set.all()
    # search_product_list=brands.product_set.all()
    # search_product_list = Product.objects.filter(brand=brands)
    # return HttpResponse("You're looking for sub_category %s." % brands)

def displayBrandDetails(request, brand_id):
    latest_cat_list = Category.objects.all()

    search_product_list = Product.objects.filter(brand_id=brand_id)
    print(search_product_list)
    template = loader.get_template('products/search.html')
    context = {
        'search_product_list': search_product_list,
        'latest_cat_list': latest_cat_list
    }
    return HttpResponse(template.render(context, request))
    # return HttpResponse("You're looking for Brand %s." % brand_id)

def displayProductDetails(request, product_id):
    try:
        product_details = Product.objects.get(pk=product_id)
        template = loader.get_template('products/item.html')
        context = {
            'product_details': product_details,
        }
        return HttpResponse(template.render(context, request))
    except Product.DoesNotExist:
        return HttpResponse("You're looking for non existing product" )

def displaySearchPage(request):
    latest_cat_list = Category.objects.all()

    product_name = request.GET.get('product_name')
    search_product_list = Product.objects.filter(product_name__contains=product_name)
    paginator = Paginator(search_product_list, 5)

    page_number = request.GET.get('page')
    search_product_list = paginator.get_page(page_number)
    context = {
        'search_product_list': search_product_list,
        'product_name':product_name,
        'latest_cat_list': latest_cat_list
    }
    return render(request, 'products/search.html', context)

def display_shop_page(request):
    template = loader.get_template('products/shop.html')
    context = {
        'search_product_list': "search_product_list",
    }
    return HttpResponse(template.render(context, request))