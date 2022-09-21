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
                        <div class="emfresh-card">
                            <div class="emfresh-card-header">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="title">
                                        Thông báo qua email
                                    </div>
                                </div>
                            </div>
                            <div class="emfresh-card-body notification-list">
                                <div class="d-flex align-items-center justify-content-between emfresh_mb-4">
                                    <div class="title">Thực đơn tuần mới</div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input user-change-setting" id="newsletters" name="newsletters" @if($user->newsletters == 'Y') checked @endif value="Y">
                                        <label class="custom-control-label" for="newsletters"></label>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="title">Chương trình khuyến mãi</div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input user-change-setting" id="email_notify" name="email_notify" @if($user->email_notify == 'Y') checked @endif value="Y">
                                        <label class="custom-control-label" for="email_notify"></label>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).on('change','.user-change-setting', function(){
            let input_name = $(this).attr('name');

            let data = {
                input_name ,
                checked: $(this).is(':checked'),
                _token : document.querySelector('meta[name="csrf-token"]').content
            }

            $.ajax({
                url: "{{ route('users.update_setting') }}",
                type: 'POST',
                data : data,
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                }
            });
        });
    </script>
@endpush