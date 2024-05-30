@extends('admin.layouts.master')
@section('title', 'My Account')
@section('content')
<!-- start page title -->
<div class="row mt-3">
   <div class="col-12">
      <div class="page-title-box">
         <div class="page-title-right">
            <a href="{{ route('admin.dashboard') }}" class="btn button-color"><i class="fe-arrow-left-circle mr-1 fa-lg"></i>Back</a>
         </div>
         <h4 class="page-title">My Profile</h4>
      </div>
   </div>
</div>
<!-- end page title -->
<div class="row">
   <div class="col-lg-6 col-xl-6">
      <div class="card-box">
         <div class="tab-content">
            <div class="tab-pane show active">
               <form action="{{ route('admin.profile') }}" method="post" enctype="multipart/form-data" data-parsley-validate >
                  @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Enter name" value="{{ Auth::guard('admin')->user()->name }}" required=""  data-parsley-required-message="Please enter name" maxlength="25" data-parsley-minlength="2" data-parsley-minlength-message="Minimum 2 characters are required">
                    </div>

                    <div class="form-group">
                        <label for="useremail">Email Address</label>
                        <input type="email"  name="email" class="form-control" placeholder="Enter email" value="{{ Auth::guard('admin')->user()->email }}" disabled>
                    </div>

                    <div class="form-group mb-3">
                        <label>Phone Number</label>
                        <input type="text" name="phone_number" class="form-control" required=""  value="{{ Auth::guard('admin')->user()->phone_number }}"  placeholder="Enter Phone Number" data-parsley-required-message="Please enter phone number" maxlength="10" data-parsley-minlength="10" data-parsley-minlength-message="Please enter valid number" data-parsley-type="number" data-parsley-type-message="Please enter valid phone number">
                    </div>

                    <div class="form-group">
                        <label for="useremail">Other Info</label>
                        <input type="text"  name="other_info" class="form-control" placeholder="Enter Other Info" value="{{ Auth::guard('admin')->user()->other_info }}">
                    </div>

                    <div class="form-group mb-3">
                        <label>Profile Picture</label>
                        <div class="custom-file">
                           <input type="file" name="profile_photo" class="custom-file-input preview_file" data-parsley-fileextension='jpeg,jpg,png'>
                           <label class="custom-file-label">Choose file</label>
                           @if (!empty(Auth::guard('admin')->user()->profile_photo) && Storage::exists(Auth::guard('admin')->user()->profile_photo))
                              <img src="{{ url(Storage::url(Auth::guard('admin')->user()->profile_photo)) }}" alt="" class="img-fluid img-thumbnail mt-2 preview_img" width="130">
                           @else
                              <img src="{{ asset('images/default.png') }}" alt="" class="img-fluid img-thumbnail mt-2 preview_img" width="100">
                           @endif
                        </div>
                    </div>

                    <div class="text-right mt-5">
                        <button type="submit" class="btn button-color waves-effect waves-light"><i class="mdi mdi-content-save"></i> Save</button>
                        <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary waves-effect">Cancel</a>
                    </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
@endsection
