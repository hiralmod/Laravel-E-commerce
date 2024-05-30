@extends('web.layouts.master')
@section('title', 'Fresh Cart')
@section('content')
   <main>
      <section class="">
         <div class="row searchValue mt-3" id="searchResults">
   
         </div>
         <div class="row">
            <div class="col-lg-2 col-md-3 col-sm-4 col-6 searchDisable">
               <div class="left-section h-100 w-100 border-left border-right border-bottom">
                  <ul class="metismenu" id="side-menu">
                     @if(!empty($sub_category))
                        @foreach ($sub_category as $key => $values)
                           <li class="border-bottom sidebar-color">
                              <a href="{{ url('product/'. $values->category_id. "/" . $values->id) }}" class="sidebar-active positioan-relative">
                                 <div class="row ml-2 justify-content-center align-items-center sidebar-item">
                                    <div class="col-md-2">
                                       <img src="{{ Storage::url($values->profile_picture) }}" alt="Grocery Ecommerce Template" class="mt-3 mb-2 " height="45px" weight="25px">
                                    </div>
                                    <div class="col-md-10">
                                       <span class="text-center text-dark ml-2"> {{ $values->name }} </span>
                                    </div>
                                 </div>
                              </a>
                           </li>
                        @endforeach
                     @else 
                        <h3>No Products Available</h3>
                     @endif
                  </ul>
               </div>
            </div>

            <div class="col-lg-10 col-md-9 col-sm-8 col-6 productBackground border-bottom searchDisable">
               <div class="row mt-3 ml-1">
                  @if(!empty($products))
                     @foreach ($products as $key => $value)
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                           <div class="card card-popular-product border rounded mr-2">
                              <div class="card-body">
                                 <div class="text-center position-relative">
                                    <div class="position-absolute top-0 left-0"></div>
                                    <a href="{{ url('product-details/'. $value->category->id. "/" .$value->subcategory->id. "/" . $value->id) }}">
                                    <img src="{{ Storage::url($value->profile_picture) }}" alt="Grocery Ecommerce Template" class="img-fluid"></a>
                                 </div>
                                 
                                 <a href="{{ url('product-details/'. $value->category->id. "/" .$value->subcategory->id. "/" . $value->id) }}"><h4 class="fs-5">{{ $value->name }}</h4></a>
                                 <p class="mt-1 text-dark text-decoration-none">{{ $value->quantity }}</p>
                                 <div class="d-flex justify-content-between align-items-center">
                                    <span class="text-dark">₹ {{ $value->price }}</span>
                                    {{-- <button class="btn backgroundColor btn-sm add-cart"> <i class="fas fa-plus"></i> Add</button>
                                    <button id="" class="btn backgroundColor quantity-btn btn-sm d-none" data-id="{{ $value->id }}"> <i class="fas fa-minus mr-1 quantity-minus"></i> <span class="quantity">1</span>  <i class="fas fa-plus ml-1 quantity-add"></i> </button> --}}
                                 </div>
                              </div>
                           </div>
                        </div>
                     @endforeach
                  @else 
                     <h3>No Products Available</h3>
                  @endif
               </div>
            </div>
         </div>

         {{-- <div class="border-bottom border-left border-right p-4">
            <h3 class="my-3">{{ $values->name }}</h3>
            <p class="">{!! $values->description !!}</p>
         </div> --}}
      </section>  
   </main>
@endsection