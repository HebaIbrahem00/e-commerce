from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.forms import ModelForm
from accounts.models import Profile


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=100, help_text='Last Name')
    last_name = forms.CharField(max_length=100, help_text='Last Name')
    email = forms.EmailField(max_length=150, help_text='Email')


    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )
class EditProfileForm(ModelForm):
     class Meta:
        model = User
        fields = (
            'email',
            'first_name',
            'last_name'
            )


class ProfileForm(ModelForm):
    class Meta:
        model = Profile
        # Note that we didn't mention user field here.
        fields = ('first_name', 'last_name',
                  'phone', 'address1', 'address2', 'image', 'creditNumber')
