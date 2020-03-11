from django import forms
from user.models import Comments
from user.models import Reviews
from cart.models import Cart



class CommentsForm(forms.ModelForm):
    class Meta:
        model = Comments
        fields = ['Comment']


class ReviewsForm(forms.ModelForm):
    class Meta:
        model = Reviews
        fields = ['Review']
        
        
class AddToCartForm(forms.ModelForm):
    class Meta:
        model = Cart
        fields = ['quantity']
