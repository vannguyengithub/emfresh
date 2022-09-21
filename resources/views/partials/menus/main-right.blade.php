<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    @guest
        <div class="user no-login">
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
        <div class="user has-login">
            <div class="user-info d-flex align-items-center">
                <img class="user-avt rounded-circle" alt="" title="" width="36" height="36" src="/{{ Auth::user()->avatar }}">
                <div class="user-info-detail">Xin chào, <span>{{ Auth::user()->name }} {{ Auth::user()->lastname }}</div>
            </div>
            @include('partials.menus.profile')
        </div>
    @endguest
</div>  