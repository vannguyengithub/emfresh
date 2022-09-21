@extends('layouts.app')

@section('title', 'Thanh toán đơn hàng')

@section('content')

    @include('checkout.step_process')  
    <div class="container order-payment">
        <h1 class="choose-food__title">
            THANH TOÁN
        </h1>
        <form action="{{ route('checkout.store') }}" method="POST" id="payment-form">
            @csrf
            <div class="check-order__login">
                <div class="check-order__login-ttl">
                    <h3>
                        Thông tin người nhận
                    </h3>
                </div>

                <div class="check-order__login-box">
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
                </div>
            </div>

            <div class="check-order__login">
                <div class="check-order__login-ttl">
                    <h3> Thời gian giao hàng</h3>
                </div>

                <div class="order-payment__radio">
                    @foreach(config('constants.shipping_options') as $shipping => $text)
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="shipping_option" id="{{ $shipping }}" value="{{ $shipping }}" @if($loop->first) checked @endif>
                            <label class="form-check-label" for="{{ $shipping }}">
                                {{ $text }}
                            </label>
                        </div>  
                    @endforeach
                </div>
            </div>

            <div class="check-order__login">
                <div class="check-order__login-ttl">
                    <h3>Phương thức thanh toán</h3>
                </div>

                <div class="order-payment__radio">
                    @foreach(config('constants.payments') as $key => $text)
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="payment_method" id="{{ $key }}" value="{{$key}}" @if($loop->first) checked @endif>
                            <label class="form-check-label" for="{{ $key }}">
                                {!! $text !!}
                            </label>
                        </div>
                    @endforeach
                </div>
            </div>
            
            @include('checkout.components.summary' , ['coupon' => true ])

            <div class="footer__btn">
                <button type="submit" id="complete-order" class="button-primary form-control full-width continue__order-main">
                    Đặt hàng 
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.95801 17.5834C5.74967 17.375 5.64551 17.1284 5.64551 16.8434C5.64551 16.5589 5.74967 16.3125 5.95801 16.1042L12.0622 10L5.93717 3.87504C5.74273 3.6806 5.64551 3.43754 5.64551 3.14587C5.64551 2.85421 5.74967 2.60421 5.95801 2.39587C6.16634 2.18754 6.41301 2.08337 6.69801 2.08337C6.98245 2.08337 7.22884 2.18754 7.43717 2.39587L14.4372 9.41671C14.5205 9.50004 14.5797 9.59032 14.6147 9.68754C14.6491 9.78476 14.6663 9.88893 14.6663 10C14.6663 10.1112 14.6491 10.2153 14.6147 10.3125C14.5797 10.4098 14.5205 10.5 14.4372 10.5834L7.41634 17.6042C7.2219 17.7987 6.98245 17.8959 6.69801 17.8959C6.41301 17.8959 6.16634 17.7917 5.95801 17.5834Z" fill="white"/>
                    </svg>
                </button>
            </div>
        </form>
    </div>
@endsection
