@extends('users.layout.master2')

@section('content')
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2 style="color:red">Blog</h2>

                </div>
            </div>
        </div>
    </div>
</section>
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__item">
                        <h4>Tất Cả Bài Viết</h4>
                        <div class="blog__sidebar__recent">
                            @foreach($blog as $item)
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="/front_end/img/blog/{{ $item->image }}" alt="" width="100px">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <h6>{{ $item->title }}<br /></h6>
                                    <span>{{ $item->date }}</span>
                                </div>
                            </a>
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    @isset($blog)
                    @foreach($blog as $item)
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="/front_end/img/blog/{{ $item->image }}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> {{ $item->date }}</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="{{ route('blog-detail', $item->id) }}">{{ $item->title }}</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam
                                    quaerat </p>
                                <a href="{{ route('blog-detail', $item->id) }}" class="blog__btn">CHI TIẾT <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    @endisset
                    <div class="col-lg-12">
                        <div class="/front_end/product__pagination blog__pagination">
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
