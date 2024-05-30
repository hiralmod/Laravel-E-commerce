@extends('admin.layouts.master')
@section('title', 'Product')
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
                        <form action="{{ route('product.store') }}" method="post" enctype="multipart/form-data" autocomplete="off" data-parsley-validate>
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label>Category</label>
                                        <select name="category_id" class="form-control select_dropdown" id="category_id" required="" data-parsley-required-message="Please select category">
                                            <option value="" selected disabled>Select Category</option>
                                            @foreach ($category as $categoryData)
                                                <option value="{{ $categoryData['id'] }}">{{ $categoryData['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Sub Category</label>
                                        <select name="subcategory_id" class="form-control select_dropdown" id="sub_category" data-parsley-required-message="Please select sub category">
                                            <option value="" selected disabled>Select Sub Category</option>
                                        </select>
                                    </div>

                                    {{-- <div class="form-group mb-3">
                                        <label>Brands</label>
                                        <select name="brand_id" class="form-control select_dropdown" required="" data-parsley-required-message="Please select brands">
                                            <option value="" selected disabled>Select Brands</option>
                                            @foreach ($brand as $brandData)
                                                <option value="{{ $brandData['id'] }}">{{ $brandData['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div> --}}

                                    <div class="form-group mb-3">
                                        <label>Product Name</label>
                                        <input type="text" name="name" class="form-control" placeholder="Enter Product Name" required="" data-parsley-required-message="Please enter price" >
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" id="description" rows="4" placeholder="Description"></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Product Quantity</label>
                                        <input type="text" name="quantity" class="form-control" placeholder="Enter Product Quantity">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Product Price</label>
                                        <input type="text" name="price" class="form-control" placeholder="Enter Product Price" required="" data-parsley-required-message="Please enter product name" data-parsley-minlength="2" data-parsley-minlength-message="Minimum 2 characters are required">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Product Image</label>
                                        <div class="custom-file">
                                            <input type="file" name="profile_picture" class="custom-file-input preview_file" data-parsley-fileextension='jpeg,jpg,png'>
                                            <label class="custom-file-label">Choose file</label>
                                            <img src="{{ asset('images/default.png') }}" alt="" class="img-fluid img-thumbnail mt-2 mb-5 preview_img" width="100">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Primary Product Image</label>
                                        <div class="custom-file">
                                            <input type="file" name="primary_image" class="custom-file-input preview_file" data-parsley-fileextension='jpeg,jpg,png'>
                                            <label class="custom-file-label">Choose file</label>
                                            <img src="{{ asset('images/default.png') }}" alt="" class="img-fluid img-thumbnail mt-2 preview_img" width="100">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group mb-3 float-right">
                                            <button type="submit" class="btn button-color waves-effect waves-light"><i class="mdi mdi-content-save"></i> Save</button>
                                            <a href="{{ route('admin.product') }}" class="btn btn-secondary waves-effect">Cancel</a>
                                        </div>
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