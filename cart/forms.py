from  django import forms
from django_countries.fields import CountryField
from django_countries.widgets import CountrySelectWidget


PAYMENT_CHOICES = (
    ('cash', 'Cash'),
    ('visa', 'Credit Card')
)
ADDRESS_CHOICES = (
    ('same','Take address from my profile'),
    ('diff','Ship to the below address')
)
class CheckoutForm(forms.Form):
    address_option = forms.ChoiceField(widget=forms.RadioSelect,choices=ADDRESS_CHOICES)
    shipping_address = forms.CharField(required=False ,widget=forms.TextInput(attrs={'placeholder':' '}) )
    address_details = forms.CharField(required=False ,widget=forms.TextInput(attrs={'placeholder':' ','class':'form-control'}) )  # here must be city with options(Giza ,Cairo )
    save_new_address =forms.BooleanField(required=False)
    
    city = CountryField(blank_label='(select country)').formfield(
        required=False,
        widget=CountrySelectWidget(attrs={
            'class': 'custom-select d-block w-100',
        }))
    zip = forms.CharField(required=False)
  

    payment_option = forms.ChoiceField(widget=forms.RadioSelect, choices=PAYMENT_CHOICES)
    save_card_info = forms.BooleanField(required=False)


    
