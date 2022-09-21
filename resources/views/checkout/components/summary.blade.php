<div class="order-total__main">
    @if($coupon)
        <div class="order-total__main-list">
            <div>
                <div class="order-total__item promo-code__custome">
                    <h3>Mã giảm giá:</h3>
                    <div class="promo-code">
                        <input type="text" placeholder="Nhập mã tại đây">
                        <button class="promo-code__btn">
                            Áp dụng
                        </button>
                    </div>
                </div>
            </div>
        </div>
    @endif
    <div class="order-total__main-list">
        <div>
            <div class="order-total__item">
                <h3>Tổng đơn hàng:</h3>
                <p>{{ number_format(Cart::subtotal()) }}đ</p>
            </div>
            <div class="order-total__item">
                <h3>Phí vận chuyển:</h3>
                <p>{{ number_format(session()->get('shipping')['price']) }}đ</p>
            </div>

            @if(session()->has('coupon'))
                <div class="order-total__item">
                    <h3>Giảm giá đơn hàng:</h3>
                    <p>{{ number_format(session()->has('coupon')['price'])}}</p>
                </div>  
            @endif
        </div>
    </div>
    <div class="order-total__main-box">
        <div class="order-total__main-box__item">
            <h3>Tổng cộng:</h3>
            <p>{{ number_format(Cart::subtotal() + session()->get('shipping')['price'] )}}đ</p>
        </div>
    </div>
</div>