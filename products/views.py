from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.db import connection
from django.db import IntegrityError
from django.contrib import messages
from django.template import RequestContext
from django.template import loader
from products.models import Product
from products.models import Brand
from products.models import Sub_Category
from products.models import Category
from .forms import CommentsForm
from .forms import ReviewsForm
from .forms import AddToCartForm
from django.core.paginator import Paginator
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404
from products.forms import CommentsForm
from .forms import ReviewsForm
from user.models import Comments
from user.models import Reviews
from django.core import serializers
from django.http import JsonResponse
from cart.models import Cart
from cart.models import Favorite
from django.shortcuts import redirect



def display_home_page(request):
    # latest_product_list = Product.objects.order_by('-product_rate')[:5]
    # latest_product_list = Product.objects.order_by('-product_rate')
    cat_list = Category.objects.all()
    sub_cat_list = Sub_Category.objects.all()
    brands_list = Brand.objects.all()

    latest_product_list = Product.objects.all()
    paginator = Paginator(latest_product_list, 6)
    page_number = request.GET.get("page")
    latest_product_list = paginator.get_page(page_number)

    # latest_sub_cat_list = Sub_Category.objects.order_by('-cat')
    # template = loader.get_template('products/index.html')
    context = {
        "latest_product_list": latest_product_list,
        "cat_list": cat_list,
        "sub_cat_list": sub_cat_list,
        "brands_list": brands_list,
        "current_name": "mohamed",
    }
    return render(request, "products/index.html", context)
    # return HttpResponse("You're looking for category %s." % latest_cat_list)
    # return HttpResponse(template.render(context, request))


def displayCatDetails(request, cat_id):
    cat_list = Category.objects.all()
    sub_cat_list = Sub_Category.objects.all()
    brands_list = Brand.objects.all()
    cat_name = Category.objects.get(id=cat_id)
    sub_cats_for_this_cat = Sub_Category.objects.filter(cat_id=cat_id)
    table = " products_product "
    brand_join_cond = " join products_brand on brand_id = products_brand.id "
    sub_cat_join_cond = (
        " join products_sub_category on sub_cat_id = products_sub_category.id  "
    )
    cat_join_cond = " join products_category on cat_id = products_category.id "
    condition = " WHERE products_category.id = %s " % cat_id

    query = (
        "SELECT * from "
        + table
        + brand_join_cond
        + sub_cat_join_cond
        + cat_join_cond
        + condition
    )

    search_product_list = Product.objects.raw(query)
    paginator = Paginator(search_product_list, 6)
    page_number = request.GET.get("page")
    search_product_list = paginator.get_page(page_number)
    context = {
        "search_product_list": search_product_list,
        "cat_list": cat_list,
        "sub_cat_list": sub_cat_list,
        "brands_list": brands_list,
        "has_collapse_menu": "true",
        "cat_name": cat_name,
        "sub_cats_for_this_cat": sub_cats_for_this_cat,
    }

    return render(request, "products/search.html", context)

    # return HttpResponse("You're looking for category %s." % cat_id)


def displaySubCatDetails(request, sub_category_id):
    cat_list = Category.objects.all()
    sub_cat_list = Sub_Category.objects.all()
    brands_list = Brand.objects.all()
    sub_cat = Sub_Category.objects.get(id=sub_category_id)
    brands_for_this_sub_cat = Brand.objects.filter(sub_cat=sub_category_id)

    join_condition = "join products_brand on brand_id = products_brand.id join products_sub_category on sub_cat_id = products_sub_category.id "
    query = (
        "SELECT * FROM products_product "
        + join_condition
        + " WHERE products_sub_category.id = %s" % sub_category_id
    )
    # print(query)
    search_product_list = Product.objects.raw(query)
    print(search_product_list)

    template = loader.get_template("products/search.html")
    context = {
        "search_product_list": search_product_list,
        "cat_list": cat_list,
        "sub_cat_list": sub_cat_list,
        "brands_list": brands_list,
        "has_collapse_menu": "true",
        "sub_cat": sub_cat,
        "brands_for_this_sub_cat": brands_for_this_sub_cat,
    }
    return HttpResponse(template.render(context, request))


def displayBrandDetails(request, brand_id):
    cat_list = Category.objects.all()
    sub_cat_list = Sub_Category.objects.all()
    brands_list = Brand.objects.all()
    brand = Brand.objects.get(id=brand_id)

    search_product_list = Product.objects.filter(brand_id=brand_id)
    print(search_product_list)
    template = loader.get_template("products/search.html")
    context = {
        "search_product_list": search_product_list,
        "cat_list": cat_list,
        "sub_cat_list": sub_cat_list,
        "brands_list": brands_list,
        "has_collapse_menu": "true",
        "brand": brand,
    }
    return HttpResponse(template.render(context, request))
    # return HttpResponse("You're looking for Brand %s." % brand_id)


def displayProductDetails(request, product_id):
    try:
        #get the comment from template(from user)
        comment = request.POST.get('Comment')
        #get the quantity from template(from user)
        CartQuantity = request.POST.get('quantity')
        #get rating from template(from user)
        rating = request.POST.get('rating')



        #take the product id sent in url in a variable
        product = Product.objects.get(id=product_id)
        try:
            #try to get the user id if can;t will display the product details
            user = User.objects.get(id=request.user.id)
        except User.DoesNotExist:
            user = None
            
            
        #update product_rate in product table    
        totalReviews = connection.cursor()
        #get the average of all reviews and counts of all reviews
        totalReviews.execute(
            '''select avg(Review) from user_reviews where product_id= %s''', [product_id])
        #fetch the first row of the result set
        rowtotal = totalReviews.fetchone()
        #average o all reviews 
        resultsAverage = rowtotal[0]
        
        updateReviews = connection.cursor()
        updateReviews.execute('''update products_product set product_rate=%s where id= %s''', [resultsAverage,product_id])
        rowReview = updateReviews.fetchone()
        print(rowReview)
    
    
      


        #the template it will render to
        template = 'products/product-details.html'


        #check if the form sent from template method is post
        if request.method == 'POST':
            #geeting an isntance of comments form and saving the info of the comments form and redirect to the same page again
            try:
                form = CommentsForm(request.POST)
                if form.is_valid():
                    new_form = form.save(commit=False)
                    new_form.user = user
                    new_form.product = product
                    new_form.Comment = comment
                    new_form.save()
                    return HttpResponseRedirect(request.path_info)
            except IntegrityError:
                messages.info(request , "Sorry This Comment Already Exists By You")
                return HttpResponseRedirect(request.path_info)
            #geeting an isntance of reviews form and saving the info of the reviews form and redirect to the same page again
            try:
                review_form = ReviewsForm(request.POST)
                if review_form.is_valid():
                    new_reveiw_form = review_form.save(commit=False)
                    new_reveiw_form.user = user
                    new_reveiw_form.product = product
                    query = 'select avg(Reveiws) from user_reviews where pro'
                    new_reveiw_form.save()
                    return HttpResponseRedirect(request.path_info)
            except IntegrityError:
                messages.info(request , "Sorry You Have Already Made Your Reveiew Before")
                return HttpResponseRedirect(request.path_info)
                
            #geeting an isntance of add_to_cart form and saving the info of add_to_cart form and redirect to the same page again
            try:
                add_to_cart_form = AddToCartForm(request.POST)
                if add_to_cart_form.is_valid():
                    new_add_to_cart = add_to_cart_form.save(commit=False)
                    new_add_to_cart.cartUser = user
                    new_add_to_cart.cartProduct = product
                    new_add_to_cart.quantity = CartQuantity
                    new_add_to_cart.save()
                    return HttpResponseRedirect(request.path_info)
            except IntegrityError:
                return HttpResponseRedirect(request.path_info)
        else:
            form = CommentsForm()
            review_form = ReviewsForm()
            add_to_cart_form = AddToCartForm()


        #all the comments objects in comments realted with the same product    
        all_comments = Comments.objects.filter(product=product_id)
        #all the reviews objects in reviews realted with the same product    
        all_reviews = Reviews.objects.filter(product=product_id)



        #create connection to execute a row sql query 
        cursorAll = connection.cursor()
        #get the average of all reviews and counts of all reviews
        cursorAll.execute(
            '''select avg(Review),count(*) from user_reviews where product_id= %s''', [product_id])
        #fetch the first row of the result set
        rowAll = cursorAll.fetchone()
        #average o all reviews 
        resultsAverage = rowAll[0]
        #count of all reviews
        resultsAll = rowAll[1]


        #create connection for review 1 and the count of the review save it to variables
        cursor1 = connection.cursor()
        cursor1.execute(
            '''select avg(Review) ,count(Review) from user_reviews where Review=1 and product_id= %s''', [product_id])
        row1 = cursor1.fetchone()
        results1 = row1[0]
        count_1 = row1[1]


        #create connection for review 2 and the count of the review save it to variables
        cursor2 = connection.cursor()
        cursor2.execute(
            '''select avg(Review) ,count(Review) from user_reviews where Review=2 and product_id= %s''', [product_id])
        row2 = cursor2.fetchone()
        results2 = row2[0]
        count_2 = row2[1]


        #create connection for review 3 and the count of the review save it to variables
        cursor3 = connection.cursor()
        cursor3.execute(
            '''select avg(Review) ,count(Review) from user_reviews where Review=3 and product_id= %s''', [product_id])
        row3 = cursor3.fetchone()
        results3 = row3[0]
        count_3 = row3[1]


        #create connection for review 4 and the count of the review save it to variables
        cursor4 = connection.cursor()
        cursor4.execute(
            '''select avg(Review) ,count(Review)from user_reviews where Review=4 and product_id= %s''', [product_id])
        row4 = cursor4.fetchone()
        results4 = row4[0]
        count_4 = row4[1]


        #create connection for review 5 and the count of the review save it to variables
        cursor5 = connection.cursor()
        cursor5.execute(
            '''select avg(Review) ,count(Review) from user_reviews where Review=5 and product_id= %s''', [product_id])
        row5 = cursor5.fetchone()
        results5 = row5[0]
        count_5 = row5[1]


        #send variables to be rendered in template
        context = {
            'form':  form,
            'product': product,
            'review_form': review_form,
            'add_to_cart_form': add_to_cart_form,
            'all_comments': all_comments,
            'resultsAverage': resultsAverage,
            'resultsAll': resultsAll,
            'results1': results1,
            'results2': results2,
            'results3': results3,
            'results4': results4,
            'results5': results5,
            'count_1': count_1,
            'count_2': count_2,
            'count_3': count_3,
            'count_4': count_4,
            'count_5': count_5,
            'all_reviews': all_reviews,
            'user': user,
            'product_id': product_id,

        }
        #rendering templates 
        return render(request, template, context)
    #ecept of try if there is no products
    except Product.DoesNotExist:
        return HttpResponse("You're looking for non existing product")


def displaySearchPage(request):
    if request.method == "GET":
        cat_list = Category.objects.all()
        sub_cat_list = Sub_Category.objects.all()
        brands_list = Brand.objects.all()

        table = " products_product "
        brand_join_cond = " join products_brand on brand_id = products_brand.id "
        sub_cat_join_cond = (
            " join products_sub_category on sub_cat_id = products_sub_category.id  "
        )
        cat_join_cond = " join products_category on cat_id = products_category.id "
        condition = " WHERE 1"
        product_name = ""
        search_query = "product_name="

        if request.GET.get("product_name"):
            product_name = request.GET.get("product_name")
            condition += (
                ' AND ( products_product.product_name like "%%' + product_name + '%%"'
            )
            if request.GET.get("in_product_table"):
                 condition += ')'
            else:
                condition += ' or brand_name like "%%' + product_name + '%%"'
                condition += ' or sub_cat_name like "%%' + product_name + '%%"'
                condition += ' or cat_name like "%%'+product_name+ '%%")'
            search_query += product_name
        if request.GET.get("cat_id"):
            cat_id = request.GET.get("cat_id")
            condition += " AND products_category.id = %s " % cat_id
            search_query += "&cat_id=" + cat_id
        if request.GET.get("sub_cat_id"):
            sub_cat_id = request.GET.get("sub_cat_id")
            condition += " AND products_sub_category.id = %s " % sub_cat_id
            search_query += "&sub_cat_id=" + sub_cat_id
        if request.GET.get("brand_id"):
            brand_id = request.GET.get("brand_id")
            condition += " AND products_brand.id = %s " % brand_id
            search_query += "&brand_id=" + brand_id
        if request.GET.get("min_price"):
            min_price = request.GET.get("min_price")
            condition += " AND products_product.product_price >= %s " % min_price
            search_query += "&min_price=" + min_price
        if request.GET.get("max_price"):
            max_price = request.GET.get("max_price")
            condition += " AND products_product.product_price <= %s " % max_price
            search_query += "&max_price=" + max_price
        if request.GET.get("order"):
            order = request.GET.get("order")
            condition += " ORDER BY %s " % order
            search_query += "&order=" + order
        query = (
            "SELECT * from "
            + table
            + brand_join_cond
            + sub_cat_join_cond
            + cat_join_cond
            + condition
        )
        print(query)
        search_product_list = Product.objects.raw(query)

        # search_product_list = Product.objects.filter(product_name__icontains=product_name)
        paginator = Paginator(search_product_list, 6)
        page_number = request.GET.get("page")
        search_product_list = paginator.get_page(page_number)
        context = {
            "search_product_list": search_product_list,
            "product_name": product_name,
            "cat_list": cat_list,
            "sub_cat_list": sub_cat_list,
            "brands_list": brands_list,
            "serach_mode": "true",
            "search_query": search_query,
        }
        return render(request, "products/search.html", context)


def display_shop_page(request):
    search_product_list = Product.objects.all()
    cat_list = Category.objects.all()
    sub_cat_list = Sub_Category.objects.all()
    brands_list = Brand.objects.all()

    template = loader.get_template("products/shop.html")
    context = {
        "search_product_list": search_product_list,
        "cat_list": cat_list,
        "sub_cat_list": sub_cat_list,
        "brands_list": brands_list,
    }
    return HttpResponse(template.render(context, request))


def get_sub_cat_details(request):
    ajax_cat_id = request.GET["cat_id"]
    sub_categories = list(Sub_Category.objects.filter(cat_id=ajax_cat_id))
    ser_sub_cat = serializers.serialize("json", sub_categories)
    return JsonResponse(ser_sub_cat, safe=False, content_type="application/json")


def get_brand_details(request):
    ajax_sub_cat_id = request.GET["sub_cat_id"]
    brands = list(Brand.objects.filter(sub_cat_id=ajax_sub_cat_id))
    ser_brands = serializers.serialize("json", brands)
    return JsonResponse(ser_brands, safe=False, content_type="application/json")

def get_all_cat_details(request):
    categories = list(Category.objects.all())
    ser_Categories = serializers.serialize("json", categories)
    return JsonResponse(ser_Categories, safe=False, content_type="application/json")

def addToCart(request):
    product_id = request.GET.get("product_id")
    userid = request.user.id
    qty=1
    cart = Cart(cartProduct_id=product_id,cartUser_id=userid,quantity=1)
    cart.save()

def addtofav(request):
    _product_id = request.GET.get("product_id")
    userid = request.user.id
    fav = Favorite(user_id=userid,product_id=_product_id)
    fav.save()
    return redirect("cart:userFavorites")
