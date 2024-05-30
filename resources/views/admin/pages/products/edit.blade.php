@extends('admin.layouts.master')
@section('title', 'Sub Category')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <a href="{{ route('admin.product') }}" class="btn button-color"><i class="fe-arrow-left-circle mr-1 fa-lg"></i>Back</a>
                </div>
                <h4 class="page-title mt-3">Product</h4>
            </div>
        </div>
    </div>
    <div class="row">
      <div class="col-lg-6 col-xl-6">
         <div class="card">
            <div class="card-body">
                <form action="{{ url('admin/product/update/'.$products->id) }}" method="post" enctype="multipart/form-data" autocomplete="off" data-parsley-validate>
               	@csrf
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="name">Select Category</label>
                                <select class="form-control select_dropdown" name="category_id" id="category_id" required data-parsley-required-message="Please select category">
                                    <option value="" placeholder="Select" disabled>Select</option>
                                    @foreach ($category as $categoryData)
                                        <option value="{{ $categoryData['id'] }}" @selected($products->category_id == $categoryData['id'])>{{ $categoryData['name'] }}</option>
                                    @endforeach
                                </select>
                            </div> 
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="name">Select Sub Category</label>
                                <select class="form-control select_dropdown" name="subcategory_id" id="sub_category" required data-parsley-required-message="Please select subcategory">
                                    <option value="" placeholder="Select" disabled>Select</option>
                                    @foreach ($subcategory as $subcategoryData)
                                        <option value="{{ $subcategoryData['id'] }}" @selected($products->subcategory_id == $subcategoryData['id'])>{{ $subcategoryData['name'] }}</option>
                                    @endforeach
                                </select>
                            </div> 
                        </div>   

                        {{-- <div class="col-lg-12">
                            <div class="form-group">
                                <label for="name">Select Brand</label>
                                <select class="form-control select_dropdown" name="brand_id" id="" required data-parsley-required-message="Please select brand">
                                    <option value="" placeholder="Select" disabled>Select</option>
                                    @foreach ($brand as $brandData)
                                        <option value="{{ $brandData['id'] }}" @selected($products->brand_id == $brandData['id'])>{{ $brandData['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div> --}}

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label>Product Name</label>
                                <input type="text" name="name" class="form-control"  value="{{$products->name }}" required="" placeholder="Enter Product Name" data-parsley-required-message="Please enter product name" data-parsley-minlength="2" data-parsley-minlength-message="Minimum 2 characters are required">
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label>Description</label>
                                <textarea name="description" class="form-control" id="description" rows="4">{{ $products->description }}</textarea>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label>Product Quantity</label>
                                <input type="text" name="quantity" class="form-control"  value="{{$products->quantity }}" placeholder="Enter Product Quantity" data-parsley-required-message="Please enter product quantity">
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label>Product Price</label>
                                <input type="text" name="price" class="form-control"  value="{{$products->price }}" required="" placeholder="Enter Product Price" data-parsley-required-message="Please enter product price" data-parsley-minlength="2" data-parsley-minlength-message="Minimum 2 characters are required">
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label>Product Picture</label>
                                <div class="custom-file">
                                <input type="file" name="profile_picture" class="custom-file-input preview_file" data-parsley-fileextension='jpeg,jpg,png'>
                                <label class="custom-file-label">Choose file</label>
                                @if (!empty($products->profile_picture) && Storage::exists($products->profile_picture))
                                    <img src="{{ url(Storage::url($products->profile_picture)) }}" alt="" class="img-fluid img-thumbnail mt-2 mb-5 preview_img" width="130">
                                @else
                                    <img src="{{ asset('images/default.png') }}" alt="" class="img-fluid img-thumbnail mt-2 mb-5 preview_img" width="100">
                                @endif
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label>Product Primary Picture</label>
                                <div class="custom-file">
                                <input type="file" name="primary_image" class="custom-file-input preview_file" data-parsley-fileextension='jpeg,jpg,png'>
                                <label class="custom-file-label">Choose file</label>
                                @if (!empty($products->primary_image) && Storage::exists($products->primary_image))
                                    <img src="{{ url(Storage::url($products->primary_image)) }}" alt="" class="img-fluid img-thumbnail mt-2 preview_img" width="130">
                                @else
                                    <img src="{{ asset('images/default.png') }}" alt="" class="img-fluid img-thumbnail mt-2 preview_img" width="100">
                                @endif
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-3 float-right">
                                <button type="submit" class="btn button-color waves-effect waves-light"><i class="mdi mdi-content-save"></i> Update</button>
                                <a href="{{ route('admin.product') }}" class="btn btn-secondary waves-effect">Cancel</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
         </div>
      </div>
   </div>
</div>
@endsection