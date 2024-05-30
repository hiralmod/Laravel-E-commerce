<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>EWW- Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="{{ asset('assets/images/e-commerce-logo.jpg')}}">

        <!-- App css -->
        <link href="{{ asset('assets/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assets/css/icons.min.css')}}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assets/css/app.min.css')}}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assets/css/custom.css')}}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assets/css/tostar.css') }}" rel="stylesheet" type="text/css" />

    </head>

    <body class="backgroundGreenColor">
        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-pattern">
                            <div class="card-body p-4">
                                <div class="text-center w-75 m-auto">
                                    <a href="index">
                                        <span><img src="{{ asset('assets/images/e-commerce-logo.jpg')}}" alt="" height="130"></span>
                                    </a>
                                    <p class="text-muted mb-4 mt-3">Enter your email address and password to proceed further.</p>
                                </div>

                                <form action ="{{ route('website.register') }}" method="post" data-parsley-validate>
                                    @csrf

                                    <div class="form-group mb-3">
                                        <label for="name">Name</label>
                                        <input class="form-control" type="text" id="name" name="name" required="" data-parsley-required-message="Please enter name" placeholder="Enter your name" value="{{ old('name') }}">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="emailaddress">Email address</label>
                                        <input class="form-control" type="email" id="emailaddress" name="email" required="" data-parsley-required-message="Please enter email address" data-parsley-type-message="Please enter valid email address" placeholder="Enter your email" value="{{ old('email') }}">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="password">Phone Number</label>
                                        <input class="form-control" type="text" required="" id="phone_number" name="phone_number" placeholder="Enter your phone number" data-parsley-required-message="Please enter phone number" onkeypress="return isNumber(event)" maxlength="10" data-parsley-minlength="10" data-parsley-type-message="Please enter valid phone number">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="password">Password</label>
                                        <input class="form-control" type="password" required="" id="password" name="password" placeholder="Enter your password" data-parsley-required-message="Please enter password ">
                                    </div>

                                    <div class="form-group mb-4 text-center">
                                        <button class="btn btn-block backgroundGreenColor" type="submit">Sign Up</button>
                                    </div>
                                    <h5 class="text-center">Already have an account?<a href="{{ route("login") }}" class="textGreenColor sign-up-text">Login</a></h5>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer footer-alt">
            {{date('Y')}} &copy; Fresh Cart
        </footer>

        <!-- Vendor js -->
        <script src="{{ asset('assets/js/vendor.min.js')}}"></script>

        <!-- App js -->
        <script src="{{ asset('assets/js/app.min.js')}}"></script>
        <script src="{{ asset('assets/js/parsley.min.js')}}"></script>
        <script src="{{ asset('assets/js/tostar.js') }}"></script>

        @include('admin.layouts.message')
    </body>
</html>