@extends('layouts.payment')
@section('content')
<div class="container mt-4 mb-5">
    <div class="row">
        <div class="col-md-12">
            <div class="jumbotron">
                <h1 class="display-4">Successful payment.</h1>
                <hr class="my-4">
                <p>Please check your email for your invoice. <br/> Thanks for your purchase. </p>
                <a class="btn btn-primary btn-lg" href="{{ url('/') }}" role="button">Home</a>
            </div>
        </div>
    </div>
</div>

@endsection