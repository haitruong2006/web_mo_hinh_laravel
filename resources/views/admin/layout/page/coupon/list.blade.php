@extends('admin.layout.master')

@section('title', 'Danh Sách')

@section('content')
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <h1 style="text-align:center">Danh Sách Mã Giảm Giá</h1>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Stt</th>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Value</th>
                                <th>Status</th>



                            </tr>

                            @isset($coupons)
                            <?php $count=1; ?>
                            @foreach($coupons as $coupon)
                            <form action="}" method="post">
                                @csrf
                                @method('delete')
                            <tr>
                                <td>{{ $count++ }}</td>
                                <td>{{ $coupon->id }}</td>
                                <td>{{ $coupon->name_coupon }}</td>
                                <td>{{ number_format($coupon->value) }}</td>
                                <td>
                                    @if($coupon->status == 1)
                                    <a  class="label label-primary">Chưa Sửu Dụng</a>
                                    @else
                                    <a href="" class="label label-warning">Đã Sử Dụng</a>
                                    @endif
                                </td>


                            </tr>
                            </form>
                            @endforeach
                            @endisset

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

