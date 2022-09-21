<div class="order-page container">
    <div class="order-process__wrapper">
        <ul class="order-process">
            <li class="order-process__item @if($step >= 1) active @endif">
                <h4>1</h4>
                <span>Chọn gói ăn</span>
            </li>    
            <li class="order-process__item @if($step >= 2) active @endif">
                <h4>2</h4>
                <span>Lên kế hoạch</span>
            </li>
            <li class="order-process__item @if($step >= 3) active @endif">
                <h4>3</h4>
                <span>Chọn món</span>
            </li>
            <li class="order-process__item @if($step >= 4) active @endif">
                <h4>4</h4>
                <span>Kiểm tra đơn</span>
            </li>
            <li class="order-process__item @if($step == 5) active @endif">
                <h4>5</h4>
                <span>Thanh toán</span>
            </li>
        </ul>
        <div class="order-process__logo">
            <a href="/">
                <img src="/assets/images/logo.png" title="logo" alt="">
            </a>
        </div>
    </div>
</div>