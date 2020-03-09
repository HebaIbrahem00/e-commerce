from django import forms
from user.models import Comments
from user.models import Reviews


class CommentsForm(forms.ModelForm):
    class Meta:
        model = Comments
        fields = ['Comment']


class ReviewsForm(forms.ModelForm):
    class Meta:
        model: Reviews
        fields = ['Review']
