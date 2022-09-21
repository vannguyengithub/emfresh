@include('checkout.step_process')

<div class="container">
    <div class="order-category">
        @foreach($categories as $category)
        <div class="order-category__item active">
            <div class="order-category__box">
                <a title="chay" class="order-category__img">
                    <img src="{{asset('/storage/' . $category->image  ) }}" alt=" {{ $category->name }}">
                </a>    
                <div class="order-category__body">
                    <h3>{{ $category->name}}</h3>
                    <p>{{ $category->description }}</p>
                    <a href="/thuc-don?category_id={{$category->id}}" class="order-category__see-menu">
                        Xem thực đơn tuần này
                    </a>
                    <div class="order-category__now">
                        <a href="{{ route('checkout.add' , ['category_id' => $category->id])}}" title="đặt hàng">
                            Đặt hàng
                        </a>
                    </div>
                </div>
                <div class="order-category__popular">
                    PHỔ BIẾN
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>

@section('title', 'Đặt món ăn')
