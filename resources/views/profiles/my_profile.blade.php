@extends('layouts.app')

@section('title', 'Thông tin của bạn')

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
                                        <form action="{{ route('users.update') }}" method="POST" class="check-change">
                                            @method('patch')
                                            @csrf
                                            <input type="hidden" name="section" value="info" />
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
                                                
                                                <div class="col-sm-12">
                                                    <div class="form-group emfresh-form-group">
                                                        <label for="selectDistrict">Quận</label>
                                                        <select class="form-control" id="selectDistrict" name="district_id">
                                                            @foreach(\App\Shipping::all() as $ship)
                                                                <option value="{{ $ship->id }}" @if($ship->id == $user->district_id) selected @endif>{{ $ship->district }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                               
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
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <div class="modal fade" id="modalChangePassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <form action="{{ route('users.update') }}" method="POST" class="check-change">
                @method('patch')
                @csrf

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
                                <input type="password" id="password" name="password" size="32" maxlength="32" value="" class="form-control" autocomplete="off">
                                <div class="input-group-addon">
                                    <a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                </div>                    
                            </div>
                        </div>
                        <div class="position-relative">
                            <div class="form-group emfresh-form-group">
                                <label for="password_confirmation">Nhập lại mật khẩu mới</label>
                                <input type="password" id="password_confirmation" name="password_confirmation" size="32" maxlength="32" value="" class="form-control" autocomplete="off">
                                <div class="input-group-addon">
                                    <a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                </div>                       
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="submit" class="w-100 btn ty-btn__success rounded-pill btn-change-password" disabled>Đổi mật khẩu</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection