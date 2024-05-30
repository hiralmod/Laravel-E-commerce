@extends('admin.layouts.master')
@section('title', 'Change Password')
@section('content')
<!-- start page title -->
<div class="row mt-3">
   <div class="col-12">
      <div class="page-title-box">
            <div class="page-title-right">
               <a href="{{ route('admin.dashboard') }}" class="btn button-color"><i class="fe-arrow-left-circle mr-1 fa-lg"></i>Back</a>
           </div>
         <h4 class="page-title">Change Password</h4>
      </div>
   </div>
</div>
<!-- end page title -->
<div class="row">
   <div class="col-lg-6 col-xl-6">
      <div class="card-box">
         <div class="tab-content">
            <div class="tab-pane show active">
               <form action="{{ route('admin.change-password') }}" method="post" enctype="multipart/form-data" data-parsley-validate >
                  @csrf
                  <div class="row">
                     <div class="col-md-12">
                        <div class="form-group">
                           <label for="firstname">Old Password</label>
                           <input type="password" name="old_password" class="form-control" id="old_password" placeholder="Enter old password" data-parsley-minlength="8" data-parsley-required-message="Please enter old password" data-parsley-minlength-message="Minimum 8 characters are required" required="">
                        </div>
                     </div>

                     <div class="col-md-12">
                        <div class="form-group">
                           <label for="lastname">New Password</label>
                           <input type="password" name="new_password" class="form-control" id="new_password" placeholder="Enter new password" data-parsley-minlength="8" data-parsley-required-message="Please enter new password" data-parsley-minlength-message="Minimum 8 characters are required"  required="">
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-12">
                        <div class="form-group">
                           <label>Confirm Password</label>
                           <input type="password" name="confirm_password" class="form-control" id="confirm_password" placeholder="Enter confirm password" data-parsley-minlength="8"
                           data-parsley-required-message="Please enter confirm password"  data-parsley-minlength-message="Minimum 8 characters are required"  data-parsley-equalto="#new_password" data-parsley-equalto-message="Confirm password field does not match the password field."  required="">
                        </div>
                     </div>
                  </div>
                  <div class="text-right mt-2">
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