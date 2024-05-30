<!-- start Topbar -->
<div class="navbar-custom">
    <ul class="list-unstyled topnav-menu float-right mb-0">
        <li class="dropdown notification-list">
            <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                @if (!empty(Auth::guard('admin')->user()->profile_photo) && Storage::exists(Auth::guard('admin')->user()->profile_photo))
                    <img src="{{ url(Storage::url(Auth::guard('admin')->user()->profile_photo)) }}" alt="user-image" class="rounded-circle">
                @else
                    <img src="{{asset('images/default.png')}}" alt="user-image" class="rounded-circle">
                @endif
                <span class="pro-user-name ml-1"> {{ Auth::guard('admin')->user()->name }}<i class="mdi mdi-chevron-down"></i>
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right profile-dropdown">
                <!-- item-->
                <div class="dropdown-header noti-title">
                    <h6 class="text-overflow m-0">Welcome !</h6>
                </div>

                <!-- item-->
                <a href="{{ route('admin.profile') }}" class="dropdown-item notify-item">
                    <i class="fe-user"></i>
                    <span>My Account</span>
                </a>

                <a href="{{ route('admin.change-password') }}" class="dropdown-item notify-item">
                    <i class="fe-lock"></i>
                    <span>Change Password</span>
                </a>

                <div class="dropdown-divider"></div>

                <!-- item-->
                <a href="{{ route('admin.logout') }}" class="dropdown-item notify-item">
                    <i class="fe-log-out"></i>
                    <span>Logout</span>
                </a>

            </div>
        </li>
    </ul>

    <!-- LOGO -->
    <div class="logo-box">
        <a href="{{ route('admin.dashboard') }}" class="logo text-center">
            <span class="logo-lg">
                <img src="{{ asset('assets/images/e-commerce-logo.jpg')}}" alt="" height="40">
            </span>
            <span class="logo-sm">
                <img src="{{ asset('assets/images/e-commerce-logo.jpg')}}" alt="" height="50">
            </span>
        </a>
    </div>

    <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
        <li>
            <button class="button-menu-mobile waves-effect waves-light">
                <i class="fe-menu"></i>
            </button>
        </li>
    </ul>

</div>
<!-- end Topbar -->
