from django.urls import path

from . import views

urlpatterns = [
    # ex: /products/
    path('', views.displayAllProducts, name='displayAllProducts'),
    # ex: /products/5/
    path('cat/<int:cat_id>', views.displayCatDetails, name='displayCatDetails'),
    path('brand/<int:brand_id>', views.displayBrandDetails, name='displayBrandDetails'),
    path('product/<int:product_id>', views.displayProductDetails, name='displayProductDetails'),
    # path(r'*[a-z]', views.displayAllProducts, name='displayAllProducts'),

    
    # ex: /products/5/results/
    # path('<int:question_id>/results/', views.results, name='results'),
    # # ex: /products/5/vote/
    # path('<int:question_id>/vote/', views.vote, name='vote'),
]