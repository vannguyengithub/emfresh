import Axios from "axios";
import { initializeApp } from "firebase/app";
import { getAuth , RecaptchaVerifier , signInWithPhoneNumber} from "firebase/auth";

const firebaseConfig = {
    apiKey: "AIzaSyDY26SeAi1a6QlkIFkuQ_mUVmBzlqTp_Ek",
    authDomain: "emfresh.firebaseapp.com",
    projectId: "emfresh",
    storageBucket: "emfresh.appspot.com",
    messagingSenderId: "518349341735",
    appId: "1:518349341735:web:683f0e5eda8c11eee0fa02",
    measurementId: "G-X7JYGF95XR"
};
  
  // Initialize Firebase
const firebase = initializeApp(firebaseConfig);

class emfreshOTP {

    constructor(auth){
        this.auth = auth;
        this.auth.languageCode = 'it';
    }

    render() {
        window.recaptchaVerifier = new RecaptchaVerifier('recaptcha-container',{
            'size': 'invisible',
            'callback': (response) => {
                // reCAPTCHA solved, allow signInWithPhoneNumber.
                onSignInSubmit();
            }
        },this.auth);
        recaptchaVerifier.render();
    }

    async sendOTP(number) {
        number = this.rebuildPhone(number);
        
        return await signInWithPhoneNumber(this.auth , number, window.recaptchaVerifier);
    }

    async verify(code) {
        return await window.confirmationResult.confirm(code)
    }

    countDownTimer(){
        var current_time = new Date().getTime();
        var countDownDate = current_time + 60 * 5 * 1000;

        var x = setInterval(function() {

            // Get today's date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;
            // Time calculations for days, hours, minutes and seconds
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Display the result in the element with id="demo"
            document.getElementById("otp_count_down").innerHTML = '(' + minutes + ':' + seconds + ')';
            // If the count down is finished, write some text
            if (distance < 0) {
                clearInterval(x);
                window.location.href = '/register';
            }
        }, 1000);
    }

    rebuildPhone(phone){
        return phone.replace('0','+84');
    }
 
    showError(text = null){
        var errorPhone = $('#invalid-phone');
        if(text) errorPhone.text(text);
        errorPhone.removeClass('d-none');
    }

    async isExistPhoneNumber(phone){
        return axios.post('/api/check-phone',{phone : phone});
    }
}

$(document).ready(function(){

    if($('form[data-otp-form]').length){
    
        var otp = new emfreshOTP(getAuth());
        var formType = $('form[data-otp-form]').data('otpForm');
        otp.render();   
        
        $('button[data-step=1]').on('click', function(){
            let phone = $('#phone').val();
            let validPhone = /^(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(phone);
            //:step 1 regex phone
            if(!validPhone){
                otp.showError('Số điện thoại không đúng định dạng');
                return;
            }

            //:step 1 check phone exists
            // fromType = register 
            if(formType == 'register'){
                otp.isExistPhoneNumber(phone).then(res => {
                    if(res.data && res.data.data.is_exist){
                        otp.showError('Số điện thoại đã tồn tại vui lòng thử số khác');
                        return;
                    }
        
                    otp.sendOTP(phone).then(function (confirmationResult) {
                        window.confirmationResult = confirmationResult;
                        $(`div[data-step=2]`).removeClass('d-none').addClass('active');
                        $('.form_step_1').addClass('d-none');
                        $('#otp_sent_phone').text(phone);
                        otp.countDownTimer();
                    }).catch(function (error) {
                        
                    });
                });  
            }
            // fromType = reset_password 
            if(formType == 'reset_password'){

                otp.isExistPhoneNumber(phone).then(res => {
                    console.log(res.data.data);

                    if(res.data && !res.data.data.is_exist){
                        otp.showError('Không tìm thấy số điện thoại');
                        return;
                    }
                    otp.sendOTP(phone).then(function (confirmationResult) {
                        window.confirmationResult = confirmationResult;
                        $(`div[data-step=2]`).removeClass('d-none').addClass('active');
                        $('.form_step_1').addClass('d-none');
                        $('#otp_sent_phone').text(phone);
                        otp.countDownTimer();
                    }).catch(function (error) {
            
                    });
                });  
            }
        });
    
    
        $('button[data-step=2]').on('click',function(){
            $('#errorOTP').addClass('d-none');
            let codeArr = [];
        
            $('.otp').each(function(index) {
              codeArr[index] = $(this).val();
            });
                    
            otp.verify(codeArr.join("")).then(function (result) {
                var user = result.user;
                if(user){

                    console.log(formType);
                    if(formType == 'register'){
                        $(`div[data-step=3]`).removeClass('d-none').addClass('active');
                        $('.form_step_2').addClass('d-none');
                    }
                    
                    if(formType == 'reset_password'){
                        $('form[data-otp-form]').submit();
                    }
                }
            }).catch(function (error) {
                $('#errorOTP').removeClass('d-none');
            });
        }); 
    }
})
