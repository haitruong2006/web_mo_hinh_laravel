@extends('users.layout.master2')
@section('title', 'hồ sơ của tôi')

@section('content')
    <section style="background-color: #eee;">
        <div class="container py-5">
            <h2 style="text-align:center">Hồ Sơ Cá Nhân</h2>
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="/front_end/img/user/{{ Auth::user()->image }}" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                        <h5 class="my-3">{{ Auth::user()->full_name }}</h5>
                        <!-- <p class="text-muted mb-1">Full Stack Developer</p>
                        <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                        <div class="d-flex justify-content-center mb-2">
                        <button type="button" class="btn btn-primary">Follow</button>
                        <button type="button" class="btn btn-outline-primary ms-1">Message</button>
                        </div> -->
                    </div>
                    </div>

                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <form action="{{ route('capnhatthongtin', Auth::user()->id) }}" enctype="multipart/form-data" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <!-- <a class="text-muted mb-0" href="/">Johnatan Smith</a> -->
                                        <input class="form-control form-bg-primary"  type="text" value="{{ Auth::user()->full_name  }}" name="full_name" required>
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input class="form-control form-bg-primary"  type="email" value="{{ Auth::user()->email  }}" name="email" required>
                                    </div>
                                    @error('email')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input class="form-control form-bg-primary"  type="number" value="{{ Auth::user()->phone  }}" name="phone">
                                    </div>
                                    @error('phone')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">

                                        <textarea class="form-control form-bg-primary"  name="address" id="" cols="30" rows="10" required>{{ Auth::user()->address  }}</textarea>
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Cập Nhật Avatar</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input class="form-control form-bg-primary"  type="file" value="" name = "file">
                                    </div>
                                    @error('file')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Nhập Mật Khẩu</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input class="form-control form-bg-primary"  type="password" value="" name="password">
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <button class="form-control form-bg-primary">Cập nhật</button>
                                    </div>
                                    <!-- <div class="col-sm-9">
                                        <a class="text-muted mb-0" href="/">Johnatan Smith</a>
                                    </div> -->
                                </div>
                                <hr>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <table class="table">
                                    <tr>
                                        <td>Mã Đơn</td>
                                        <td>Ghi Chú</td>
                                        <td>Thành Tiền</td>
                                        <td>Thời Gian Đặt</td>
                                        <td>Trạng Thái</td>
                                        <td>Chi TIết</td>
                                        <td>Hành Động</td>
                                    </tr>
                                    @isset($bills)
                                    @foreach($bills as $bill)
                                    <tr>
                                        <td>{{ $bill->id }}</td>
                                        <td>{{ $bill->note }}</td>
                                        <td>{{ number_format($bill->total) }}</td>
                                        <td>{{ $bill->data_order }}</td>
                                        <td>
                                            @if($bill->status==1)
                                            <a class="btn btn-primary">Đang Xử Lý</a>
                                            @elseif($bill->status==2)
                                            <a class="btn btn-success">Đang Giao</a>
                                            @elseif($bill->status==3)
                                            <a class="btn btn-warning">Đã Giao</a>
                                            @else
                                            <a class="btn btn-danger">Đã Hủy</a>
                                            @endif
                                        </td>
                                        <td>
                                            <a href="{{ route('ho-so-ca-nhan-detail', $bill->id) }}"  class="btn btn-info">Xem Chi Tiết</a>
                                        </td>
                                        <td>
                                            <a href="{{ route('huydon', $bill->id) }}"  style="color:black; display: {{ $bill->status==1?'':'none' }}">Hủy Đơn</a>
                                        </td>
                                    </tr>
                                    @endforeach
                                    @endisset
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
<script>
  var msg = '{{Session::get('huydon')}}';
  var exist = '{{Session::has('huydon')}}';
  if(exist){
    alert(msg);
  }
</script>
<script>
  var msg = '{{Session::get('rongpassword')}}';
  var exist = '{{Session::has('rongpassword')}}';
  if(exist){
    alert(msg);
  }
</script>
<script>
  var msg = '{{Session::get('passworderror')}}';
  var exist = '{{Session::has('passworderror')}}';
  if(exist){
    alert(msg);
  }
</script>


