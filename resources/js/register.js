// (function() {
// 'use strict';
// window.addEventListener('load', function() {
//     // Fetch all the forms we want to apply custom Bootstrap validation styles to
//     var forms = document.getElementsByClassName('needs-validation');
//     // Loop over them and prevent submission
//     var validation = Array.prototype.filter.call(forms, function(form) {
//     form.addEventListener('submit', function(event) {
//         if (form.checkValidity() === false) {
//         event.preventDefault();
//         event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//     }, false);
//     });
// }, false);
// })();
$(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if ($('#show_hide_password input').attr("type") == "text") {
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass("fa-eye-slash");
            $('#show_hide_password i').removeClass("fa-eye");
        } else if ($('#show_hide_password input').attr("type") == "password") {
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass("fa-eye-slash");
            $('#show_hide_password i').addClass("fa-eye");
        }
    });
    $("#show_hide_password-1 a").on('click', function(event) {
        event.preventDefault();
        if ($('#show_hide_password-1 input').attr("type") == "text") {
            $('#show_hide_password-1 input').attr('type', 'password');
            $('#show_hide_password-1 i').addClass("fa-eye-slash");
            $('#show_hide_password-1 i').removeClass("fa-eye");
        } else if ($('#show_hide_password-1 input').attr("type") == "password") {
            $('#show_hide_password-1 input').attr('type', 'text');
            $('#show_hide_password-1 i').removeClass("fa-eye-slash");
            $('#show_hide_password-1 i').addClass("fa-eye");
        }
    });
})


$('.custom-control-input').change(function() {
    if ($(this).is(":checked")) {
        $('.choose-food__change-menu-desc').addClass("active");
        $('.form-group__custome-select').addClass("active");

    } else {
        $('.choose-food__change-menu-desc').removeClass("active");
        $('.form-group__custome-select').removeClass("active");
        
    }
});