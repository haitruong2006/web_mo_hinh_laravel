@extends('users.layout.master2')

@section('title', 'đơn hàng của bạn')

@section('content')
    <div class="container">
        <div class="row">

            <h3 style="margin-bottom:10px">Thông Tin Đặt Hàng</h3>
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th>Tên Người Đặt</th>
                            <td>{{  $bill->user->full_name }}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>{{  $bill->user->email }}</td>
                        </tr>
                        <tr>
                            <th>Số Điện Thoại</th>
                            <td>{{  $bill->user->phone }}</td>
                        </tr>
                        <tr>
                            <th>Ngày Đặt</th>
                            <td>{{  $bill->data_order }}</td>
                        </tr>
                        <tr>
                            <th>Tổng Tiền</th>
                            <td>{{  number_format($bill->total) }}</td>
                        </tr>
                    </table>
                </div>
            </div>

            <h3 style="margin-bottom:10px">Thông Tin Người Nhận</h3>
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th>Tên Người Nhận</th>
                            <td>{{ $bill->name }}</td>
                        </tr>
                        <tr>
                            <th>Số Điện THoại</th>
                            <td>{{ $bill->phone }}</td>
                        </tr>
                        <tr>
                            <th>Địa Chỉ Nhận Hàng</th>
                            <td>{{ $bill->address }}</td>
                        </tr>
                        <tr>
                            <th>Ghi Chú</th>
                            <td>{{ $bill->note }}</td>
                        </tr>
                    </table>
                </div>
            </div>

            <h3 style="margin-bottom:10px">Thông Tin Sản Phẩm</h3>
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th>Tên Hãng</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Ảnh</th>
                            <th>Tỉ Lệ</th>
                            <th>Giá</th>
                            <th>Số Lượng</th>
                            <th>Tổng Tiền</th>
                            <th>Xem</th>
                        </tr>
                        <?php $tongtiensanpham =0 ?>
                        @isset($bill_detail)
                        @foreach($bill_detail as $detail)
                        <tr>
                            <td>{{ $detail->product->manufacture->name }}</td>
                            <td>{{ $detail->product->name }}</td>
                            <td>
                                <img src="/front_end/img/products/{{ $detail->product->image }}" alt="" style="width: 100px">
                            </td>
                            <td>
                                {{ $detail->product->ratio }}
                            </td>
                            <td>
                                {{ number_format($detail->price) }}
                            </td>
                            <td>
                                {{ $detail->quantity }}
                            </td>
                            <td>
                                {{ number_format($tiensanpham= $detail->quantity * $detail->price) }}
                            </td>
                            <td>
                                <a href="{{ route('chi_tiet', $detail->id_product) }}" style="color:black">Chi Tiết Sản Phẩm</a>
                            </td>
                            <?php $tongtiensanpham+=$tiensanpham ?>
                        </tr>
                        @endforeach
                        @endisset
                        <tr>
                            <th colspan="6">Tông Tiền Sản Phẩm</th>
                            <td >{{ number_format($tongtiensanpham) }}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th colspan="6">Phí Ship</th>
                            <td>+30,000</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th colspan="6">Phiếu Giảm Giá</th>
                            <td>-{{  number_format($value_coupon) }}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th colspan="6">Tổng Tiền Thanh Toán</th>
                            <td>{{  number_format($bill->total) }}</td>
                            <td></td>
                        </tr>

                    </table>
                </div>

            </div>

        </div>
    </div>
@endsection
