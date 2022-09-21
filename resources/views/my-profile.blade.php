@extends('layouts.app')

@section('title', 'My Profile')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')
<div class="profile-user">
    <div class="max-w-1120 container">
        <div class="row">
            <div class="col-sm-4">
                <ul class="ty-account-info d-none d-sm-block">
                    <li class="ty-account-info__item active">
                        <a href="#">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path class="svg-fill-color" d="M10 4.91671C10.9667 4.91671 11.75 5.70004 11.75 6.66671C11.75 7.63337 10.9667 8.41671 10 8.41671C9.03337 8.41671 8.25004 7.63337 8.25004 6.66671C8.25004 5.70004 9.03337 4.91671 10 4.91671ZM10 12.4167C12.475 12.4167 15.0834 13.6334 15.0834 14.1667V15.0834H4.91671V14.1667C4.91671 13.6334 7.52504 12.4167 10 12.4167ZM10 3.33337C8.15837 3.33337 6.66671 4.82504 6.66671 6.66671C6.66671 8.50837 8.15837 10 10 10C11.8417 10 13.3334 8.50837 13.3334 6.66671C13.3334 4.82504 11.8417 3.33337 10 3.33337ZM10 10.8334C7.77504 10.8334 3.33337 11.95 3.33337 14.1667V15.8334C3.33337 16.2917 3.70837 16.6667 4.16671 16.6667H15.8334C16.2917 16.6667 16.6667 16.2917 16.6667 15.8334V14.1667C16.6667 11.95 12.225 10.8334 10 10.8334Z" fill="black"></path>
                            </svg>
                            <span class="emfresh_pl-2">Tài khoản</span> 
                        </a>
                    </li>
                    <li class="ty-account-info__item">
                        <a href="#">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path class="svg-fill-color" d="M16.0747 14.4083L14.9997 13.3333V9.16665C14.9997 6.60831 13.633 4.46665 11.2497 3.89998V3.33331C11.2497 2.64165 10.6913 2.08331 9.99968 2.08331C9.30801 2.08331 8.74968 2.64165 8.74968 3.33331V3.89998C6.35801 4.46665 4.99968 6.59998 4.99968 9.16665V13.3333L3.92468 14.4083C3.39968 14.9333 3.76634 15.8333 4.50801 15.8333H15.483C16.233 15.8333 16.5997 14.9333 16.0747 14.4083ZM13.333 14.1666H6.66634V9.16665C6.66634 7.09998 7.92468 5.41665 9.99968 5.41665C12.0747 5.41665 13.333 7.09998 13.333 9.16665V14.1666ZM9.99968 18.3333C10.9163 18.3333 11.6663 17.5833 11.6663 16.6666H8.33301C8.33301 17.5833 9.07468 18.3333 9.99968 18.3333Z" fill="black"></path>
                            </svg>
                            <span class="emfresh_pl-2">Thông báo</span>
                        </a>
                    </li>
                    <li class="ty-account-info__item">
                        <a href="#">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path class="svg-fill-color" d="M15 5.00002H13.3334C13.3334 3.15835 11.8417 1.66669 10 1.66669C8.15837 1.66669 6.66671 3.15835 6.66671 5.00002H5.00004C4.08337 5.00002 3.33337 5.75002 3.33337 6.66669V16.6667C3.33337 17.5834 4.08337 18.3334 5.00004 18.3334H15C15.9167 18.3334 16.6667 17.5834 16.6667 16.6667V6.66669C16.6667 5.75002 15.9167 5.00002 15 5.00002ZM10 3.33335C10.9167 3.33335 11.6667 4.08335 11.6667 5.00002H8.33337C8.33337 4.08335 9.08337 3.33335 10 3.33335ZM15 16.6667H5.00004V6.66669H6.66671V8.33335C6.66671 8.79169 7.04171 9.16669 7.50004 9.16669C7.95837 9.16669 8.33337 8.79169 8.33337 8.33335V6.66669H11.6667V8.33335C11.6667 8.79169 12.0417 9.16669 12.5 9.16669C12.9584 9.16669 13.3334 8.79169 13.3334 8.33335V6.66669H15V16.6667Z" fill="black"></path>
                            </svg>
                            <span class="emfresh_pl-2">Đơn hàng</span>
                        </a>
                    </li>
                    <li class="ty-account-info__item">
                        <a href="{{ route('logout') }}" onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path class="svg-fill-color" fill-rule="evenodd" clip-rule="evenodd" d="M11.5 13H12C12.1767 13 12.3199 13.1432 12.3199 13.3199V14.1169V17.1926C12.3199 17.4791 12.0898 17.7084 11.8022 17.7084H3.00203C2.71445 17.7084 2.48438 17.4791 2.48438 17.1926V2.80749C2.48438 2.57824 2.65693 2.349 2.887 2.29169H2.90617H2.96369H3.00203H11.8022C12.0706 2.29169 12.3007 2.52093 12.3007 2.80749V5.90228V6.69932C12.3007 6.86539 12.1661 7.00002 12 7.00002H11.5H11V4.50002V4.00002H4V16H11V13H11.5ZM16.248 10.5269H10.5134C10.231 10.5269 10 10.2898 10 10C10 9.71026 10.231 9.47319 10.5134 9.47319H16.248L13.7478 6.89696C13.5476 6.69149 13.5476 6.35959 13.7478 6.15412C13.948 5.94866 14.2715 5.94866 14.4717 6.15412L17.8498 9.63124C18.0501 9.8367 18.0501 10.1686 17.8498 10.3741L14.4665 13.8459C14.2663 14.0514 13.9429 14.0514 13.7427 13.8459C13.5424 13.6405 13.5424 13.3033 13.7427 13.0978L16.248 10.5269Z" fill="black"></path>
                            </svg>
                            <span class="emfresh_pl-2">Đăng xuất</span>
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    </li>
                </ul>
            </div>
            <div class="col-sm-8">
                @if (session()->has('success_message'))
                <div class="alert alert-success">
                    {{ session()->get('success_message') }}
                </div>
                @endif
                @if(count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif
                <div class="page-profile">
                    <div class="emfresh-card emfresh_mb-10">
                        <div class="emfresh-card-header">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="title">
                                    Tài khoản
                                </div>
                            </div>
                        </div>
                        <div class="emfresh-card-body">
                            <div class="d-flex align-items-start justify-content-center profile-info">
                                <div class="img-avt position-relative">
                                    <div class="image">
                                        <img class="ty-pict" alt="" title="" width="127" height="127" src="https://chus.dosi-in.com/images/thumbnails/127/127/user/103/popup.png.webp">
                                    </div>
                                </div>
                                <div class="div">
                                    <form action="{{ route('users.update') }}" method="POST">
                                        @method('patch')
                                        @csrf
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="name">Họ</label>
                                                    <input name="name" type="text" class="form-control" id="name" value="{{ old('name', $user->name) }}">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="elm_lastname">Tên</label>
                                                    <input type="text" class="form-control" id="l">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="phone">Số điện thoại</label>
                                                    <input type="text" class="form-control" id="phone" name="phone" value="{{ $user->phone }}">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="email">Email address</label>
                                                    <input type="email" class="form-control" id="email" name="email" value="{{ $user->email }}">
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="address">Địa chỉ</label>
                                                    <input class="form-control" id="address" name="address" value="{{ $user->address }}" />
                                                </div>
                                            </div>
                                            {{-- 
                                            <div class="col-sm-6">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="selectDistrict">Quận</label>
                                                    <select class="form-control" id="selectDistrict">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="selectWard">Phường</label>
                                                    <select class="form-control" id="selectWard">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                            </div>
                                            --}}
                                            {{-- 
                                            <div class="col-sm-12">
                                                <div class="form-group emfresh-form-group">
                                                    <label for="password">Mật khẩu</label>
                                                    <input type="password" id="password" size="32" maxlength="32" value="" class="cm-autocomplete-off form-control" autocomplete="off">
                                                </div>
                                            </div>
                                            --}}
                                        </div>
                                        <button type="submit" class="btn ty-btn__success rounded-pill btn-save-profile float-right" disabled>Lưu thay đổi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="emfresh-card">
                        <div class="emfresh-card-header">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="title">
                                    Bảo mật
                                </div>
                                <div class="action">
                                    <div data-toggle="modal" data-target="#modalChangePassword">
                                        Đổi mật khẩu
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{-- menu notification --}}

                    <!-- <div class="emfresh-card">
                        <div class="emfresh-card-header">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="title">
                                    Thông báo qua email
                                </div>
                               
                            </div>
                        </div>
                        <div class="emfresh-card-body notification-list">
                            <div class="d-flex align-items-center justify-content-between emfresh_mb-4">
                                <div class="title">Thực đơn tuần mới</div>
                                
                            </div>
                            <div class="d-flex align-items-center justify-content-between ">
                                <div class="title">Chương trình khuyến mãi</div>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="customSwitches1">
                                    <label class="custom-control-label" for="customSwitches1"></label>
                                </div>
                            </div>
                        </div>
                    </div> -->

                    {{-- end menu notification --}}


                    {{-- menu order-list --}}

                    <div class="emfresh-card emfresh-card-title">
                        <div class="emfresh-card-header">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="title">
                                    Lịch sử đơn hàng
                                </div>
                            </div>
                        </div>
                        <div class="emfresh-card emfresh-card-order">
                            <a class="" href="#">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                            Gói ăn eat clean
                                        </div>
                                        <div class="code-order">
                                            Mã đơn hàng: 999999
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                    <div class="packege-order">
                                        <img class="img-fluid" src="/assets/images/img-product.png" alt="product">
                                        <div class="info">
                                            <div class="variant-list">
                                                <div class="variant">
                                                    Bữa ăn: 
                                                    <span>trưa, tối</span>
                                                </div>
                                                <div class="variant">
                                                    Ngày ăn:
                                                    <span>thứ 2 - thứ 6</span>
                                                </div>  
                                                <div class="variant">
                                                    Ngày đặt:
                                                    <span>01/01/2022</span>
                                                </div>  
                                                <div class="variant">
                                                    Thời gian: 
                                                    <span>1 tuần </span>
                                                </div>  
                                            </div>
                                            <div class="amount">
                                                x1
                                            </div>
                                            <div class="price">
                                                650.000đ
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="emfresh-card emfresh-card-order">
                            <a class="" href="#">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                            Gói ăn eat clean
                                        </div>
                                        <div class="code-order">
                                            Mã đơn hàng: 999999
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                    <div class="packege-order">
                                        <img class="img-fluid" src="/assets/images/img-product.png" alt="product">
                                        <div class="info">
                                            <div class="variant-list">
                                                <div class="variant">
                                                    Bữa ăn: 
                                                    <span>trưa, tối</span>
                                                </div>
                                                <div class="variant">
                                                    Ngày ăn:
                                                    <span>thứ 2 - thứ 6</span>
                                                </div>  
                                                <div class="variant">
                                                    Ngày đặt:
                                                    <span>01/01/2022</span>
                                                </div>  
                                                <div class="variant">
                                                    Thời gian: 
                                                    <span>1 tuần </span>
                                                </div>  
                                            </div>
                                            <div class="amount">
                                                x1
                                            </div>
                                            <div class="price">
                                                650.000đ
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="emfresh-card emfresh-card-order">
                            <a class="" href="#">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                            Gói ăn eat clean
                                        </div>
                                        <div class="code-order">
                                            Mã đơn hàng: 999999
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                    <div class="packege-order">
                                        <img class="img-fluid" src="/assets/images/img-product.png" alt="product">
                                        <div class="info">
                                            <div class="variant-list">
                                                <div class="variant">
                                                    Bữa ăn: 
                                                    <span>trưa, tối</span>
                                                </div>
                                                <div class="variant">
                                                    Ngày ăn:
                                                    <span>thứ 2 - thứ 6</span>
                                                </div>  
                                                <div class="variant">
                                                    Ngày đặt:
                                                    <span>01/01/2022</span>
                                                </div>  
                                                <div class="variant">
                                                    Thời gian: 
                                                    <span>1 tuần </span>
                                                </div>  
                                            </div>
                                            <div class="amount">
                                                x1
                                            </div>
                                            <div class="price">
                                                650.000đ
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    {{-- end menu order-list --}}

                    {{-- menu detail order  --}}
                    <!-- <div class="detail-order">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="title">
                                <i class="fa-solid fa-chevron-left"></i>   
                                Quay lại
                            </div>
                        </div>
                        <div class="emfresh-card emfresh-card-title">
                            <div class="emfresh-card emfresh-card-order">
                                <div class="emfresh-card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="title">
                                            Gói ăn eat clean
                                        </div>
                                        <div class="code-order">
                                            Mã đơn hàng: 999999
                                        </div>
                                    </div>
                                </div>
                                <div class="emfresh-card-body">
                                    <div class="packege-order">
                                        <img class="img-fluid" src="/assets/images/img-product.png" alt="product">
                                        <div class="info">
                                            <div class="variant-list">
                                                <div class="variant">
                                                    Bữa ăn: 
                                                    <span>trưa, tối</span>
                                                </div>
                                                <div class="variant">
                                                    Ngày ăn:
                                                    <span>thứ 2 - thứ 6</span>
                                                </div>  
                                                <div class="variant">
                                                    Ngày đặt:
                                                    <span>01/01/2022</span>
                                                </div>  
                                                <div class="variant">
                                                    Thời gian: 
                                                    <span>1 tuần </span>
                                                </div>  
                                            </div>
                                            <div class="amount">
                                                x1
                                            </div>
                                            <div class="price">
                                                650.000đ
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="menu-order">
                                    <div class="title text-center">Thực đơn</div>
                                    <ul class="menu-order-list">
                                        <li class="menu-order-list-item">
                                            <div class="info-left">
                                                <div class="rank">
                                                    thứ 4
                                                </div>
                                                <div class="date">
                                                    03/08
                                                </div>
                                            </div>
                                            <div class="info-left">
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                            </div>
                                        </li>
                                        <li class="menu-order-list-item">
                                            <div class="info-left">
                                                <div class="rank">
                                                    thứ 4
                                                </div>
                                                <div class="date">
                                                    03/08
                                                </div>
                                            </div>
                                            <div class="info-left">
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                            </div>
                                        </li>
                                        <li class="menu-order-list-item">
                                            <div class="info-left">
                                                <div class="rank">
                                                    thứ 4
                                                </div>
                                                <div class="date">
                                                    03/08
                                                </div>
                                            </div>
                                            <div class="info-left">
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                            </div>
                                        </li>
                                        <li class="menu-order-list-item">
                                            <div class="info-left">
                                                <div class="rank">
                                                    thứ 4
                                                </div>
                                                <div class="date">
                                                    03/08
                                                </div>
                                            </div>
                                            <div class="info-left">
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                            </div>
                                        </li>
                                        <li class="menu-order-list-item">
                                            <div class="info-left">
                                                <div class="rank">
                                                    thứ 4
                                                </div>
                                                <div class="date">
                                                    03/08
                                                </div>
                                            </div>
                                            <div class="info-left">
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                                <div class="name-dish">
                                                    Stir-Fry Chicken and Broccoli with Garlic Sauce
                                                </div>  
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="note-order">
                                        Yêu cầu đặc biệt: <span>không hành, không hành, không hành, không hành </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->

                    {{-- menu detail order --}}
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalChangePassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <form>
            <div class="modal-content modal-content-change-password">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Đổi mật khẩu</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="position-relative">
                        <div class="form-group emfresh-form-group">
                            <label for="password">Mật khẩu mới</label>
                            <input type="password" id="password" size="32" maxlength="32" value="" class="cm-autocomplete-off form-control" autocomplete="off">
                            <div class="input-group-addon">
                                <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                            </div>                    
                        </div>
                    </div>
                    <div class="position-relative">
                        <div class="form-group emfresh-form-group">
                            <label for="password">Nhập lại mật khẩu mới</label>
                            <input type="password" id="password" size="32" maxlength="32" value="" class="cm-autocomplete-off form-control" autocomplete="off">
                            <div class="input-group-addon">
                                <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                            </div>                       
                        </div>
                    </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit" class="w-100 btn ty-btn__success rounded-pill btn-change-password" disabled>Đổi mật khẩu</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection

@section('extra-js')
    <!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
    <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.min.js"></script>
    <script src="{{ asset('js/algolia.js') }}"></script>
@endsection
