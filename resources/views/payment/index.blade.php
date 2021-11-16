@extends('layouts.payment')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card mt-5 text-center">
                <div class="card-header">
                    <h3>Payment details</h3>
                </div>
                <div class="card-body">
                    <p class="card-text">Now € {{ $price * 0.18 }}</p>
                    <p class="card-text">On Car Delivery € {{ $price - ($price * 0.18 )}}</p>
                    <p class="card-text">Total € {{ $price  }}</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 border card-header rounded mt-3">
            <form action="{{ route('payment.store') }}" method="post" id="card-form">
                @csrf
                <h3 class="top">Credit Card Details <br/>
                    <i class="fab fa-cc-visa"></i> <i class="fab fa-cc-mastercard"></i>
                    <i class="fab fa-cc-amex"></i> <i class="fab fa-cc-diners-club"></i>
                </h3>
                <div class="form-row mb-3">
                    <input class="form-control input-field border-0 mb-3" id="cardholderName" 
                    placeholder="Cardholder name" required>
                    <div id="card-element"> </div>
                    <!-- Used to display form errors. -->
                    <div id="card-errors" role="alert"></div>
                    <input type="hidden" name="paymentId" id="paymentId" />
                    <input type="hidden" name="userEmail" id="userEmail" value="{{ $userEmail }}"/>
                    <input type="hidden" name="adminEmail" id="adminEmail" value="{{ $adminEmail }}"/>
                    <input type="hidden" name="carOwnerEmail" id="carOwnerEmail" value="{{ $carOwnerEmail }}"/>
                    <input type="submit" id="card-button" class="btn btn-danger w-100 mt-3" value="Process Payment." />    
                </div> 
                @include('includes.spinner')
            </form> 
        </div>
    </div>
</div>
<script>
    const stripe = Stripe('pk_test_51I3l1CDUU5l8U0qtI5N99T6Wy4EIh2NZ9A9fuVUVJs4RWQrVUqfOw8OweMaOGJ2AKjIhsAdYMzSoTWhcHmYhimyc00cvrsf8ju'); 
    const elements = stripe.elements();
    let form = document.getElementById('card-form');
    let buttonForm = document.getElementById('card-button');
    const clientSecret = '{{$intent}}';
    const cardElement = elements.create('card', {
                    hidePostalCode: true
                    });
    cardElement.mount('#card-element');
    $('#card-button').hide();
    cardElement.on('change', function(event) {
        var displayError = document.getElementById('card-errors');
        if (event.error) { 
            displayError.textContent = event.error.message;
        }else if(event.complete){
            $('#card-button').show();
        } else {
            displayError.textContent = '';
        }
    });

    buttonForm.addEventListener("click", function(event) {
        event.preventDefault();
        stripe
            .confirmCardPayment(clientSecret, {
                payment_method: {
                    type: 'card',
                    card: cardElement,
                    billing_details: {
                        name: document.getElementById('cardholderName').value,
                    },
                },
            })
            .then(function(result) {
                if (result.error) {
                    alert(result.error.message)
                    document.getElementById('cardholderName').value = '';
                    elements.getElement('card').clear();
                    $('#card-button').hide();
                }else{
                    document.getElementById('paymentId').value = result.paymentIntent.id;
                    $('#card-button').hide();
                    $('.spinner').show();
                    form.submit();
                }
            });   
    });      
</script> 

@endsection