@extends('layouts.app')

@section('title', ' Hỏi đáp')

@section('content')
    <div class="page-faqs container emfresh_mr-header">
        <div class="page-faqs__title">
            <h1>CÂU HỎI THƯỜNG GẶP</h1>
        </div>

        {{-- <div class="page-faqs__search">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M15.75 16.9167L11.0833 12.25C10.6667 12.5833 10.1875 12.8472 9.64583 13.0417C9.10417 13.2361 8.52778 13.3333 7.91667 13.3333C6.40278 13.3333 5.12167 12.8092 4.07333 11.7608C3.02444 10.7119 2.5 9.43056 2.5 7.91667C2.5 6.40278 3.02444 5.12139 4.07333 4.0725C5.12167 3.02417 6.40278 2.5 7.91667 2.5C9.43056 2.5 10.7119 3.02417 11.7608 4.0725C12.8092 5.12139 13.3333 6.40278 13.3333 7.91667C13.3333 8.52778 13.2361 9.10417 13.0417 9.64583C12.8472 10.1875 12.5833 10.6667 12.25 11.0833L16.9375 15.7708C17.0903 15.9236 17.1667 16.1111 17.1667 16.3333C17.1667 16.5556 17.0833 16.75 16.9167 16.9167C16.7639 17.0694 16.5694 17.1458 16.3333 17.1458C16.0972 17.1458 15.9028 17.0694 15.75 16.9167ZM7.91667 11.6667C8.95833 11.6667 9.84389 11.3022 10.5733 10.5733C11.3022 9.84389 11.6667 8.95833 11.6667 7.91667C11.6667 6.875 11.3022 5.98944 10.5733 5.26C9.84389 4.53111 8.95833 4.16667 7.91667 4.16667C6.875 4.16667 5.98944 4.53111 5.26 5.26C4.53111 5.98944 4.16667 6.875 4.16667 7.91667C4.16667 8.95833 4.53111 9.84389 5.26 10.5733C5.98944 11.3022 6.875 11.6667 7.91667 11.6667Z" fill="#424242"/>
            </svg>
            <input id="keyword_faq" type="text" placeholder="Nhập từ khoá bạn muốn tìm kiếm" name="keyword">
        </div> --}}

        <div class="page-faqs__body" id="page-faqs__body">
            @foreach($faqs_cat as $faq)
                @if(!$faq->posts->isEmpty())    
                <div class="faqs-box">
                    <div class="faqs-box__title">
                        <h3>{{ $faq->name }}</h3>
                    </div>
                    <div id="accordion">
                        @foreach($faq->posts as $post)
                            <div class="card">
                                <div class="card-header" id="heading_{{$post->id}}">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link faqs-btn__custome" data-toggle="collapse" data-target="#collapse_{{$post->id}}" aria-expanded="true" aria-controls="collapse{{$faq->id}}">
                                            <span>
                                                {{$post->title}}
                                            </span>    
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse_{{$post->id}}" class="collapse" aria-labelledby="heading{{$post->id}}" data-parent="#accordion">
                                    <div class="card-body">
                                        {!! $post->body !!}
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                @endif
            @endforeach
        </div>
    </div>
@endsection


@push('scripts')
    <script>    
        $(document).ready(function(){
            $('#keyword_faq').on('keyup',function(){
                $.ajax({
                    type:'GET',
                    url:"{{ route('faq.search') }}",
                    data:{
                        keyword : $(this).val()
                    },
                    success:function(data) {
                        $('#page-faqs__body').html(data);
                    }
                });

                $.ajaxSetup({ headers: { 'csrftoken' : '{{ csrf_token() }}' } });
            });
        });
    </script>
@endpush