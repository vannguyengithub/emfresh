@extends('layouts.app')

@section('title', 'Kiểm tra đơn hàng')

@section('content')

    @include('checkout.step_process')  

    <div class="container">
        <div class="check-order">
            <h1 class="choose-food__title">
                KIỂM TRA ĐƠN
            </h1>
            
            <div class="check-order__login">
                
                <div class="check-order__login-ttl">
                    <h3>
                        Thông tin người nhận
                    </h3>
                    @if(Auth::id())
                        <button type="button" class="btn--modal" data-toggle="modal" data-target="#exampleModalCenter">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M5.91197 19H5V18.0784L14.06 9.01842L14.9809 9.93935L5.91197 19ZM6.89 20.85C6.8 20.95 6.67 21 6.54 21H3.5C3.22 21 3 20.78 3 20.5V17.46C3 17.32 3.05 17.2 3.15 17.1L14.06 6.19L17.81 9.94L17.8092 9.94078L6.89 20.85ZM15.13 5.12L18.88 8.87L20.71 7.04C21.1 6.65 21.1 6.02 20.71 5.63L18.37 3.29C17.98 2.9 17.35 2.9 16.96 3.29L15.13 5.12Z" fill="#424242"/>
                            </svg>
                            Sửa
                        </button>

                        @include("partials.modals.update_user_data_checkout" , ["user" => session()->get('user_data')])
                    @endif                    
                </div>
                <div class="check-order__login-box">
                    @guest
                        <div class="check-order__no-login">
                            Vui lòng <a href="{{route('login')}}" title="Đăng nhập"> Đăng nhập </a> hoặc <a href="{{ route('register') }}" title="Đăng nhập"> Đăng ký tài khoản mới </a> để tiếp tục
                        </div>
                    @else
                        <div class="check-order__have-login ">
                            @php 
                                $user_data = session()->get('user_data');
                            @endphp
                            <ul>    
                                <li>
                                    {{ $user_data['name'] }} {{ isset($user_data['lastname']) ?? '' }}
                                </li>
                                <li>
                                    {{ $user_data['phone'] }}
                                </li>
                                <li>
                                    {{ $user_data['address'] }}
                                </li>
                            </ul>
                        </div>
                    @endguest
                </div>
            </div>

            @foreach(Cart::content() as $cartItem)
                <div class="check-order__inner">
                    <div class="order-title__mobile">
                        <h3>{{ $cartItem->model->name }}</h3>
                    </div>

                    <div class=" emfresh-card-order">
                        <div class="emfresh-card-body">
                            <div class="packege-order">
                                <img class="img-fluid" src="/assets/images/img-product.png" alt="product">
                                <div class="info">
                                    <div class="variant-list">
                                        
                                        <h3>{{ $cartItem->model->name }}</h3>
                                        <div class="variant">
                                            Bữa ăn: 
                                            <span>
                                                @foreach($cartItem->options['meal'] as $meal)
                                                    {{ __("emfresh.meals.".$meal)}}
                                                @endforeach
                                            </span>
                                        </div>
                                        <div class="variant">
                                            Ngày ăn:
                                            @switch($cartItem->options['days'])
                                                @case(6)
                                                    <span>thứ 2 - thứ 7</span>
                                                    @break
                                                @case(7)
                                                    <span>thứ 2 - chủ nhật</span>
                                                    @break
                                                @default
                                                    <span>thứ 2 - thứ 6</span>
                                            @endswitch                                 
                                        </div>  
                                        <div class="variant">
                                            Thời gian:
                                            <span>{{ $cartItem->meal_of_week }} tuần</span>
                                        </div>  
                                        <div class="variant">
                                            Dịch vụ thêm: 
                                            @foreach($cartItem->options['extra'] as $key => $checked)
                                                @if($checked == 'Y')
                                                    <span>{{ __("emfresh.extra_services.".$key)}}</span>
                                                @endif
                                            @endforeach
                                        </div>  
                                    </div>
                                </div>
                            </div>
                            <div class="check-order__box-right">
                                <div class="input-group">
                                    <span class="input-group-btn">
                                    <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                        <span class="glyphicon glyphicon-minus">
                                            <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <line x1="2.2" y1="5.8" x2="9.8" y2="5.8" stroke="black" stroke-width="1.4" stroke-linecap="round"/>
                                            </svg>
                                        </span>
                                    </button>
                                    </span>
                                    <input type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="10">
                                    <span class="input-group-btn">
                                    <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
                                        <span class="glyphicon glyphicon-plus">
                                            <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M9.85714 6.64286H6.64286V9.85714C6.64286 10.2107 6.35357 10.5 6 10.5C5.64643 10.5 5.35714 10.2107 5.35714 9.85714V6.64286H2.14286C1.78929 6.64286 1.5 6.35357 1.5 6C1.5 5.64643 1.78929 5.35714 2.14286 5.35714H5.35714V2.14286C5.35714 1.78929 5.64643 1.5 6 1.5C6.35357 1.5 6.64286 1.78929 6.64286 2.14286V5.35714H9.85714C10.2107 5.35714 10.5 5.64643 10.5 6C10.5 6.35357 10.2107 6.64286 9.85714 6.64286Z" fill="black"/>
                                            </svg>                                                
                                        </span>
                                    </button>
                                    </span>
                                </div>
                                <div class="price">
                                    {{ number_format($cartItem->price) }} đ
                                </div>
                                <form action="{{ route('cart.destroy', $cartItem->rowId) }}" method="POST">
                                    {{ csrf_field() }}
                                    {{ method_field('DELETE') }}
                                    <button type="subbmit" class="remove__product-order" onclick="return confirm('Bạn muốn xoá khỏi giỏ hàng?')">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M18.2997 5.70997C17.9097 5.31997 17.2797 5.31997 16.8897 5.70997L11.9997 10.59L7.10973 5.69997C6.71973 5.30997 6.08973 5.30997 5.69973 5.69997C5.30973 6.08997 5.30973 6.71997 5.69973 7.10997L10.5897 12L5.69973 16.89C5.30973 17.28 5.30973 17.91 5.69973 18.3C6.08973 18.69 6.71973 18.69 7.10973 18.3L11.9997 13.41L16.8897 18.3C17.2797 18.69 17.9097 18.69 18.2997 18.3C18.6897 17.91 18.6897 17.28 18.2997 16.89L13.4097 12L18.2997 7.10997C18.6797 6.72997 18.6797 6.08997 18.2997 5.70997Z" fill="#E53935"/>
                                        </svg>    
                                        Hủy
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    @if($cartItem->options['meal_of_week'] == 1)
                        <div class="menu-order__list">
                            <div class="menu-order__title">
                                Thực đơn
                            </div>
                            <div class="menu-order__box">
                                @foreach($cartItem->options['product_of_meals'] as $day => $value)
                                <div class="menu-order__item">
                                    <div class="menu-order__day">
                                        <h4>{{ date('D',strtotime($day .'-'. date('Y')))}}</h4>
                                        <p>{{ $day }}</p>
                                    </div>
                                    <div class="menu-order__content">
                                        <ul>
                                            @foreach($value['pid'] as $p => $pid)
                                                @php 
                                                    $product = \App\Product::where('id',$pid)->first();
                                                @endphp
                                                <li>{{$product->name}}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    @endif
                    <div class="requirements-special">
                        <div class="form-group">
                            <label for="note">Yêu cầu đặc biệt:</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="1">{{$cartItem->options['note'] ?? ''}}</textarea>
                        </div>
                    </div>
                </div>
            @endforeach

            @include('checkout.components.summary' , ['coupon' => false])

            <div class="footer__btn">
                <a class="continue__order" href="/">
                    <span>Tiếp tục đặt hàng</span>
                </a>

                @guest
                    <a class="continue__order-main" href="{{ route('login')}}">
                        <span>
                            Đăng nhập để thanh toán
                        </span>
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.95801 17.5834C5.74967 17.375 5.64551 17.1284 5.64551 16.8434C5.64551 16.5589 5.74967 16.3125 5.95801 16.1042L12.0622 10L5.93717 3.87504C5.74273 3.6806 5.64551 3.43754 5.64551 3.14587C5.64551 2.85421 5.74967 2.60421 5.95801 2.39587C6.16634 2.18754 6.41301 2.08337 6.69801 2.08337C6.98245 2.08337 7.22884 2.18754 7.43717 2.39587L14.4372 9.41671C14.5205 9.50004 14.5797 9.59032 14.6147 9.68754C14.6491 9.78476 14.6663 9.88893 14.6663 10C14.6663 10.1112 14.6491 10.2153 14.6147 10.3125C14.5797 10.4098 14.5205 10.5 14.4372 10.5834L7.41634 17.6042C7.2219 17.7987 6.98245 17.8959 6.69801 17.8959C6.41301 17.8959 6.16634 17.7917 5.95801 17.5834Z" fill="white"/>
                        </svg>    
                    </a>
                @else
                    <a class="continue__order-main" href="{{ route('checkout.index',['step' => 5])}}">
                        <span>
                            Tiến hành thanh toán
                        </span>
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.95801 17.5834C5.74967 17.375 5.64551 17.1284 5.64551 16.8434C5.64551 16.5589 5.74967 16.3125 5.95801 16.1042L12.0622 10L5.93717 3.87504C5.74273 3.6806 5.64551 3.43754 5.64551 3.14587C5.64551 2.85421 5.74967 2.60421 5.95801 2.39587C6.16634 2.18754 6.41301 2.08337 6.69801 2.08337C6.98245 2.08337 7.22884 2.18754 7.43717 2.39587L14.4372 9.41671C14.5205 9.50004 14.5797 9.59032 14.6147 9.68754C14.6491 9.78476 14.6663 9.88893 14.6663 10C14.6663 10.1112 14.6491 10.2153 14.6147 10.3125C14.5797 10.4098 14.5205 10.5 14.4372 10.5834L7.41634 17.6042C7.2219 17.7987 6.98245 17.8959 6.69801 17.8959C6.41301 17.8959 6.16634 17.7917 5.95801 17.5834Z" fill="white"/>
                        </svg>    
                    </a>
                @endguest
            </div>
        </div>
    </div>
@endsection
