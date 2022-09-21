<div class="ty__form form_step_2 d-none" data-step="2">
    <h2 class="ty-mainbox-title">Xác thực số điện thoại</h2>
    <div class="ty__sent__otp">
        <p>Chúng tôi đã gửi mã OTP đến số điện thoại:</p>
        <span class="opt-phone-number" id="otp_sent_phone"></span>
    </div>
    <div class="__ty-control-group">
        <label for="otp" class="ty-control-group__label cm-required cm-trim">
            Nhập mã OTP
        </label>
        <div class="ty-control-group-otp digit-group">
            <input class="otp error" name="otp[]" id="digit-1" data-next="digit-2" type="tel" maxlength=1 min="0" max="9" placeholder="0" autocomplete="off" pattern="[0-9]" />
            <input class="otp error" name="otp[]" id="digit-2" data-next="digit-3" data-previous="digit-1" type="tel" maxlength=1 min="0" max="9" placeholder="0" autocomplete="off" pattern="[0-9]"/>
            <input class="otp error" name="otp[]" id="digit-3" data-next="digit-4" data-previous="digit-2" type="tel" maxlength=1 min="0" max="9" placeholder="0" autocomplete="off" pattern="[0-9]" />
            <input class="otp error" name="otp[]" id="digit-4" data-next="digit-5" data-previous="digit-3" type="tel" maxlength=1 min="0" max="9" placeholder="0" autocomplete="off" pattern="[0-9]" />   
            <input class="otp error" name="otp[]" id="digit-5" data-next="digit-6" data-previous="digit-4" type="tel" maxlength=1 min="0" max="9" placeholder="0" autocomplete="off" pattern="[0-9]"/>
            <input class="otp error" name="otp[]" id="digit-6" data-previous="digit-5" type="tel" maxlength=1 min="0" max="9" placeholder="0" autocomplete="off" pattern="[0-9]"/>     
        </div>
    </div>
    <div class="resend__otp">
        <a class="d-flex" href="{{ route('register')}}">
            <span>Gửi lại mã OTP</span>
        </a>
        <span id="otp_count_down" class="emfresh_ml-2">(5:00)</span>
    </div>
    <span class="invalid-feedback d-none" id="errorOTP">Mã OTP không đúng</span>
    <div class="main__action">
        <a href="{{ route('register') }}" class="change-phone-btn">
            <span>Đổi số điện thoại khác</span>
        </a>
        <button class="main__action-next next-step active" type="button" data-step="2" disabled>
            <span class="emfresh_mr-2">Tiếp tục</span>
            <i class="fa-solid fa-chevron-right"></i>                                        
        </button>
    </div>
</div>