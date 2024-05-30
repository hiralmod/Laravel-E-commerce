@extends('admin.layouts.master')
@section('title', 'Category')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <div class="page-title-right">
                        <a href="{{ route('admin.subcategory') }}" class="btn button-color"><i class="fe-arrow-left-circle mr-1 fa-lg"></i>Back</a>
                    </div>
                    <h4 class="page-title mt-3">Category</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('category.store') }}" method="post" enctype="multipart/form-data"
                            autocomplete="off" data-parsley-validate>
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label>Category Name</label>
                                        <input type="text" name="name" class="form-control" placeholder="Enter Category Name" required="" data-parsley-required-message="Please enter Category name" data-parsley-minlength="2" data-parsley-minlength-message="Minimum 2 characters are required">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Profile Picture</label>
                                        <div class="custom-file">
                                            <input type="file" name="profile_picture" class="custom-file-input preview_file" data-parsley-fileextension='jpeg,jpg,png'>
                                            <label class="custom-file-label">Choose file</label>
                                            <img src="{{ asset('images/default.png') }}" alt="" class="img-fluid img-thumbnail mt-2 preview_img" width="100">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group mb-3 float-right">
                                            <button type="submit" class="btn button-color waves-effect waves-light"><i class="mdi mdi-content-save"></i> Save</button>
                                            <a href="{{ route('admin.category') }}" class="btn btn-secondary waves-effect">Cancel</a>
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
