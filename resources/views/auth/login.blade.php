@extends('layouts.app')

@section('title', 'Login')

@section('content')
    <div class="emfresh-login emfresh_mr-login-register">
        <div class="ty-login">
            <h2 class="ty-mainbox-title">
                Đăng nhập
            </h2>
            
            @include('auth.components.login_social')

            <div class="login__divider">OR</div>

            <form name="main_login_form" action="{{ route('login') }}" method="POST" class="needs-validation">
                @csrf
                <div class="ty-control-group">
                    <label for="phone" class="ty-login__filed-label ty-control-group__label">
                        Số điện thoại
                    </label>
                    <input class="ty-login__input @if($errors->has('phone')) error @endif" id="phone" name="phone" size="30" placeholder="Nhập số điện thoại" value="{{ old('phone') }}" required autofocus>
                    @if($errors->has('phone'))<span class="invalid-feedback">{{ $errors->first('phone')}}</span>@endif
                </div>
                <div class="ty-control-group">
                    <label for="password" class="ty-login__filed-label ty-control-group__label">
                        Mật khẩu
                    </label>
                    <input type="password" class="ty-login__input" id="password" name="password" size="30" maxlength="32" placeholder="Nhập mật khẩu" value="{{ old('password') }}" required>
                </div>
                <div class="ty-login__remember-me ">
                    <label class="ty-login__remember-me-label hidden" for="remember">
                        <input class="checkbox" type="checkbox" name="remember" id="remember" value="Y" {{ old('remember') ? 'checked' : '' }}>
                            Nhớ mật khẩu
                    </label>
                    <label class="ty-password-forgot">
                        <a href="{{ route('password.request') }}">Quên mật khẩu?</a>
                    </label>
                </div>
                <button class="ty-btn__login ty-btn__secondary ty-btn active" type="submit">
                    Đăng nhập
                </button>
                <div class="ty__sign-up emfresh_mt-2">
                    <a href="{{ route('register') }}">
                        <span>Chưa có tài khoản? Đăng ký ngay</span>
                        <svg width="21" height="20" viewBox="0 0 21 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M4.66671 10.8333H13.975L9.90837 14.9C9.58337 15.225 9.58337 15.7583 9.90837 16.0833C10.2334 16.4083 10.7584 16.4083 11.0834 16.0833L16.575 10.5917C16.9 10.2667 16.9 9.74166 16.575 9.41666L11.0917 3.91666C10.7667 3.59166 10.2417 3.59166 9.91671 3.91666C9.59171 4.24166 9.59171 4.76666 9.91671 5.09166L13.975 9.16666H4.66671C4.20837 9.16666 3.83337 9.54166 3.83337 10C3.83337 10.4583 4.20837 10.8333 4.66671 10.8333Z" fill="black"/>
                        </svg>                        
                    </a>
                </div>
            </form>
            <div class="ty-newsletters"> 
                Bằng việc tạo tài khoản, bạn đã chấp nhận và đồng ý với những
                <a href="">Điều khoản dịch vụ</a>
                    và 
                <a href="">Chính sách bảo mật</a>
                của em.fresh
            </div>
        </div>
    </div>
@endsection
