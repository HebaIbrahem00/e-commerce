from django.urls import path

from . import views

urlpatterns = [
    # ex: /products/
    path('', views.display_home_page, name='displayAllProducts'),
    # ex: /products/5/
    path('cat/<int:cat_id>', views.displayCatDetails, name='displayCatDetails'),
    path('sub_cat/<int:sub_category_id>', views.displaySubCatDetails, name='displayCatDetails'),
    path('brand/<int:brand_id>', views.displayBrandDetails, name='displayBrandDetails'),
    path('product/<int:product_id>', views.displayProductDetails, name='displayProductDetails'),
    path('search/', views.displaySearchPage, name='displaysearchPage'),
    path('shop/', views.display_shop_page, name='displaysearchPage'),
    path('ajax/get_sub_cat_details', views.get_sub_cat_details, name='get_sub_cat_details'),
    path('ajax/get_brand_details', views.get_brand_details, name='get_brand_details')]