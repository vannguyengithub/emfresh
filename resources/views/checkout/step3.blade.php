@extends('layouts.app')

@section('title', 'Chọn món ăn')

@section('content')
    @include('checkout.step_process')  

    <div class="container">
        <form action="{{ route('checkout.update_product')}}" method="POST">
            @csrf
            <div class="choose-food">
                <h1 class="choose-food__title">
                    CHỌN MÓN
                </h1>

                @if($cartItem['options']['meal_of_week'] == 1)
                <div class="choose-food__change-menu-inner">
                    <div class="choose-food__change-menu">
                        <p>Thay đổi thực đơn</p>
                        <div class="emfresh-card-body notification-list">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="switch_to_change_product">
                                <label class="custom-control-label" for="switch_to_change_product"></label>
                            </div>
                        </div>
                    </div>

                    <p class="choose-food__change-menu-desc">
                        em.fresh khuyến khích sử dụng thực đơn do chúng tôi thiết kế để đảm bảo bữa ăn đa dạng và đầy đủ dưỡng chất.
                    </p>
                </div>
                @endif
                <div class="tabs-day">
                    <!--  -->
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        @foreach($day_products as $d)
                        <li class="nav-item" role="presentation">
                            <button class="nav-link @if($loop->first) active @endif @if(isset($d['disabled'])) disabled @endif" id="pills-home-tab" data-toggle="pill" data-target="#pills-home_{{ $loop->iteration }}" type="button" role="tab" aria-controls="pills-home" aria-selected="true">
                                <h4>{{ $d['day'] }}</h4>
                                <p>{{ $d['date'] }}</p>
                            </button>
                        </li>
                        @endforeach
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        @foreach($day_products as $d)
                            <div class="tab-pane fade show @if($loop->first) active @endif " id="pills-home_{{ $loop->iteration }}" role="tabpanel" aria-labelledby="pills-home-tab">
                                <div class="row row-mb-cus">
                                    @foreach(config('constants.meals') as $meal)
                                        @php 
                                            $can_edit = in_array($meal , $cartItem['options']['meal']);
                                        @endphp
                                        <div class="col-md-4 col-8">
                                            <div class="form-group form-group__custome-select" @if(!$can_edit) disabled @endif>
                                                <select class="form-control" name="options[meals][{{$d['date']}}][pid][]">
                                                    @foreach($d['products'] as $product)
                                                        <option value="{{ $product->id}}">{{ $product->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            @foreach($d['products'] as $product)
                                                @if($product['meals'] == $meal)
                                                    <div class="meal-package-content text-center @if(!$can_edit) disable @endif">
                                                        <div class="img">
                                                            <img class="img-fluid" src="{{ asset('storage/' . $product->image )}}" width="300" height="300" alt="{{ $product->name }}">
                                                        </div>
                                                        <div class="content">
                                                            {{ $product->name }}
                                                        </div>
                                                    </div>
                                                @endif
                                            @endforeach

                                            <div class="all-hours @if(!$can_edit) disabled @endif">{{__('emfresh.meals.'.$meal)}}</div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="details-order__next btn--custome">
                <button type="submit" class="form-control">
                    Tiếp tục
                </button>
            </div>
        </form>
    </div>
@endsection

@push('scripts')
    <script>
        $('#switch_to_change_product').on('change', function(){
            if($(this).is(':checked')){
                $('.choose-food__change-menu-desc,.form-group__custome-select').show();
            }else{
                $('.choose-food__change-menu-desc,.form-group__custome-select').hide();
            }
        });
    </script>
@endpush