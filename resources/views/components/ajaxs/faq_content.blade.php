<div class="page-faqs__body" id="page-faqs__body">
    @foreach($faqs_cat as $faq)
        <div class="faqs-box">
            <div class="faqs-box__title">
                <h3>{{ $faq->name }}</h3>
            </div>
            <div id="accordion">
                @if($faq->posts)
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
                @endif
            </div>
        </div>
    @endforeach
</div>