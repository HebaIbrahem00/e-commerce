from  django import forms
from creditcards import types
from creditcards.forms import CardNumberField, CardExpiryField, SecurityCodeField


PAYMENT_CHOICES = (
    ('cash', 'Cash'),
    ('visa', 'Credit Card')
)
ADDRESS_CHOICES = (
    ('same','Take address from my profile'),
    ('diff','Ship to the below address')
)
CITIES =(('cairo','Cairo'),
('giza','Giza'),
('monofya','Monofya'),
('banha','Banha')

)
class CheckoutForm(forms.Form):

    address_option = forms.ChoiceField(widget=forms.RadioSelect,choices=ADDRESS_CHOICES)
    shipping_address = forms.CharField(required=False,  widget=forms.TextInput(attrs={'placeholder':' '}) )
    address_details = forms.CharField(required=False ,widget=forms.TextInput(attrs={'placeholder':' ','class':'form-control'}) )  # here must be city with options(Giza ,Cairo )
    save_new_address =forms.BooleanField(required=False)
 
    city = forms.CharField(label='select city', widget=forms.Select(choices=CITIES))  
    zip = forms.CharField(required=False)
  

    payment_option = forms.ChoiceField(widget=forms.RadioSelect, choices=PAYMENT_CHOICES)
    save_card_info = forms.BooleanField(required=False)

    card_owner = forms.CharField(max_length=100)
    card_number = CardNumberField(label='Card Number' ) 
    card_expiry = CardExpiryField(label='Expiration Date')
    cvv = SecurityCodeField(label='CVV/CVC')
    assert types.get_type('0000000000000000') == types.CC_TYPE_GENERIC


    def clean(self):
         
        address_opt = self.cleaned_data.get('address_option')

        if address_opt =='diff':
            
            self.fields['shipping_address'].required = True
       

        return self.cleaned_data



    
