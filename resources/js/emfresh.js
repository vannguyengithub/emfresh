    // var first_step = $('#enter_phone_step');
    // var verify_step = $('#verify_step');
  
    // var ekey = '';
  
    // const firebaseConfig = {
    //   apiKey: "AIzaSyAtH7hWuC-zKJrq84IHU3JR8s4-9Z2IH0s",
    //   authDomain: "chus-357408.firebaseapp.com",
    //   projectId: "chus-357408",
    //   storageBucket: "chus-357408.appspot.com",
    //   messagingSenderId: "10145352090",
    //   appId: "1:10145352090:web:6b51563c017c619f2b1223",
    //   measurementId: "G-4G1BMHGX96"
    // };
  
    // // Initialize Firebase
    // firebase.initializeApp(firebaseConfig);
  
    // $.ceEvent('on', 'ce.commoninit', function(context) {
    //   _render();
    // });
  
  
    // $('#register_from').submit(function(e) {
    //   e.preventDefault();
    //   // get all the inputs into an array.
    //   var $inputs = $('#register_from :input');
  
    //   // not sure if you wanted this, but I thought I'd add it.
    //   // get an associative array of just the values.
    //   var form_values = {};
    //   $inputs.each(function() {
    //     form_values[this.name] = $(this).val();
    //   });
  
    //   $.ceAjax('request', fn_url('auth.validate_phone_number'), {
    //     method: 'post',
    //     hidden: true,
    //     caching: false,
    //     data: form_values,
    //     callback: function(data) {
    //       if (data.text) {
    //         ekey = data.text;
    //         _sendOTP();
    //       }
    //     }
    //   });
    // });
  
    // $('#profiles_register_form_verify').submit(function(e) {
    //   e.preventDefault();
  
    //   let codeArr = [];
    //   $('.otp').each(function(index) {
    //     codeArr[index] = $(this).val();
    //   });
  
    //   _verify(codeArr.join(""));
  
    // });
  
    // function _render() {
    //   window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
    //     size: "invisible",
    //     callback: (response) => {
    //       //onSignInSubmit();
    //     },
    //   });
    //   recaptchaVerifier.render();
    // }
  
    // function _sendOTP() {
    //   var number = $("input[name=full_number]").val();
  
    //   firebase.auth().signInWithPhoneNumber(number, window.recaptchaVerifier).then(function(confirmationResult) {
    //     window.confirmationResult = confirmationResult;
    //     coderesult = confirmationResult;
  
    //     first_step.addClass('hidden');
    //     verify_step.removeClass('hidden');
    //     _countDownTimeOtp();
  
    //     $.ceNotification('show', {
    //       type: 'N',
    //       title: Tygh.lang.notice,
    //       message: Tygh.lang.otp_sent
    //     });
  
    //   }).catch(function(error) {
  
    //     $.ceNotification('show', {
    //       type: 'E',
    //       title: Tygh.lang.error,
    //       message: error.message
    //     });
    //   });
    // }
  
    // function _verify(code) {
    //   coderesult.confirm(code).then(function(result) {
    //     var user = result.user;
    //     if (ekey.length && user) {
    //       window.location.href = fn_url('auth.register?step=2&ekey=' + ekey);
    //     }
  
    //   }).catch(function(error) {
    //     $.ceNotification('show', {
    //       type: 'E',
    //       title: Tygh.lang.error,
    //       message: error.message
    //     });
    //   });
    // }
  
    // function _countDownTimeOtp() {
    //   var current_time = new Date().getTime();
    //   var countDownDate = current_time + 60 * 5 * 1000;
  
    //   var x = setInterval(function() {
  
    //     // Get today's date and time
    //     var now = new Date().getTime();
  
    //     // Find the distance between now and the count down date
    //     var distance = countDownDate - now;
    //     // Time calculations for days, hours, minutes and seconds
    //     var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    //     var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  
    //     // Display the result in the element with id="demo"
    //     document.getElementById("otp_count_down").innerHTML = '(' + minutes + ':' + seconds + ')';
  
    //     // If the count down is finished, write some text
    //     if (distance < 0) {
    //       clearInterval(x);
    //       window.location.href = fn_url('auth.register');
    //       //document.getElementById("otp_count_down").innerHTML = "EXPIRED";
    //     }
    //   }, 1000);
    // }
  
import { Autoplay, Navigation, Pagination } from "swiper";
import Swiper from "swiper";
Swiper.use([Autoplay, Navigation, Pagination]);
    
$(function(){
    const swiper = new Swiper('.swiper-review', {
        slidesPerView: 1,
        spaceBetween: 30,
        centeredSlides: true,
        grabCursor: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        loop: true,
        breakpoints: {
            640: {
              slidesPerView: 3,
              spaceBetween: 30,
              navigation: {enabled: false},
            }
          }
    });

    $('.check-change').change(function() {
        $(this).find(':submit').prop('disabled',false);
    });
})