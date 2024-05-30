@extends('web.layouts.master')
@section('title', 'Fresh Cart')
@section('content')
    <main>
        <section class="mt-3">
            <div class="slick-slider border rounded">
                <div class="position-relative">
                    <div class="background-img"></div>
                    <div class="position-absolute w-100 text-left ml-5" style="top: 50%; transform: translateY(-50%);">
                        <span class="badge badge-warning text-dark font-weight-bold">Free Shipping - Orders Above $100</span>
                        <h1 class="text-family font-weight-bold display-4">  Free shipping on<span class="d-inline d-md-block">orders above
                            <span class="textGreenColor"> $100</span> </span>
                        </h1>
                        <p class="h4 my-3 text-secondary text-family">Free Shipping to First-Time Customers Only, After
                            <span class="d-inline d-md-block">Promotions and discounts are applied</span></p>
                        <button type="submit" class="btn btn-dark font-weight-bold rounded ">Shop Now <i class="mdi mdi-arrow-right ml-1 mt-4"></i></button>
                    </div>
                </div>
                <div class="position-relative">
                    <div class="background-picture"></div>
                    <div class="position-absolute w-100 text-left ml-5" style="top: 50%; transform: translateY(-50%);">
                        <span class="badge badge-warning text-dark font-weight-bold">Opening Sale Discount 50%</span>
                        <h1 class="text-family font-weight-bold display-4"> SuperMarket For <span class="d-inline d-md-block"> Fresh Grocery </span>
                        </h1>
                        <p class="h4 my-3 text-secondary text-family">Introduced a new model for online grocery shopping
                           <span class="d-inline d-md-block"> and convenient home delivery.</span>
                        </p>
                        <button type="submit" class="btn btn-dark font-weight-bold rounded">Shop Now <i class="mdi mdi-arrow-right ml-1 mt-4"></i></button>
                    </div>
                </div>
            </div>

            <div class="row searchValue mt-3" id="searchResults">

            </div>

            <h4 class="mt-5 searchDisable">Featured Categories</h4>
            <div class="slick-card mt-4 searchDisable">
                @foreach ($categories as $key => $value)
                    <a href="{{ url('product/'. $value->id . '/' . $value->subcategories[0]->id) }}" class="featured_link col-sm-2">
                        <div class="card card-product border text-center border rounded">
                            <div class="card-body d-flex flex-column justify-content-center align-items-center">
                                <img class="img-fluid" src="{{ Storage::url($value->profile_picture) }}" alt="Card image" height="" width="">
                                <h5 class="card-title mt-3">{{ $value->name }}</h5>
                            </div>
                        </div>
                    </a>
                @endforeach
            </div>
           
            <div class="row searchDisable">
                <div class="col-12 col-md-6 mb-3 mb-lg-0">
                    <div>
                       <div class="p-4 px-8 border-0 rounded fruits-banner">
                            <div> 
                                <h3 class="font-weight-bold mb-1">Fruits &amp; Vegetables</h3>
                                <p class="mb-4">
                                    Get Upto
                                    <span class="font-weight-bold">30%</span>
                                    Off
                                </p>
                                <a href="#" class="btn btn-dark">Shop Now</a>
                            </div>
                       </div>
                    </div>
                </div>
    
                <div class="col-12 col-md-6 mb-3 mb-lg-0">
                    <div>
                       <div class="p-4 px-8 border-0 rounded bakery-banner">
                          <div> 
                             <h3 class="font-weight-bold mb-1">Freshly Baked Buns</h3>
                             <p class="mb-4">
                                Get Upto
                                <span class="font-weight-bold">25%</span>
                                Off
                             </p>
                             <a href="#" class="btn btn-dark">Shop Now</a>
                          </div>
                       </div>
                    </div>
                </div>
            </div>

            @foreach ($categories as $key => $value)
                @if(($value->name == "Dairy & Bread" || $value->name == "Snacks & Munchies" || $value->name == "Juices & Cold Drinks") && !empty($value->subcategories)  && count($value->subcategories) >= 1 )
                    <h4 class="mt-5 searchDisable">{{ $value->name }}</h4>
                    <div class="slick-card mt-4 searchDisable">
                        @foreach($value->subcategories as $item)
                            <a href="{{ url('product/'. $item->category_id . "/" . $item->id) }}" class="featured_link col-sm-2">
                                <div class="card card-product card-prodict-category border text-center border rounded">
                                    <div class="card-body d-flex flex-column justify-content-center align-items-center">
                                        <img class="img-fluid" src="{{ Storage::url($item->profile_picture) }}" alt="Card image cap" height="" width="">
                                        <h5 class="card-title mt-3">{{ $item->name }}</h5>
                                    </div>
                                </div>
                            </a>
                        @endforeach
                    </div>
                @endif
            @endforeach

            <div class="row searchDisable">
                <div class="col-md-3 col-lg-3 col-sm-6">
                    <div class="my-4">
                        <img src="{{ asset('assets/images/clock.svg') }}" alt="">
                        <h3 class="h4 my-3">10 minute grocery now</h3>
                        <p>Get your order delivered to your doorstep at the earliest from FreshCart pickup stores near you.</p>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6">
                    <div class="my-4">
                        <img src="{{ asset('assets/images/gift.svg') }}" alt="">
                        <h3 class="h4 my-3">Best Prices & Offers</h3>
                        <p>Cheaper prices than your local supermarket, great cashback offers to top it off. Get best pricess & offers.</p>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6">
                    <div class="my-4">
                        <img src="{{ asset('assets/images/package.svg') }}" alt="">
                        <h3 class="h4 my-3">Wide Assortment</h3>
                        <p>Choose from 5000+ products across food, personal care, household, bakery, veg & other categories.</p>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6">
                    <div class="my-4">
                        <img src="{{ asset('assets/images/refresh-cw.svg') }}" alt="">
                        <h3 class="h4 my-3">Easy Return</h3>
                        <p>Not satisfied with a product? Return it at the doorstep & get a refund within hours. No questions asked policies.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
@endsection