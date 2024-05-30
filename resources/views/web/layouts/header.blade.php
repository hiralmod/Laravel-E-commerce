<nav class="navbar navbar-expand-lg navbar-light p-3 main-navbar">
    <div class="container">
        <a href="{{ url('/') }}">
            <img src="{{ asset('assets/images/freshcart-logo.svg') }}" alt="" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse font-weight-bold" id="navbarNavDropdown">
            <ul class="navbar-nav ml-5">
                <li class="nav-item">
                    <a class="nav-link mx-2 active h5" aria-current="page" href="{{ url('/') }}">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle mx-2 h5" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false"> Category </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        @foreach ($categories as $key => $value)
                            <li><a class="dropdown-item" href="{{ url('product/'. $value->id . '/' . $value->subcategories[0]->id) }}">{{ $value->name }}</a></li>
                        @endforeach
                    </ul>
                </li>
            </ul>
        </div>

        
        <div class="d-flex ml-auto align-items-center">
            <span class="fa fa-search form-control-feedback"></span>
            <input type="text" class="form-control searchProduct mr-2" placeholder="Search By Products, Category or Sub Category" id="searchInput">
            @if(Auth::guard('website')->check()) 
                <ul class="list-unstyled mt-3">
                    <li class="dropdown notification-list">
                    <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <i class="fe-user fa-lg mr-3 text-dark"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right profile-dropdown">
                        {{-- <div class="dropdown-header noti-title">
                            <h6 class="text-overflow m-0">Welcome !</h6>
                        </div> --}}

                        <a href="{{ route('website.logout') }}" class="dropdown-item notify-item">
                            <i class="fe-log-out"></i>
                            <span>Logout</span>
                        </a>
                    </div>
                </ul>
            @endif
            <a href="{{ route('website.cart') }}" class="text-dark">
                <div class="position-relative">
                    <i class="fe-shopping-bag fa-lg"></i>
                    <span class="badge badge-pill badge-success position-absolute pt-1 d-none" style="top: -10px; right: -10px;" id="cart-counter">0</span>
                </div>
            </a>
        </div>        
    </div>
</nav>