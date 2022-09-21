{{-- <header>
    <div class="top-nav container">
      <div class="top-nav-left">
          <div class="logo"><a href="/">Ecommerce</a></div>
          @if (! (request()->is('checkout') || request()->is('guestCheckout')))
          {{ menu('main', 'partials.menus.main') }}
          @endif
      </div>
      <div class="top-nav-right">
          @if (! (request()->is('checkout') || request()->is('guestCheckout')))
            @include('partials.menus.main-right')
          @endif
      </div>
    </div> <!-- end top-nav -->
</header> --}}

<header id="header" class="header d-none d-sm-block @if(request()->route()->getName() == 'landing-page') hidden @endif">
    <div class="max-w-1120 mx-auto">
        <nav class="navbar navbar-expand-lg navbar-light emfresh_navbar">
            <a class="navbar-brand" href="/" >
                <img src="{{ asset( 'storage/' .setting('site.logo'))}}" alt="{{ setting('site.title')}}" />
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            {{ menu('main', 'partials.menus.main') }}
            <div class="header-right header-right-login">
                <div class="dropdown">
                    <button class="btn btn-outline-black dropdown-toggle d-flex align-items-center" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa-solid fa-bars"></i>
                        <div class="icon-user position-relative">
                            <i class="fa-solid fa-user"></i>
                            <!-- have notification-->
                            <div class="notification"></div>
                            <!-- end have notification-->
                        </div>
                    </button>
                    
                    @include('partials.menus.main-right')
                </div>

                <div class="cart emfresh_ml-6">
                    <div class="dropleft">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownCart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span class="badge badge-pill badge-primary badge-up cart-item-count">{{ Cart::count()}}</span>
                        </a>
                        <div class="dropdown-menu dropdown-cart" aria-labelledby="dropdownCart">
                            <div class="scroll-bar-wrap-inner">
                                <div class="scroll-box-modal">
                                    @foreach(Cart::content() as $cartItem)
                                        <div class="dropdown-item">
                                            <div class="dropdown-cart-item">
                                                <div class="emfresh-card-header">
                                                    <div class="d-flex align-items-center justify-content-between">
                                                        <div class="title">
                                                            {{ $cartItem->model->name }}
                                                        </div>
                                                        <div class="amount">
                                                        x{{$cartItem->qty}}
                                                        </div>
                                                        <div class="price">
                                                            {{ number_format($cartItem->price)}}đ
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="emfresh-card-body">
                                                    <div class="packege-order">
                                                        <img class="img-fluid" src="{{ asset('/storage/' . $cartItem->model->image )}}" alt="product" width="96" height="133">
                                                        <div class="info">
                                                            <div class="variant-list">
                                                                <div class="variant">
                                                                    Thời gian đăng ký:
                                                                    {{-- <div class="detail">01/08/2022 - 07/08/2022</div> --}}
                                                                </div>
                                                                <div class="variant">
                                                                    Số ngày:
                                                                    <div class="detail">Gói {{ isset($cartItem->options['meal_of_week']) ? $cartItem->options['meal_of_week'] .' ngày (thứ 2 - thứ 6)' : 0 }}</div>
                                                                </div>  
                                                                <div class="variant">
                                                                    Yêu cầu đặc biệt:
                                                                    @if(isset($cartItem->options['extra']))
                                                                        @foreach($cartItem->options['extra'] as $key => $checked)
                                                                            @if($checked == 'Y')
                                                                                <div>{{ __("emfresh.extra_services.".$key)}}</div>
                                                                            @endif
                                                                        @endforeach
                                                                    @endif
                                                                </div>  
                                                            </div>
                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            
                            <div class="text-center">
                                <a href="{{ route("checkout.index" , ['step' => 4])}}" class="btn ty-btn__success rounded-pill btn-continue-checkout">
                                    Thanh toán ngay
                                </a>
                            </div>
                      </div>

                    </div>
                </div>
            </div>
            </div>
        </nav>
    </div>
</header>

<header class="header d-block d-sm-none">
    <div class="header-mb">
        {{-- {{ request()->route()->getName()}} --}}
        @if((request()->is('login')))
            <div class="back header-left">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M16.6201 2.99C16.1301 2.5 15.3401 2.5 14.8501 2.99L6.54006 11.3C6.15006 11.69 6.15006 12.32 6.54006 12.71L14.8501 21.02C15.3401 21.51 16.1301 21.51 16.6201 21.02C17.1101 20.53 17.1101 19.74 16.6201 19.25L9.38006 12L16.6301 4.75C17.1101 4.27 17.1101 3.47 16.6201 2.99Z" fill="black"/>
                </svg>                
            </div>
        @endif

        <div class="logo">
            <img src="./assets/images/logo.png" alt="logo">
        </div>
        <div class="header-right header-right-login">
                <div class="dropdown">
                    <button class="btn d-flex align-items-center" type="button" id="toggle-menusidebar" data-toggle="sidebar" data-action="open" data-side="left" data-id="chus-main_menu">
                        <div class="icon-user position-relative">
                            <i class="fa-solid fa-user"></i>
                            <div class="notification"></div>
                        </div>
                    </button>
                    <div class="menusidebar sidebars" id="chus-main_menu">
                        <div class="sidebar left" style="left: calc(-101%);">
                            <div class="menusidebar-header">
                                <div class="d-flex align-items-center justify-content-between"></a>
                                    <img src="./assets/images/logo.png" alt="logo">
                                    <div class="icon-close d-flex align-items-center">
                                        <button class="btn close_toggle-menusidebar" data-action="close" data-side="left" data-id="chus-main_menu">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip0_171_56266)">
                                                    <path d="M5.30612 19.7669L12 13.073L18.6939 19.7669C18.7638 19.8369 18.8571 19.9068 18.9504 19.9302C19.0437 19.9768 19.137 20.0001 19.2303 20.0001C19.3236 20.0001 19.4402 19.9768 19.5335 19.9535C19.6268 19.9068 19.7201 19.8602 19.7901 19.7902C19.8601 19.7202 19.9067 19.6269 19.9534 19.5337C20 19.4404 20 19.3471 20 19.2304C20 19.1371 19.9767 19.0205 19.93 18.9506C19.8834 18.8573 19.8367 18.7873 19.7668 18.7173L13.0729 12.0001L19.7668 5.30624C19.8834 5.18963 19.9534 5.07301 19.9767 4.90974C20 4.7698 20 4.60654 19.93 4.46659C19.8601 4.32665 19.7668 4.21003 19.6501 4.11674C19.5335 4.04677 19.3703 4.00012 19.2303 4.00012C19.0204 4.00012 18.8338 4.09342 18.6939 4.23336L12 10.9272L5.30612 4.23336C5.23615 4.16339 5.14286 4.09342 5.04956 4.07009C4.95627 4.02345 4.86297 4.00012 4.74636 4.00012C4.60641 4.00012 4.46647 4.04677 4.32653 4.14006C4.20991 4.21003 4.11662 4.32665 4.06997 4.46659C4.02332 4.60654 4 4.7698 4.02332 4.90974C4.04665 5.04968 4.11662 5.18963 4.23324 5.30624L10.9271 12.0001L4.23324 18.694C4.16327 18.764 4.09329 18.8573 4.06997 18.9506C4.02332 19.0439 4 19.1371 4 19.2304C4 19.3237 4.02332 19.4404 4.04665 19.5337C4.06997 19.6269 4.13994 19.7202 4.20991 19.7902C4.27988 19.8602 4.37318 19.9068 4.46647 19.9535C4.55977 20.0001 4.65306 20.0001 4.76968 20.0001C4.86297 20.0001 4.97959 19.9768 5.04956 19.9302C5.14286 19.8835 5.23615 19.8369 5.30612 19.7669Z" fill="#000000"></path>
                                                </g>
                                                <defs>
                                                    <clipPath id="clip0_171_56266">
                                                        <rect width="16" height="16" fill="white" transform="translate(4 4.00012)"></rect>
                                                    </clipPath>
                                                </defs>
                                            </svg>                        
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="menusidebar-boby">
                                <div class="user">
                                    @guest
                                        <div class="no-login">
                                            <div class="d-flex align-items-center justify-content-around">
                                                <div class="btn-login ty-btn ty-btn__outline-success">
                                                    <a href="{{ route('register') }}">
                                                        Đăng ký
                                                    </a>
                                                </div>
                                                <div class="btn-login ty-btn ty-btn__success ">
                                                    <a href="{{ route('login') }}">
                                                        Đăng nhập
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                        <!-- end no login -->
                                        <div class="has-login">
                                            <div class="user-info d-flex align-items-center">
                                                <img class="user-avt rounded-circle" alt="" title="" width="36" height="36" src="/{{ Auth::user()->avatar }}">
                                                <div class="user-info-detail">Xin chào, <span>{{ Auth::user()->name }} {{ Auth::user()->lastname }}</div>
                                            </div>
                                            
                                        </div>
                                    @endguest
                                </div>
                                @include('partials.menus.profile')
                            </div>

                            <div class="menusidebar-footer">
                                <div class="menusidebar-footer-2">© 2022 Em.fresh</div>
                            </div>
                        </div>
                    </div>
                    @include('partials.menus.main-right')
                </div>

                <div class="cart emfresh_ml-6">
                    <div class="dropdown">
                        <a class="dropdown-toggle position-relative" href="#" role="button" id="dropdownCart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span class="badge badge-pill badge-primary badge-up cart-item-count">0</span>
                        </a>    
                    
                        <div class="dropdown-menu dropdown-cart" aria-labelledby="dropdownCart">
                            <a class="dropdown-item" href="#">
                            <div class="dropdown-cart-item">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                            Gói ăn eat clean
                                        </div>
                                        <div class="amount">
                                        x1
                                        </div>
                                        <div class="price">
                                            650.000đ
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                <div class="packege-order">
                                    <img class="img-fluid" src="/assets/images/img-product.png" alt="product" width="96px" height="133px">
                                    <div class="info">
                                        <div class="variant-list">
                                            <div class="variant">
                                                Thời gian đăng ký:
                                                <div class="detail">01/08/2022 - 07/08/2022</div>
                                            </div>
                                            <div class="variant">
                                                Số ngày:
                                                <div class="detail">Gói 5 ngày (thứ 2 - thứ 6)</div>
                                            </div>  
                                            <div class="variant">
                                                Yêu cầu đặc biệt:
                                                <div v>Kèm khăn lạnh</div>
                                            </div>  
                                                
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            </div>

                            </a>
                            <a class="dropdown-item" href="#">
                            <div class="dropdown-cart-item">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                            Gói ăn eat clean
                                        </div>
                                        <div class="amount">
                                        x1
                                        </div>
                                        <div class="price">
                                            650.000đ
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                <div class="packege-order">
                                    <img class="img-fluid" src="/assets/images/img-product.png" alt="product" width="96px" height="133px">
                                    <div class="info">
                                        <div class="variant-list">
                                            <div class="variant">
                                                Thời gian đăng ký:
                                                <div class="detail">01/08/2022 - 07/08/2022</div>
                                            </div>
                                            <div class="variant">
                                                Số ngày:
                                                <div class="detail">Gói 5 ngày (thứ 2 - thứ 6)</div>
                                            </div>  
                                            <div class="variant">
                                                Yêu cầu đặc biệt:
                                                <div class="detail">Kèm khăn lạnh</div>
                                            </div>  
                                                
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            </div>
                            </a>
                            <a class="dropdown-item" href="#">
                            <div class="dropdown-cart-item">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                        Gói ăn chay
                                        </div>
                                        <div class="amount">
                                        x1
                                        </div>
                                        <div class="price">
                                            650.000đ
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                    <div class="packege-order">
                                        <img class="img-fluid" src="/assets/images/img-product.png" alt="product" width="96px" height="133px">
                                        <div class="info">
                                            <div class="variant-list">
                                                <div class="variant">
                                                    Thời gian đăng ký:
                                                    <div class="detail">01/08/2022 - 07/08/2022</div>
                                                </div>
                                                <div class="variant">
                                                    Số ngày:
                                                    <div class="detail">Gói 5 ngày (thứ 2 - thứ 6)</div>
                                                </div>  
                                                <div class="variant">
                                                    Yêu cầu đặc biệt:
                                                    <div class="detail">Kèm khăn lạnh</div>
                                                </div>  
                                                
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <div class="text-center">
                                <button type="button" class="btn ty-btn__success rounded-pill btn-continue-checkout">
                                    Thanh toán ngay
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
    </div>
</header>

