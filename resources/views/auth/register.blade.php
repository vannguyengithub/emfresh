@extends('layouts.app')

@section('title', 'Sign Up for an Account')

@section('content')
    <div class="emfresh-register emfresh-login emfresh_mr-login-register">
        <div class="ty-register">
            <div class="ty__register__wrapper signup__with-step" id="verify_step">  
                <div class="ty__register__wrapper sigup__with-phone signup__with-step">
                    <div class="ty__progress" id="ty__progress">
                        <div class="ty__step active" data-step="1">
                            <div class="ty__bullet">
                                <div class="ty__step__number"><span>1</span></div>
                                <p>Nhập SĐT </p>
                            </div>
                        </div>
                        <div class="ty__step" data-step="2"> 
                            <div class="ty__bullet">
                                <div class="ty__step__number">
                                    <span>2</span>
                                </div>
                                <p>Xác thực</p>
                            </div>
                        </div>
                        <div class="ty__step" data-step="3">
                            <div class="ty__bullet">
                                <div class="ty__step__number">
                                    <span>3</span>
                                </div>
                                <p>Cài mật khẩu </p>
                            </div>
                        </div>
                    </div>

                    <div class="ty-account">
                        @if(count($errors) > 0)
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif
                        <div class="ty-account__form">
                            <form name="register" id="register" action="{{ route('register') }} " method="POST" data-otp-form="register">
                                @csrf
                                <div class="ty__form form_step_1" data-step="1">
                                    <h2 class="ty-mainbox-title">
                                        Đăng ký
                                    </h2>
                                    <div class="ty-control-group intl-tel-input ty-profile-field__item ty-billing-phone">
                                        <label for="phone" class="ty-control-group__title">Điện thoại</label>
                                        <input type="text" id="phone" name="phone" size="12" value="" class="ty-input-text ty-login__input with-icon" placeholder="Nhập số điện thoại của bạn" autocomplete="off" required>
                                        <div class="invalid-feedback d-none" id="invalid-phone">
                                            Số điện thoại không đúng định dạng
                                        </div>
                                    </div>
                                    <div id="recaptcha-container"></div>

                                    <button type="button" class="ty-btn__login active register_btn" data-step="1">
                                        <span> Tạo tài khoản</span>
                                    </button>

                                    <div class="login__divider">OR</div>

                                    @include('auth.components.login_social')

                                    <div class="ty__sign-up">
                                        <a href="{{ route('login') }}">
                                            <span>Đã có tài khoản ? đăng nhập</span>
                                            <i class="fa-solid fa-arrow-right-long"></i> 
                                        </a>
                                    </div>
                                    <div class="ty-newsletters">
                                        By continuing, you agree to CHUS’s
                                        <a href="">Terms of Service</a>
                                        and acknowledge you've read our 
                                        <a href="">Privacy Policy</a>
                                    </div>
                                </div>

                                @include('auth.components.otp_step')

                                <div class="ty__form form_step_3 d-none" data-step="3">
                                    <h2 class="ty-mainbox-title">
                                        Nhập thông tin đăng ký
                                    </h2>

                                    <div class="ty-control-group ty-control-0">
                                        <label for="name" class="ty-control-group__title">
                                            Tên
                                        </label>
                                        <input id="name" type="name" class="ty-input-text ty-login__input" name="name" value="" placeholder="Tên của bạn" required>
                                    </div>

                                    <div class="ty-control-group ty-control-0">
                                        <label for="email" class="ty-control-group__title">
                                            E-mail
                                        </label>
                                        <input id="email" type="email" class="ty-input-text ty-login__input" name="email" value="" placeholder="E-mail" required>
                                    </div>

                                    <div class="ty-control-group ty-control-0" id="show_hide_password" >
                                        <label for="password1" class="ty-control-group__title">
                                            Mật khẩu
                                        </label>
                                        <input type="password" id="password" name="password" size="32" maxlength="32" value="" class="ty-input-text ty-login__input" autocomplete="off" placeholder="******" required>
                                        <div class="input-group-addon">
                                            <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="ty-control-group ty-control-0" id="show_hide_password-1">
                                        <label for="password_confirmation" class="ty-control-group__title">
                                            Xác nhận mật khẩu
                                        </label>
                                        <input type="password" id="password_confirmation" name="password_confirmation" size="32" maxlength="32" value="" class="ty-input-text ty-login__input" autocomplete="off" placeholder="******" required>
                                        <div class="input-group-addon">
                                            <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="main__action">
                                        <button class="main__action-next next-step ty-float-right next-2" data-step="3" type="submit">
                                            <span class="emfresh_mr-2">Hoàn tất</span>
                                            <i class="fa-solid fa-chevron-right"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $('.digit-group').find('input').each(function() {
            $(this).attr('maxlength', 1);
            $(this).on('keyup', function(e) {
                var parent = $($(this).parent());
                isDisable = true;
                if (e.keyCode === 8 || e.keyCode === 37) {

                    var prev = parent.find('input#' + $(this).data('previous'));

                    if (prev.length) {
                        $(prev).select();
                    }
                } else if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
                    var next = parent.find('input#' + $(this).data('next'));
                    if (next.length) {
                        $(next).select();
                    } else {
                        isDisable = false;
                    }
                }

                $('button[data-step=2]').prop('disabled',isDisable);
            });
        });
    </script>
@endpush