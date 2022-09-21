@extends('layouts.app')

@section('title', 'Khôi phục mật khẩu')

@section('content')
    <div class="emfresh-register emfresh-login">
        <div class="ty-login ty__register__wrapper">
            <div class="ty-recover-password">
                <form name="recoverfrm" action="{{ route('password.email') }}" method="POST" data-otp-form="reset_password">
                    @csrf

                    <div class="ty__form form_step_1" data-step="1">
                        <h2 class="ty-mainbox-title">Đặt lại mật khẩu</h2>

                        <div class="ty-control-group">
                            <label class="ty-login__filed-label ty-control-group__label" for="phone">Số điện thoại</label>
                            <input type="text" id="phone" name="phone" size="30" value="" class="ty-login__input" placeholder="Nhập số điện thoại của bạn">
                            <div class="invalid-feedback d-none" id="invalid-phone">
                                Số điện thoại không đúng định dạng
                            </div>
                        </div>

                        <div id="recaptcha-container"></div>

                        <button class="ty-btn__secondary ty-btn__login active ty-btn" type="button" data-step="1">
                            Đặt lại mật khẩu
                        </button>

                        <div class="ty__sign-up">
                            <a href="{{ route('register')}}">
                                <span> Đã có tài khoản ? đăng nhập</span>
                                <i class="fa-solid fa-arrow-right-long"></i> 
                            </a>
                        </div>

                        @include('auth.components.auth_footer')
                    </div>

                    @include('auth.components.otp_step')
                </form>
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