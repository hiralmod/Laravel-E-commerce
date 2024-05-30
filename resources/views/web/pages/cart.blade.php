@extends('web.layouts.master')
@section('title', 'Fresh Cart')
@section('content')
    <main>
        <section class="">
            <div class="row searchValue mt-3" id="searchResults">
   
            </div>
            <div class="row searchDisable">
                <div class="col-lg-8">
                    @if(!empty($cart) && isset($cart) && count($cart) > 0)
                        @foreach($cart as $key => $row)
                            <div class="card rounded-card-border remove_cart_item_{{ $row->product_id }} body-background">
                                <div class="card-body">
                                    <div class="row">
                                        <a href="javascript:void(0);" class="remove_item ml-auto mr-2 my-1 text-dark" data-product_id="{{ $row->product_id }}"><i class="ti-close"></i></a>
                                    </div>
                                    <div class="row ml-1">
                                        <a href="{{ url('product-details/'. $row->products[0]['category_id']. "/" .$row->products[0]['subcategory_id']. "/" . $row->products[0]['id']) }}">
                                            @if (!empty($row->profile_picture) && Storage::exists($row->profile_picture))
                                                <img src="{{ url(Storage::url($row->profile_picture)) }}" alt="" width="90px" height="90px" class="mr-3">
                                            @else
                                                <img src="{{asset('images/default.png')}}"alt="" width="90px" height="90px" class="mr-3">
                                            @endif
                                        </a>
                                        <div class="col">
                                            <a href="{{ url('product-details/'. $row->products[0]['category_id']. "/" .$row->products[0]['subcategory_id']. "/" . $row->products[0]['id']) }}">
                                                <h4>{{ $row->name }}</h4>
                                            </a>
                                            <h5>{{ $row->products[0]['quantity'] }}</h5>
                                        </div>
                                    
                                        <div class="col-auto mt-3">
                                            <select name="quantity" class="form-control quantity" id="quantity" data-id="{{ $row->product_id }}">
                                                <option value="1" {{ $row->quantity == "1" ? 'selected' : '' }}>1</option>
                                                <option value="2" {{ $row->quantity == "2" ? 'selected' : '' }}>2</option>
                                                <option value="3" {{ $row->quantity == "3" ? 'selected' : '' }}>3</option>
                                                <option value="4" {{ $row->quantity == "4" ? 'selected' : '' }}>4</option>
                                                <option value="5" {{ $row->quantity == "5" ? 'selected' : '' }}>5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row ml-1">
                                        <h4 class="greenColor">Price : <span class="text-dark">₹ </span> <span class="text-dark">{{ !empty($row->price) ? $row->price : 0 }}</span></h4>
                                        <h4 class="ml-auto mr-1 greenColor">Total : <span class="text-dark">₹ </span> <span class="text-dark cart_product_total_{{ $row->product_id }}"> {{ !empty($row->total) ? $row->total : 0 }}</span></h4>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else+
                        <div class="">
                            <lottie-player src="{{ asset('assets/images/cart/cart.json') }}" background="transparent" speed="1" style="width: 30%; height: 100%;" loop autoplay	class="mx-auto"></lottie-player>
                            <h3 class="text-center">Your cart is empty</h3>
                        </div>
                    @endif
                </div>
                <div class="col-lg-4">
                    <div class="card rounded-card-border body-background">
                        <div class="card-body">
                            <h3 class="">Order Summary</h3>
                            <hr>
                            <div class="row">
                                <h4 class="greenColor">Sub Total </h4>
                                <h4 class="font-weight-normal text-dark ml-auto">₹ <span class="cart_sub_total">{{ !empty($order->sub_total) ? $order->sub_total : 0 }}</span></h4>
                            </div>
                            <div class="row">
                                <h4 class="greenColor">Shipping Charge </h4>
                                <h4 class="font-weight-normal text-dark ml-auto">₹ <span class="shipping_charge">{{ !empty($order->shipping_charge) ? $order->shipping_charge : 0 }}</span></h4>
                            </div>
                            <hr>
                            <div class="row">
                                <h4 class="greenColor">Total </h4>
                                <h4 class="text-dark ml-auto">₹ <span class="cart_total"> {{ !empty($order->total) ? $order->total : 0 }}</span></h4>
                            </div>
                        </div>
                    </div> 
                    <div class="row">
                        <a href="{{ route('website.home') }}" class="shopping-text h4"><i class="fe-arrow-left mr-1 ml-2"></i>Continue Shopping</a>
                        <button class="btn backgroundColor ml-auto checkout" data-id="{{ !empty($order->id) ? $order->id : 0 }}"><i class="mdi mdi-cart text-white mr-1"></i>Check Out</button>
                    </div>
                </div>
            </div>
        </section>
    </main>
@endsection

@section('script')
    <script>
        $(document).ready(function() {
            $(document).on('change', '.quantity', function() {
                var product_id = $(this).data('id');
                var quantity = $(this).val();
                $.ajax({
                    url : "/change-quantity",
                    method : "POST",
                    data : { 
                        product_id : product_id, 
                        quantity : quantity,
                        _token: $('meta[name="csrf-token"]').attr("content"),
                    },
                    success : function(response) {
                        if(response.status == true) {
                            $(".cart_product_total_"+product_id).text(response.data.cart_product_total);
                            $(".cart_sub_total").text(response.data.cart_sub_total);
                            $(".cart_total").text(response.data.cart_total);
                        }
                    }
                })
            });

            $(document).on('click', '.remove_item', function() {
                var product_id = $(this).data('product_id');
                $.ajax({
                    url : "/remove-cart-item",
                    method : "POST",
                    data : { 
                        product_id : product_id,
                        _token: $('meta[name="csrf-token"]').attr("content"),
                    },
                    success : function(response) {
                        if(response.status == true) {
                            $(".remove_cart_item_"+product_id).remove();
                            $(".cart_sub_total").text(response.data.cart_sub_total);
                            $(".cart_total").text(response.data.cart_total);
                            $(".shipping_charge").text(response.data.cart_shipping_charge);
                        }
                    }
                })
            });

            $(document).on('click', '.checkout', function() {
                var id = $(this).data('id');
                $.ajax({
                    url : "/checkout",
                    method : "POST",
                    data: {
                        id : id,
                        _token : $('meta[name="csrf-token"]').attr("content"),
                    },
                    success : function(response) {
                        if(response.status == true) {
                            window.location.href = "/payment";
                        }
                    }
                })
            });
        });
    </script>
@endsection