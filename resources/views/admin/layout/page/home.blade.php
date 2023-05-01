
@extends('admin.layout.master')

@section('title', 'Trang chủ')


@section('content')
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <div class="page-body">
                        <div class="row">
                     <!-- order-card start -->
                            <div class="col-md-6 col-xl-3">
                                <div class="card bg-c-blue order-card">
                                    <div class="card-block">
                                        <h6 class="m-b-20">Đơn Hàng Chưa Xử Lý</h6>
                                        <h2 class="text-right"><i class="ti-shopping-cart f-left"></i><span>{{ count($bill_chua_xu_ly) }}</span></h2>
                                        <a  href=" {{ route('order.listloai', 1) }} " style="color: black; font-weight:bold; text-align:center">Chi tiết</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-3">
                                <div class="card bg-c-green order-card">
                                    <div class="card-block">
                                        <h6 class="m-b-20">Tất cả khách hàng</h6>
                                        <h2 class="text-right"><i class="ti-tag f-left"></i><span>{{ count($khach_hang) }}</span></h2>
                                        <a  href = "{{ route('user.list') }}" style="color: black; font-weight:bold; text-align:center">Chi tiết</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-3">
                                <div class="card bg-c-yellow order-card">
                                    <div class="card-block">
                                        <h6 class="m-b-20">Đơn hàng đã giao</h6>
                                        <h2 class="text-right"><i class="ti-wallet f-left"></i><span>{{ count($bill_da_giao) }}</span></h2>
                                        <a  href=" {{ route('order.listloai', 3) }} " style="color: black; font-weight:bold; text-align:center">Chi tiết</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-3">
                                <div class="card bg-c-pink order-card">
                                    <div class="card-block">
                                        <h6 class="m-b-20">Đơn hàng đã hủy</h6>
                                        <h2 class="text-right"><i class="ti-reload f-left"></i><span>{{ count($bill_da_huy) }}</span></h2>
                                        <!-- <p class="m-b-0">This Month<span class="f-right">$542</span></p> -->
                                        <a  href=" {{ route('order.listloai', 4) }} " style="color: black; font-weight:bold; text-align:center">Chi tiết</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="card tabs-card">
                                    <div class="card-block p-0">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs md-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#home3" role="tab"><i class="fa fa-home"></i>Đơn Hàng Trong Tháng</a>
                                                <div class="slide"></div>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#profile3" role="tab"><i class="fa fa-key"></i>Khách Hàng Mới Trong Tháng</a>
                                                <div class="slide"></div>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#messages3" role="tab"><i class="fa fa-play-circle"></i>Đơn hàng đã giao trong tháng</a>
                                                <div class="slide"></div>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#settings3" role="tab"><i class="fa fa-database"></i>Đơn hàng đã bị hủy trong tháng</a>
                                                <div class="slide"></div>
                                            </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content card-block">
                                            <div class="tab-pane active" id="home3" role="tabpanel">

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tr>
                                                            <!-- <th>Image</th> -->
                                                            <th>Id Đơn Hàng</th>
                                                            <th>Tên Khách Hàng</th>
                                                            <th>Ngày Đặt</th>
                                                            <th>Trạng Thái</th>
                                                            <th>Chi TIết</th>
                                                        </tr>
                                                        @isset($bill_month)
                                                        @foreach($bill_month as $bill)
                                                        <tr>
                                                            <!-- <td><img src="/front_end/img/products/g63.jpg" alt="prod img" class="img-fluid" width="100px"></td> -->
                                                            <td>{{ $bill->id }}</td>
                                                            <td>{{ $bill->user->full_name }}</td>
                                                            <td>{{ $bill->data_order }}</td>
                                                            <td>
                                                                    @if($bill->status == 1)
                                                                        <a href="" class="label label-primary">Đang Xử Lý</a>
                                                                    @elseif($bill->status == 2)
                                                                        <a href="" class="label label-success">Đang Giao</a>
                                                                    @elseif($bill->status == 3)
                                                                        <a href="" class="label label-warning">Đã Giao</a>
                                                                    @else
                                                                        <a href="" class="label label-danger">Đã Hủy</a>
                                                                    @endif
                                                            </td>
                                                            <td>
                                                                <a href=" {{ route('order.chitiet', $bill->id) }} " class="label label-info">Xem</a>
                                                            </td>
                                                        </tr>
                                                        @endforeach
                                                        @endisset
                                                    </table>
                                                </div>
                                                <div class="text-center">
                                                    <button class="btn btn-outline-primary btn-round btn-sm">Load More</button>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="profile3" role="tabpanel">

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tr>
                                                            <th>Id Khách Hàng</th>
                                                            <th>Ảnh</th>

                                                            <th>Tên</th>
                                                            <th>Email</th>
                                                            <th>Số Điện Thoại</th>
                                                            <th>Địa Chỉ</th>
                                                            <th>Ngày Tạo</th>
                                                        </tr>
                                                       @isset($khach_hang_month)
                                                       @foreach($khach_hang_month as $user)
                                                        <tr>
                                                            <td>{{ $user->id }}</td>
                                                            <td><img src="/front_end/img/user/{{ $user->image }}" alt="prod img" class="img-fluid" width="100px"></td>

                                                            <td>{{ $user->full_name }}</td>
                                                            <td>{{ $user->email }}</td>
                                                            <td>{{ $user->phone }}</td>
                                                            <td>{{ $user->address }}</td>
                                                            <td>{{ $user->date }}</td>
                                                        </tr>
                                                        @endforeach
                                                        @endisset
                                                    </table>
                                                </div>
                                                <div class="text-center">
                                                    <button class="btn btn-outline-primary btn-round btn-sm">Load More</button>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="messages3" role="tabpanel">

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tr>
                                                            <th>Id Đơn Hàng</th>
                                                            <th>Tên Khách Hàng</th>
                                                            <th>Ngày Đặt</th>
                                                            <th>Trạng Thái</th>
                                                            <th>Chi TIết</th>
                                                        </tr>
                                                        @isset($bill_da_giao_month)
                                                        @foreach($bill_da_giao_month as $bill)
                                                        <tr>
                                                            <td>{{ $bill->id }}</td>
                                                            <td>{{ $bill->user->full_name }}</td>
                                                            <td>{{ $bill->data_order }}</td>
                                                            <td>
                                                                    @if($bill->status == 1)
                                                                        <a href="" class="label label-primary">Đang Xử Lý</a>
                                                                    @elseif($bill->status == 2)
                                                                        <a href="" class="label label-success">Đang Giao</a>
                                                                    @elseif($bill->status == 3)
                                                                        <a href="" class="label label-warning">Đã Giao</a>
                                                                    @else
                                                                        <a href="" class="label label-danger">Đã Hủy</a>
                                                                    @endif
                                                            </td>
                                                            <td>
                                                                <a href=" {{ route('order.chitiet', $bill->id) }} " class="label label-info">Xem</a>
                                                            </td>
                                                        </tr>
                                                        @endforeach
                                                        @endisset

                                                    </table>
                                                </div>

                                                <div class="text-center">
                                                    <button class="btn btn-outline-primary btn-round btn-sm">Load More</button>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="settings3" role="tabpanel">

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tr>
                                                            <th>Id Đơn Hàng</th>
                                                            <th>Tên Khách Hàng</th>
                                                            <th>Ngày Đặt</th>
                                                            <th>Trạng Thái</th>
                                                            <th>Chi TIết</th>
                                                        </tr>
                                                        @isset($bill_da_huy)
                                                        @foreach($bill_da_huy as $bill)
                                                        <tr>
                                                            <!-- <td><img src="/front_end/img/products/g63.jpg" alt="prod img" class="img-fluid" width="100px"></td> -->
                                                            <td>{{ $bill->id }}</td>
                                                            <td>{{ $bill->user->full_name }}</td>
                                                            <td>{{ $bill->data_order }}</td>
                                                            <td>
                                                                    @if($bill->status == 1)
                                                                        <a href="" class="label label-primary">Đang Xử Lý</a>
                                                                    @elseif($bill->status == 2)
                                                                        <a href="" class="label label-success">Đang Giao</a>
                                                                    @elseif($bill->status == 3)
                                                                        <a href="" class="label label-warning">Đã Giao</a>
                                                                    @else
                                                                        <a href="" class="label label-danger">Đã Hủy</a>
                                                                    @endif
                                                            </td>
                                                            <td>
                                                                <a href=" {{ route('order.chitiet', $bill->id) }} " class="label label-info">Xem</a>
                                                            </td>
                                                        </tr>
                                                        @endforeach
                                                        @endisset
                                                    </table>
                                                </div>
                                                <div class="text-center">
                                                    <button class="btn btn-outline-primary btn-round btn-sm">Load More</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            </div>
                        </div>
                    <div id="styleSelector">

                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

