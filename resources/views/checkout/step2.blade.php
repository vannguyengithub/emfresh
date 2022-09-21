@include('checkout.step_process')  

<form action="{{ route('checkout.options') }}" method="POST" class="update_meals">
    @csrf
    <input type="hidden" name="cartId" value="{{ request()->cartId }}" />
    <div class="option_step" data-step="1">
        <div class="container">
            <div class="details-order">
                <div class="details-order__img">
                    <img src="{{ asset('assets/images/banner_checkout.jpeg')}}" alt="đặt món">
                </div>
                <div class="details-order__main">
                    <div class="details-order__title">
                        <h1>eat clean</h1>
                        <p>Tận hưởng bữa ăn ngon miệng chỉ trong 3 phút</p>
                    </div>

                    <div class="details-order__list">
                        <div class="details-order__item">
                            <h4>Bữa ăn</h4>
                            <div class="details-order__option" id="meal">
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="meal1" name="options[meal][]" value="morning" checked>
                                    <label class="form-check-label" for="meal1">Bữa sáng</label>
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="meal2" name="options[meal][]" value="launch">
                                    <label class="form-check-label" for="meal2">Bữa trưa</label>
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="meal3" name="options[meal][]" value="evening">
                                    <label class="form-check-label" for="meal3">Bữa tối</label>
                                </div>
                            </div>
                        </div>

                        <div class="details-order__item">
                            <h4>Ngày ăn</h4>
                            <div class="details-order__option details-order__option-radio" id="days">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="options[days]" id="days_eat_1" value="5" checked>
                                    <label class="form-check-label" for="days_eat_1">
                                        5 ngày ( thứ 2 - thứ 6)
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="options[days]" id="days_eat_2" value="6">
                                    <label class="form-check-label" for="days_eat_2">
                                        6 ngày ( thứ 2 - thứ 7)
                                    </label>
                                </div>
                                <div class="form-check disabled">
                                    <input class="form-check-input" type="radio" name="options[days]" id="days_eat_3" value="7">
                                    <label class="form-check-label" for="days_eat_3">
                                        7 ngày
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="details-order__item">
                            <h4>Kích cỡ</h4>
                            <div class="details-order__option details-order__option-radio">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="options[size]" id="size_of_meal_1" data-extra="-15000" value="S" checked>
                                    <label class="form-check-label" for="size_of_meal_1">
                                        Size M
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="options[size]" id="size_of_meal_2" value="M" data-extra="15000">
                                    <label class="form-check-label" for="size_of_meal_2">
                                        Size L (+15.000đ)
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="details-order__item">
                            <h4>Dịch vụ thêm</h4>
                            <div class="details-order__option">
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="options_extra_1" name="options[extra][hot_meal]" value="Y" data-extra="5000" disabled>
                                    <label class="form-check-label" for="options_extra_1">
                                        Giao suất ăn nóng (+5.000đ)
                                        <p>Áp dụng với khách hàng đặt duy nhất bữa trưa hàng ngày.</p>
                                    </label>
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="options_extra_2" name="options[extra][cold_towel]" value="Y" data-extra="2000">
                                    <label class="form-check-label" for="options_extra_2">
                                        Kèm khăn lạnh (+2.000đ)
                                    </label>
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="options_extra_3" name="options[extra][eating_utensil]" value="Y" checked>
                                    <label class="form-check-label" for="options_extra_3">
                                        Kèm dụng cụ ăn uống
                                        <p>em.fresh mặc định cung cấp dụng cụ nhựa. Hãy góp phần bảo vệ môi trường bằng cách hạn chế chọn mục này nhé!</p>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="details-order__total">
                        <div class="details-order__total-box">
                            <p>Giá trên mỗi bữa ăn</p>
                            <span class="meal-price">{{ number_format($cartItem['price']) }}đ</span>
                        </div>
                        <div class="details-order__next">
                            <button type="button" class="form-control next-step" data-next="2">
                                Tiếp tục
                            </button>
                        </div>
                        <span class="invalid-feedback d-none" id="error_step">Vui lòng chọn bữa ăn</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="option_step d-none" data-step="2">
        <div class="container" id="step_2_2">
            <div class="register-longer">
                <div class="register-longer__title">
                    <h1>ĐĂNG KÝ LÂU HƠN?</h1>
                    <p>Tiết kiệm hơn với ưu đãi 10% khi đăng ký gói tháng</p>
                </div>
                <div class="register-week__select-inner">
                    <div class="register-week__select" id="week">
                        <div class="register-week__select-item">
        
                            <div class="register-week__select-option">
                                <input type="radio" id="meal_of_week_1" name="options[meal_of_week]" class='form-check-input' data-price="" value="1" hidden checked>
                                <label for="meal_of_week_1">
                                    <h3>1 tuần</h3>
                                    <p>thích hợp dùng thử</p>
                                </label>
                            </div>
                        </div>
        
                        <div class="register-week__select-item">
        
                            <div class="register-week__select-option">
                                <input type="radio" id="meal_of_week_2" name="options[meal_of_week]" class='form-check-input' data-price="" value="4" hidden>
                                <label for="meal_of_week_2">
                                    <h3>
                                        4 tuần 
                                        <span>-10%</span>
                                    </h3>
                                    <p>tiết kiệm hơn</p>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="register-price__list">
                        <ul>
                            <li>
                                <p>Tổng bữa ăn</p>
                                <p class="total-meal">5</p>
                            </li>
                            <li>
                                <p>Giá trên từng bữa</p>
                                <p class="meal-price">{{ number_format($cartItem['price']) }}đ</p>
                            </li>
                            <li>
                                <p>Tiết kiệm</p>
                                <p class="meal-save-price">0đ</p>
                            </li>
                        </ul>
                    </div>
                    <div class="register-price__line">

                    </div>
                    <div class="register-week__select-total">
                        <p>Tổng giá mỗi tuần</p>
                        <p class="total-meal-price"></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- note -->
        <div class="note-special" id="step_2_3">
            <div class="container">
                <div class="register-longer__title">
                    <h1>YÊU CẦU ĐẶC BIỆT</h1>
                    <p>
                    Chúng tôi quan tâm đến nhu cầu cụ thể của từng cá thể. Vì vậy, hãy cho chúng tôi biết về bất cứ trường hợp dị ứng hoặc không dung nạp chất vào ô dưới đây. Sau khi bạn đặt hàng, chúng tôi sẽ kiểm tra cẩn thận và liên hệ điều chỉnh thực đơn giúp bạn (nếu cần).
                </p>
                </div>
                <div class="note-special__box">
                    <div class="form-group">
                        <textarea class="form-control" rows="1" placeholder="để lại ghi chú tại đây" name="options[note]">
                            
                        </textarea>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="details-order__next btn--custome">
                <button type="submit" class="form-control">
                    Tiếp tục
                </button>
            </div>
        </div>
    </div>
</form>

@section('title', 'Lên kế hoạch cho bữa ăn')

@push('scripts')
    <script>
        var price = {{ $cartItem ? $cartItem['price'] : 0 }}
        var total = 0;
        var discount = 0;

        $(function(){
            changePirceMeal(price);

            $(document).on('click','.next-step',function(){
                let meal_check = getMeals();

                if(!meal_check.length){
                    $('#error_step').removeClass('d-none');
                    return ;
                }
                var next_step = $(this).data('next');
                $('div[data-step=1]').addClass('d-none');
                $('div[data-step=2]').removeClass('d-none');

                window.scrollTo({top: 100, behavior: 'smooth'});

            });

            $('.form-check-input').on('change' , function(){
                let name = $(this).attr('name');
                let day = getDay();
                let meals_for_plan = getMeals();
                let week = 1;
                if(name == 'options[meal][]'){
                    if(meals_for_plan.includes('launch') && meals_for_plan.length == 1){
                        $('#options_extra_1').prop('disabled',false);
                    }else{
                        $('#options_extra_1').prop('disabled',true);
                    }
                }

                if(name == 'options[days]'){
                    day = $(this).val();
                }

                if(name == 'options[meal_of_week]'){
                    week = $(this).val();
                    if(week == 4){
                        changePirceMeal($(this).data('price') , 0.9);
                    }else{  
                        changePirceMeal($(this).data('price'),1);
                    }
                }

                $('.total-meal').text(meals_for_plan.length * day * week);
            });

            $('input[data-extra]').on('change',function(){
                let extra = $(this).data('extra');
                if($(this).is(':checked')){
                    price = price + extra;
                }else{
                    price = price - extra;
                }

                changePirceMeal(price);
            });

            function changePirceMeal(price , discount_percent = 1){
                let days = getDay();
                let weeks = $('#week').find('input:radio:checked').val();
                let meals = getMeals().length || 1;

                total = price * meals * days * weeks * discount_percent;
                if(discount_percent < 1){
                    discount = total * (1 - discount_percent);
                }else{
                    discount = 0 ;
                }
                
                let price_fm = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
                let price_meals_fm = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
                let discounted = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(discount);

                $('.form-check-input').data('price', price);
                $('.meal-save-price').text(discounted);
                $('.meal-price').text(price_fm);
                $('.total-meal-price').text(price_meals_fm);
            }

            function getMeals()
            {
                return $("#meal input:checkbox:checked").map(function(){
                        return $(this).val();
                    }).get();
            }

            function getDay()
            {
                return $('#days').find('input:radio:checked').val();
            }
        })
    </script>
@endpush