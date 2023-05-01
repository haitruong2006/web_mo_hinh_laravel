@extends('admin.layout.master')

@section('title', 'Thêm Mới')

@section('content')
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <h1>Thêm Mới Mã Giảm Giá</h1>
                    <div class="page-doby">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-block">
                                        <form action="{{ route('magiamgia.postthemmoi') }}"  enctype="multipart/form-data" method="post">
                                            @csrf
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">Tên Mã Giảm Giá</label>
                                                <div class="col-sm-10">
                                                    <input type="text"  name ="name" class="form-control" placeholder="Nhập tên mã" required>
                                                </div>
                                            </div>
                                            @error('name')
                                                <div class="alert alert-danger">{{ $message }}</div>
                                            @enderror
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">Giá Trị Mã Giảm Giá</label>
                                                <div class="col-sm-10">
                                                    <input type="number"  name ="value" class="form-control" placeholder="Giá trị của mã" required min="1">
                                                </div>
                                            </div>
                                            @error('value')
                                                <div class="alert alert-danger">{{ $message }}</div>
                                            @enderror
                                            <div class="form-group row">
                                                <div class="col-sm-12">
                                                    <button type="submit" class="form-control form-bg-primary">Thêm Mới</button>
                                                </div>
                                            </div>
                                        </form>
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
