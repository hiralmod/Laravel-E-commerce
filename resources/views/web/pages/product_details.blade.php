@extends('web.layouts.master')
@section('title', 'Fresh Cart')
@section('content')
    <main>
        <section class="">
            <div class="row searchValue mt-3" id="searchResults">
   
            </div>
            <div class="row searchDisable">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    @if(!empty($product_details->profile_picture) && !empty($product_details->primary_image))
                        <img src="{{ Storage::url($product_details->profile_picture) }}" data-zoom="{{ Storage::url($product_details->primary_image) }}" alt="Grocery Ecommerce Template" class="drift-demo-trigger zoom-img">
                    @else 
                        <img src="{{ asset('images/default.png') }}" data-zoom="{{ asset('images/default.png') }}" alt="Grocery Ecommerce Template" class="drift-demo-trigger zoom-img">
                    @endif
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 details detailsColor p-4">
                    <input type="hidden" id="product_id" name="product_id" value="{{ $product_details->id }}">
                    <div class="ml-3 mb-2">
                        <h1>{{ $product_details->name }}</h1>
    
                        <h5>{{ $product_details->quantity }}</h5>
                        <h4 class="mt-3">₹ {{ $product_details->price }}</h4>
    
                        <p class="mt-3">{{ $product_details->description }}</p>
                        {{-- <button class="btn backgroundColor btn-sm add-cart rounded-button"> <i class="fas fa-plus"></i> Add</button>
                        <button id="" class="btn backgroundColor quantity-btn btn-sm d-none rounded-button" data-id="{{ $product_details->id }}"> <i class="fas fa-minus mr-1 quantity-minus"></i> <span class="quantity">1</span> <i class="fas fa-plus ml-1 quantity-add"></i> </button> --}}

                        <select name="quantity" class="form-control w-25" id="quantity">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>

                        <a href="javascript:void(0);" class="btn backgroundColor mt-3 addCart">Add To Cart</a>
                    </div>
                </div>
            </div>  
        </section>
    </main>
@endsection
@section('script')
    <script>
        $(document).ready(function() {
            $(document).on('click','.addCart', function(e) {
                e.preventDefault();
                var product_id = $('#product_id').val();
                var quantity = $('#quantity').val();
                $.ajax({
                    url: "/add-cart",
                    type: "POST",
                    dataType: 'json',
                    data: { 
                        product_id: product_id, 
                        quantity : quantity,
                        _token: $('meta[name="csrf-token"]').attr("content"),
                    },
                    success: function (response) {
                        if(response.status == false) {
                            window.location.href = "/login";
                        } else {
                            window.location.href = "/cart";
                        }
                    },
                    error: function(xhr, status, error) {
                        if (xhr.status === 200 && xhr.responseText.includes("login")) {
                            window.location.href = "/login";
                        } else {
                            console.error(xhr.responseText);
                        }
                    }
                });
            });
        });                          
    </script>
@endsection