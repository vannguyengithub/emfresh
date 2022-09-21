@extends('layouts.app')

@section('title', 'Đơn hàng của tôi')

@section('content')

<div class="profile-user emfresh_mr-login-register">
    <div class="max-w-1120 container">
        <div class="row">
            <div class="col-sm-4">
                @include('partials.menus.profile')
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
                            <div class="action-detail-order text-right">
                                <a href="#" class="btn ty-btn__success rounded-pill btn-detail-order">Xem chi tiết</a>
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
                            <div class="action-detail-order text-right">
                                <a href="#" class="btn ty-btn__success rounded-pill btn-detail-order">Xem chi tiết</a>
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
                            <div class="action-detail-order text-right">
                                <a href="#" class="btn ty-btn__success rounded-pill btn-detail-order">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
{{-- 
    <div class="container">
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
    </div>

    <div class="products-section my-orders container">
        <div class="sidebar">

            <ul>
              <li><a href="{{ route('users.edit') }}">My Profile</a></li>
              <li class="active"><a href="{{ route('orders.index') }}">My Orders</a></li>
            </ul>
        </div> <!-- end sidebar -->
        <div class="my-profile">
            <div class="products-header">
                <h1 class="stylish-heading">My Orders</h1>
            </div>

            <div>
                @foreach ($orders as $order)
                <div class="order-container">
                    <div class="order-header">
                        <div class="order-header-items">
                            <div>
                                <div class="uppercase font-bold">Order Placed</div>
                                <div>{{ presentDate($order->created_at) }}</div>
                            </div>
                            <div>
                                <div class="uppercase font-bold">Order ID</div>
                                <div>{{ $order->id }}</div>
                            </div><div>
                                <div class="uppercase font-bold">Total</div>
                                <div>{{ presentPrice($order->billing_total) }}</div>
                            </div>
                        </div>
                        <div>
                            <div class="order-header-items">
                                <div><a href="{{ route('orders.show', $order->id) }}">Order Details</a></div>
                                <div>|</div>
                                <div><a href="#">Invoice</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="order-products">
                        @foreach ($order->products as $product)
                            <div class="order-product-item">
                                <div><img src="{{ asset($product->image) }}" alt="Product Image"></div>
                                <div>
                                    <div>
                                        <a href="{{ route('shop.show', $product->slug) }}">{{ $product->name }}</a>
                                    </div>
                                    <div>{{ presentPrice($product->price) }}</div>
                                    <div>Quantity: {{ $product->pivot->quantity }}</div>
                                </div>
                            </div>
                        @endforeach

                    </div>
                </div> <!-- end order-container -->
                @endforeach
            </div>

            <div class="spacer"></div>
        </div>
    </div> --}}

@endsection