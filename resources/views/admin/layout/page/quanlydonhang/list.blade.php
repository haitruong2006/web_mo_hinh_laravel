@extends('admin.layout.master')
@section('title', 'tất cả đơn hàng')

@section('content')
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <h1 style="text-align:center">Danh Sách Đơn Hàng</h1>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Stt</th>
                                <th>ID Đơn Hàng</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Adress</th>
                                <th>Total</th>
                                <th>Tình Trạng</th>
                                <th>Action</th>


                            </tr>

                            @isset($bills)
                            <?php $count=1; ?>
                            @foreach($bills as $bill)
                            <form action="" method="post">
                                @csrf
                                @method('delete')
                            <tr>
                                <td>{{ $count++ }}</td>
                                <td>{{ $bill->id }}</td>
                                <td>{{ $bill->user->full_name }}</td>
                                <td>{{ $bill->user->email }}</td>
                                <td>{{ $bill->phone }}</td>
                                <td>{{ $bill->address }}</td>

                                <td>{{ number_format($bill->total) }}</td>
                                <!-- <td>{{ $bill->status==1?'<a>Đang Xử Lý</a>':($bill->status==2?'Đang Giao':'Đã Giao') }}</td> -->
                                @if($bill->status == 1)
                                    <td><a href="" class="label label-primary">Đang Xử Lý</a></td>
                                @elseif($bill->status == 2)
                                    <td><a href="" class="label label-success">Đang Giao</a></td>
                                @elseif($bill->status == 3)
                                <td><a href="" class="label label-warning">Đã Giao</a></td>
                                @else
                                    <td><a href="" class="label label-danger">Đã Hủy</a></td>
                                @endif
                                <td>
                                    <button style="border:none" type="button" class="label label-success" onclick="window.location = '{{ route('order.chitiet', $bill->id) }}'">Detail
                                    </button>

                                    <a href="" style="display: {{ $bill->status==3?'':'none' }}"><button type="submit" style="border:none" class="label label-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Delete</button></a>
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
