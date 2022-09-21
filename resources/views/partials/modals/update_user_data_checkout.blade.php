<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal__custome" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Cập nhật địa chỉ giao hàng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18.2997 5.70997C17.9097 5.31997 17.2797 5.31997 16.8897 5.70997L11.9997 10.59L7.10973 5.69997C6.71973 5.30997 6.08973 5.30997 5.69973 5.69997C5.30973 6.08997 5.30973 6.71997 5.69973 7.10997L10.5897 12L5.69973 16.89C5.30973 17.28 5.30973 17.91 5.69973 18.3C6.08973 18.69 6.71973 18.69 7.10973 18.3L11.9997 13.41L16.8897 18.3C17.2797 18.69 17.9097 18.69 18.2997 18.3C18.6897 17.91 18.6897 17.28 18.2997 16.89L13.4097 12L18.2997 7.10997C18.6797 6.72997 18.6797 6.08997 18.2997 5.70997Z" fill="#757575"/>
                        </svg>                                           
                    </span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('checkout.update_user_data') }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="name">Họ</label>
                                <input type="text" class="form-control" id="name" name="user_data[name]" aria-describedby="name" placeholder="Họ" value="{{ $user['name'] }}">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="lastname">Tên</label>
                                <input type="text" class="form-control" id="lastname" name="user_data[lastname]" placeholder="Tên" value="{{isset($user['lastname']) ?? ''  }}">
                            </div>
                        </div>
                    </div>
                    <div class="row row-custome__mobile">
                        <div class="col">
                            <div class="form-group">
                                <label for="phone">Số điện thoại</label>
                                <input type="tel" id="phone" name="user_data[phone]" value="{{ $user['phone'] }}" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input type="email" class="form-control" id="email" name="user_data[email]" value="{{ $user['email'] }}" placeholder="Email">
                            </div>
                        </div>
                    </div>
                    <div class="form-outline">
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" class="form-control" id="address" name="user_data[address]" value="{{ $user['address'] }}" placeholder="Địa chỉ">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="selectDistrict">Quận</label>
                                <select class="form-control" id="selectDistrict" name="user_data[district_id]">
                                    @foreach(\App\Shipping::all() as $ship)
                                        <option value="{{ $ship->id }}" @if($ship->id == $user['district_id']) selected @endif>{{ $ship->district }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Cập nhật địa chỉ</button>
                </form>
            </div>
        </div>
    </div>
</div>