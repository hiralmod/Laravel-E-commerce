@extends('web.layouts.master')
@section('title', 'Fresh Cart')
@section('content')
<main>
    <section class="">
        <lottie-player src="{{ asset('assets/images/cart/order-placed.json') }}" background="transparent" speed="1" style="width: 30%; height: 100%;" loop autoplay	class="mx-auto"></lottie-player>
        <h2 class="text-center greenColor mt-5">Your Order Has Been Placed!!!</h2>
    </section>
</main>
@endsection