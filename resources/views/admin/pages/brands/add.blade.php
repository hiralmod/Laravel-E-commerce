@extends('admin.layouts.master')
@section('title', 'Brand')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <div class="page-title-right">
                        <a href="{{ route('admin.brand') }}" class="btn button-color"><i class="fe-arrow-left-circle mr-1 fa-lg"></i>Back</a>
                    </div>
                    <h4 class="page-title mt-3">Brand</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('brand.store') }}" method="post" enctype="multipart/form-data"
                            autocomplete="off" data-parsley-validate>
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label>Brand Name</label>
                                        <input type="text" name="name" class="form-control" placeholder="Enter Brand Name" required="" data-parsley-required-message="Please enter brand name" data-parsley-minlength="2" data-parsley-minlength-message="Minimum 2 characters are required">
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group mb-3 float-right">
                                            <button type="submit" class="btn button-color waves-effect waves-light"><i class="mdi mdi-content-save"></i> Save</button>
                                            <a href="{{ route('admin.brand') }}" class="btn btn-secondary waves-effect">Cancel</a>
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
