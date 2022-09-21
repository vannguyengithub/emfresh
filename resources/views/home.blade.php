@extends('layouts.app')

@section('title', 'Trang chủ')
@section('content')
    <!-- Banner Homepage -->
    <div class="banner-home">
        <div class="logo-header">
            <img class="img-fluid" src="/assets/images/logo_white.png" alt="">
        </div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-sm-6 order-css">
                    <div class="float-left text-left">
                        <h2 class="title"> bữa ăn chuẩn dinh dưỡng</h2>
                        <div class="sup-title">
                            mỗi bữa ăn đều được thiết kế bởi các chuyên gia dinh dưỡng và 
                            do đầu bếp chuyên nghiệp chế biến, đảm bảo chuẩn ngon và dinh dưỡng.
                        </div>
                        <div class="btn btn-black ">
                            <a href="http://emfresh.test/login">Đặt hàng ngay</a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-6 ">
                    <div class="banner-img float-right text-center">
                        <img class="img-fluid" src="/assets/images/group_banner.png" alt="">
                    </div>

                </div>
            </div>
        </div>
        
        
    </div>
    <!-- End Banner Homepgae -->

    <!-- Header Title -->
    <div class="title-header title-header-first text-center">
        <h2 class="mb-0">QUY TRÌNH ĐẶT HÀNG</h2>
    </div>
    <!-- End Header Title -->

    <!-- Blog Order Process -->
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="blog-thumb text-center">
                    <img class="img-fluid" src="./assets/images/icon-process-1.gif" alt="">
                </div>
                <div class="blog-title d-flex align-items-center">
                    <div class="number text-center">
                        <span>1</span>
                    </div>
                    <div class="title">
                        <span>
                            Lập kế hoạch tuần
                        </span>
                    </div>
                </div>
                <div class="blog-content">
                    Thực đơn đổi mới hàng tuần, được thiết kế bởi đội ngũ chuyên gia dinh dưỡng của chúng tôi.
                </div>
            </div>

            <div class="col-md-4">
                <div class="blog-thumb text-center">
                    <img class="img-fluid" src="./assets/images/icon-process-2.gif" alt="">
                </div>
                <div class="blog-title d-flex align-items-center">
                    <div class="number text-center">
                        <span>2</span>
                    </div>
                    <div class="title"> 
                        <span>
                            em.fresh vào bếp
                        </span>
                    </div>
                </div>
                <div class="blog-content">
                    Thực phẩm tươi sạch, chọn lọc hàng ngày, chế biến chuẩn ngon bởi các đầu bếp kinh nghiệm.
                </div>
            </div>

            <div class="col-md-4">
                <div class="blog-thumb text-center">
                    <img class="img-fluid" src="./assets/images/icon-process-3.gif" alt="">
                </div>
                <div class="blog-title d-flex align-items-center">
                    <div class="number text-center">
                        <span>3</span>
                    </div>
                    <div class="title">
                        <span>
                            Hâm nóng & Thưởng thức
                        </span>
                    </div>
                </div>
                <div class="blog-content">
                    Dễ dàng thưởng thức bữa ăn ngon miệng và chuẩn dinh dưỡng chỉ với 3 phút hâm nóng. 
                </div>
            </div>

            <div class="col-12">
                <div class="img-gif">
                    <img class="img-fluid" src="./assets/images/icon-process-4.gif" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Order Process -->

    <!-- Header Title -->
    <div class="title-header title-header-seccond text-center">
        <h2 class="mb-0">
            <span>GÓI ĂN DINH DƯỠNG</span>
        </h2>
    </div>
    <!-- End Header Title -->
    <meals></meals>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="see-menu-week">
                    <a class="link-menu" href="/thuc-don">
                        Xem thực đơn tuần này
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="background-gray">
        <div class="title-header text-center">
            <h2 class="mb-0">ĐÁNH GIÁ TỪ KHÁCH HÀNG</h2>
        </div>

        <!-- Blog Review -->
        <div class="container container-custom">
            <div class="row">
                <div class="col-12">
                    <div class="swiper swiper-review">
                        <div class="swiper-wrapper">
                            @foreach($testimonials as $testimonial)
                            <div class="swiper-slide review-blog">
                                <div class="d-flex">
                                    <div class="review-img">
                                        <img class="img-fluid h-100" src="./assets/images/user_img_review.png" alt="">
                                    </div>
                                    <div class="review-content">
                                        <div class="review-name">
                                            {{$testimonial->name}}
                                        </div>
                                        <div class="review-rating d-flex">
                                            @php 
                                                $stars = (int) $testimonial->stars
                                            @endphp
                                            @for($i = 0; $i <= $stars; $i++)
                                                 <img class="img-fluid h-100 rating-star" src="./assets/images/rating_star.png" alt="" height="16" width="16">
                                            @endfor
                                        </div>
                                    </div>
                                </div>
                                <div class="review-content">
                                    <div class="review-text blog-content">
                                        {{$testimonial->message}}
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                        
                        <div class="swiper-pagination"></div>
                        <!-- If we need navigation buttons -->
                        <div class="swiper-button-prev swiper-button-cus button-cus-left"></div>
                        <div class="swiper-button-next swiper-button-cus button-cus-right"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Review -->

    <!-- Header Title -->
    <div class="title-header title-header-seccond text-center">
        <h2 class="mb-0">
            <span>CAM KẾT VỀ GIÁ TRỊ</span>
        </h2>
    </div>
    <!-- End Header Title -->

    <!-- Blog Commit -->
    <div class="container-fluid p-0">
        <div class="row mx-0">
            <div class="blog-banner blog-banner-commit p-0 mx-auto">
                <img class="img-fluid w-100" src="./assets/images/banner_commit.png" alt="">
            </div>
        </div>
    </div>

    <div class="container body-blog-commit">
        <div class="row">
            <div class="col-md-4">
                <div class="blog-commit">
                    <div class="commit-header blog-title d-flex align-items-center">
                        <div class="number text-center">    
                            <img class="tick_img" src="./assets/images/tick_img.png" alt="" height="35" width="35">
                        </div>
                        <div class="title">
                            <span>
                                Nguyên liệu tươi, không chất bảo quản
                            </span>
                        </div>    
                    </div>

                    <div class="commit-content blog-content">
                        Chúng tôi chỉ sử dụng nguyên liệu tươi được chọn lọc kỹ càng từ mạng lưới các đối tác tin cậy. Mọi phần ăn từ em.fresh sẽ không có hormone, kháng sinh, đường tinh chế và GMO.
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="blog-commit">
                    <div class="commit-header blog-title d-flex align-items-center">
                        <div class="number text-center">    
                            <img class="tick_img" src="./assets/images/tick_img.png" alt="" height="35" width="35">
                        </div>
                        <div class="title">
                            <span>
                                Thực đơn được thiết kế bởi chuyên gia dinh dưỡng
                            </span>
                        </div>    
                    </div>

                    <div class="commit-content blog-content">
                        Các chuyên gia dinh dưỡng của chúng tôi luôn theo sát các đầu bếp để đảm bảo mỗi bữa ăn được đóng gói với chất lượng dinh dưỡng cao cấp và đảm bảo khoa học.
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="blog-commit">
                    <div class="commit-header blog-title d-flex align-items-center">
                        <div class="number text-center">    
                            <img class="tick_img" src="./assets/images/tick_img.png" alt="" height="35" width="35">
                        </div>
                        <div class="title">
                            <span>
                                Công thức nấu ăn do đầu bếp sáng tạo hàng tuần
                            </span>
                        </div>    
                    </div>

                    <div class="commit-content blog-content">
                        Đội ngũ đầu bếp sành ăn luôn tìm tòi và phát triển mỗi ngày để mang đến cho bạn một bữa ăn không những tốt cho sức khoẻ mà con kích thích, ngon miệng.
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- End Blog Commit -->

    <!-- Blog Advise -->
    <div class="blog-advise">
        <div class="container-fluid p-0">
            <div class="row mx-0">
                <div class="blog-banner img-background p-0 mx-auto col-12">
                    <img class="img-fluid w-100 img-background-pc" src="./assets/images/banner_advise.png" alt="">
                    <img class="img-fluid w-100 img-background-mb" src="./assets/images/about-banner-1.png" alt="">
                </div>

                <div class="blog-advise-position col-md-6 offset-md-3 col-12">
                    <div class="blog-advise-form">
                        <div class="title">
                            <h2 class="mb-0">
                                Nhận tư vấn miễn phí
                            </h2>
                        </div>
                        <div class="content">
                            Hãy để lại thông tin của bạn, đội ngũ chuyên gia dinh dưỡng của chúng tôi sẽ liên lạc sớm nhất và giúp đỡ bạn!
                        </div>
                        <!-- <div > -->
                            <form class="register-advise" name="advise_form" action="{{ route('post_advice') }}" method="POST">
                                @csrf
                                <div class="register-advise-input">
                                    <input type="text" class="form-control" placeholder="Nhập email hoặc số điện thoại của bạn" name="email_phone">
                                </div>

                                <div class="register-advise-btn">
                                    <button type="submit" class="btn">Đăng ký</button>
                                </div>
                            </form>
                        <!-- </div> -->
                    </div>
                            <!-- <form name="recoverfrm" action="{{ route('password.email') }}" method="POST" data-otp-form="reset_password">
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
                                </div>
                            </form> -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Advise -->

    <!-- Header Title -->
    <div class="background-gray">
        <div class="title-header text-center">
            <h2 class="mb-0">CÂU HỎI THƯỜNG GẶP</h2>
        </div>
    <!-- End Header Title -->

    <!-- Blog Question -->
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-10 offset-md-1">
                    <div class="question-content">
                        <div class="content">
                            Không cần lo lắng về dầu mỡ hay dọn dẹp bếp núc, các bữa ăn của chúng tôi sẵn sàng để ăn trong 3 phút. Mục tiêu của chúng tôi là làm cho việc ăn uống lành mạnh trở nên đơn giản và thú vị, và thật ngon. Bạn có một vài điều thắc mắc? Hãy kiểm tra những câu hỏi thường gặp của chúng tôi dưới đây.
                        </div>
                    </div>
                    
                    <div class="question-collapse faqs-box">
                        <div id="accordion">
                            @foreach($faqs as $faq)
                                <div class="card">
                                    <div class="card-header" id="heading_{{$faq->id}}">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link faqs-btn__custome" data-toggle="collapse" data-target="#collapse_{{$faq->id}}" aria-expanded="true" aria-controls="collapse1">
                                                <span>
                                                    {{$faq->title}}
                                                </span>    
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapse_{{$faq->id}}" class="collapse" aria-labelledby="heading_{{$faq->id}}" data-parent="#accordion">
                                        <div class="card-body">
                                            {!!$faq->body!!}
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <div class="question-seemore text-center">
                        <a class="link-seemore" href="/hoi-dap">
                            Xem tất cả câu hỏi khác
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Question -->
@endsection

@push('scripts')
    <script>
        var prevScrollpos = window.pageYOffset;
        window.onscroll = function() {
            var currentScrollPos = window.pageYOffset;
            if (prevScrollpos > currentScrollPos) {
                document.getElementById("header").style.top = "-90px";
                console.log('123');
            } else {
                document.getElementById("header").style.top = "0";
                document.getElementById("header").classList.remove("hidden");
                document.getElementById("header").classList.add("sticky");
                console.log('456');
            }
            
            prevScrollpos = currentScrollPos;
        }
    </script>
@endpush