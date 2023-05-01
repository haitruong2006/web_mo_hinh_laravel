@extends('users.layout.master2')
@section('title', 'Chi tiết sản phẩm')

@section('content')
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">

                        <div class="product__details__pic__item">
                        @isset($products)

                            <img class="product__details__pic__item--large"
                                src="/front_end/img/products/{{ $products->image }}" alt="">

                        @endisset
                        </div>

                        <div class="product__details__pic__slider owl-carousel">
                            @isset($products_image)
                            @foreach($products_image as $images)
                             <img  height="100px" data-imgbigurl="/front_end/img/products/{{ $images->image }}"
                                src="/front_end/img/products/{{ $images->image }}" alt="">
                            @endforeach
                            @endisset
                            <!-- <img data-imgbigurl="/front_end/img/product/details/product-details-2.jpg"
                                src="/front_end/img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="/front_end/img/product/details/product-details-3.jpg"
                                src="/front_end/img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                src="/front_end/img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                src="/front_end/img/product/details/thumb-4.jpg" alt=""> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>{{ $products->name }}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>({{ $count_comment }} reviews)</span>
                        </div>
                        <div class="product__details__price">
                            @if($products->promotion_price > 0)
                            <h5><a  style='text-decoration: line-through'>{{ number_format($products->unit_price) }}</a>   <a >{{ number_format($products->promotion_price) }}</a></h5>
                            @else
                            <a >{{ number_format($products->unit_price) }}</a>
                            @endif
                        </div>
                        <p>{{ $products->detail }}</p>

                        <a href="{{ route('add-cart', $products->id) }}" class="primary-btn">Thêm Vào Giỏ Hàng</a>
                        <a href="{{ route('add-productlike', $products->id) }}" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <!-- <li><b>Tình trạng</b> <span>{{ $products->the_number_of_import - $products->sell != 0?'Còn Hàng':'Hết hàng'  }}</span></li> -->
                            <li><b>Danh Mục</b> <span style="text-transform: uppercase">{{ $products->manufacture->name }}</span></li>
                            <li><b>Tỉ lệ</b> <span>{{ $products->ratio }}</span></li>
                            <li><b>Đã bán</b> <span>{{ $quantity_da_ban != null?$quantity_da_ban:0 }}</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                            <!-- @isset($products_image)
                            @foreach($products_image as $images)
                                <li><b>Tỉ lệ</b> <span>{{ $images->image }}</span></li>
                            @endforeach
                            @endisset -->

                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Mô Tả</a>
                            </li>
                            <!-- <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Thông Tin</a>
                            </li> -->
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Bình Luận <span>({{ $count_comment }})</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                   {!! $products->description !!}
                                </div>
                            </div>
                            <!-- <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>
                                </div>
                            </div> -->
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <!-- <h2 style="text-align:center">Tất cả bình luận</h2>
                                    <h4 style="font-weight:bold">Ngô Văn hải Trường</h4>
                                    <h4 style="margin-left:30px">Sản phẩm đẹp quá</h4>
                                    <form action="" style="margin-top:20px">
                                        <textarea name="" id="" cols="30" rows="10" class="form-control" placeholder="viết bình luận tại đây"></textarea>
                                        <button style="margin-top: 20px" class="btn btn-primary">Đăng</button>
                                    </form> -->




                                    <div>
                                        <div class="container">
                                            <h2 class="text-center">Tất cả bình luận</h2>

                                            <div class="card">


                                                @foreach($comments as $comment)
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <img src="/front_end/img/user/{{ $comment->user->image }}" class="img img-rounded img-fluid" style="width:100px" />
                                                            <p class="text-secondary text-center">thời gian: {{ $comment->time }}</p>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <p>
                                                                <a class="float-left" href="https://maniruzzaman-akash.blogspot.com/p/contact.html" style="color:black"><strong>{{ $comment->user->full_name }}</strong></a>
                                                                <!-- <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                                                <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                                                <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                                                <span class="float-right"><i class="text-warning fa fa-star"></i></span> -->
                                                                @if(Auth::check())
                                                                <!-- <form action="" method="post">
                                                                    @csrf
                                                                    @method('PUT') -->
                                                                <a href="{{ route('xoabinhluan', $comment->id) }}" class="float-right" style="color: #808080; display: {{ Auth::user()->id == $comment->id_users?'':'none' }}" onclick="return confirm('Bạn chắc chắn muốn xóa bình luận này')">Xóa bình luận</a>
                                                                <!-- </form> -->
                                                                @endif
                                                            </p>
                                                            <div class="clearfix">

                                                            </div>
                                                            <p>{{ $comment->content }}</p>
                                                            <p>
                                                                <a class="float-right btn btn-outline-primary ml-2"> <i class="fa fa-reply"></i> Trả Lời</a>
                                                                <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Yêu thích</a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                @endforeach



                                            </div>

                                        </div>
                                        <!-- <h3 style="float:left">Viết bình lauanj tại đây</h3> -->
                                        <form action="{{ route('binhluan', $products->id) }}" method="post" >
                                            @csrf
                                            <div class="card text-white bg-primary mb-1" style="margin-top: 20px">
                                                <div class="card-header">
                                                    Viết bình luận tại đây
                                                    <a class="float-right btn btn-dark"> <i class="fa fa-comment"></i> Comment</a>
                                                </div>
                                                <div class="card-body">
                                                    <div class=" card-text form-group">
                                                        <input placeholder="nhập bình luận"
                                                           name="content" class="form-control form-control-lg" required>
                                                        </input>
                                                    </div>

                                                </div>
                                            </div>
                                            <button	button class="btn btn-outline-primary text-truncate float-none float-sm-none add-another-btn" data-bss-hover-animate="pulse" type="submit">Hoàn Tất<i class="fas fa-check-circle edit-icon"></i></button>
                                        </form>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
@endsection
<script>
  var msg = '{{Session::get('dangerous')}}';
  var exist = '{{Session::has('dangerous')}}';
  if(exist){
    alert(msg);
  }
</script>
<script>
  var msg = '{{Session::get('commentthanhcong')}}';
  var exist = '{{Session::has('commentthanhcong')}}';
  if(exist){
    alert(msg);
  }
</script>
