@extends('layout')

@section('title', 'Reset Password')

@section('content')
    <div class="emfresh-register emfresh-login">
        <div class="ty-login ty__register__wrapper">
            <div class="ty-recover-password">
                @if (session()->has('status'))
                <div class="alert alert-success">
                    {{ session()->get('status') }}
                </div>
                @endif @if(count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif
                <h2 class="ty-mainbox-title">Khôi phục mật khẩu mới</h2>

                <form class="form-horizontal" method="POST" action="{{ route('password.request') }}">
                    @csrf

                    <input type="hidden" name="token" value="{{ $token }}" />

                    <input id="email" type="hidden" class="ty-input-text ty-login__input" name="email" value="{{ $email }}" placeholder="Email" required autofocus>
                    
                    <div class="ty-control-group">
                        <label for="password" class="ty-login__filed-label ty-control-group__label">
                            Mật khẩu mới
                        </label>
                        <input id="password" type="password" class="ty-input-text ty-login__input" name="password" placeholder="Password" required>
                    </div>

                    <div class="ty-control-group">
                        <label for="password" class="ty-login__filed-label ty-control-group__label">
                            Nhập lại mật khẩu
                        </label>
                        <input id="password-confirm" type="password" class="ty-input-text ty-login__input" name="password_confirmation" placeholder="Confirm Password" required>
                    </div>

                    <div class="login-container">
                        <button type="submit" class="ty-btn__secondary ty-btn__login active ty-btn" type="button">Khôi phục mật khẩu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection



