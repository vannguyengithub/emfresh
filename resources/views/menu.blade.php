@extends('layouts.app')

@section('title' , 'Thực đơn tuần này')
@section('content')
    <!-- Blog Meal Package -->
    <div class="menu-page container emfresh_mr-header">
        <div class="row">
            <div class="col-md-6 offset-md-3 text-center">
                <div class="menu-page-title mb-md-4">
                    <p class="mb-0">
                        THỰC ĐƠN TUẦN NÀY
                    </p>
                </div>

                {{-- <ul class="nav nav-pills mb-3 justify-content-between package-header-navbar" id="pills-tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="pills-chay-tab" data-toggle="pill" href="#pills-chay" role="tab" aria-controls="pills-chay" aria-selected="true">chay</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-eatclean-tab" data-toggle="pill" href="#pills-eatclean" role="tab" aria-controls="pills-eatclean" aria-selected="false">eat clean</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-protein-tab" data-toggle="pill" href="#pills-protein" role="tab" aria-controls="pills-protein" aria-selected="false">protein +</a>
                    </li>
                </ul> --}}
            </div>

            {{-- <div class="col-md-6 offset-md-3">
                <div class="blog-avg d-flex justify-content-between">
                    <div class="avg-title">  
                        <div class="title">
                            Eat clean
                        </div>
                        <div class="content">
                            Avg. macros
                        </div>
                    </div>

                    <div class="avg-parameter">
                        <div class="title">
                            30g
                        </div>
                        <div class="content">
                            Protein
                        </div>
                    </div>
                    <div class="avg-parameter">
                        <div class="title">
                            10g
                        </div>
                        <div class="content">
                            Carbs
                        </div>
                    </div>
                    <div class="avg-parameter">
                        <div class="title">
                            32g
                        </div>
                        <div class="content">
                            Fat
                        </div>
                    </div>
                    <div class="avg-parameter">
                        <div class="title">
                            460
                        </div>
                        <div class="content">
                            Cal
                        </div>
                    </div>
                    <div class="avg-parameter avg-parameter-last">
                        <div class="title">
                            550mg
                        </div>
                        <div class="content">
                            Sodium
                        </div>
                    </div>
                </div>
            </div> --}}

            <meals group-type="day"></meals>
        </div>
    </div>
    <div class="container">           
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="see-menu-week">
                    <a class="link-menu" href="/checkout">
                        Đặt món ăn
                    </a>
                </div>
            </div>
        </div>
    </div> 
    {{-- <div class="tab-content" id="pills-tabContent">
        <div class="menu-meal-package tab-pane fade show active" id="pills-chay" role="tabpanel" aria-labelledby="pills-chay-tab">
            <!-- Blog menu in day -->
            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ 2 <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <!-- Example -->
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content" data-toggle="modal" data-target="#modalInfoMeal" title="Stir-Fry Chicken and Broccoli with Garlic Sauce">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ 3 <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ 4 <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ 5 <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ 6 <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ 7 <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu-day">
                <div class="menu-day-header text-center">
                    <p class="day-text mb-0">
                        Thứ Chủ nhật <br> 03/08
                    </p>
                </div>
                <div class="container menu-day-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="meal-package-content text-center">
                                <div class="content">
                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Button Order Now -->
            <div class="col-md-12 text-center">
                <div class="see-menu-week">
                    <a class="link-menu" href="#">
                        Đặt hàng ngay
                    </a>
                </div>
            </div>
            
        </div>
    </div> --}}
    <!-- End Blog Meal Package -->

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
                        <div class="register-advise">
                            <div class="register-advise-input">
                                <input type="text" class="form-control" placeholder="Nhập email hoặc số điện thoại của bạn">
                            </div>

                            <div class="register-advise-btn">
                                <button type="submit" class="btn">Đăng ký</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Advise -->
@endsection