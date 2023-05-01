<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupons;
use Illuminate\Support\Facades\DB;

class CouponController extends Controller
{
    //
    public function List(){
        $coupons = Coupons::all();
        return view('admin.layout.page.coupon.list', compact('coupons'));
    }
    public function ListLoai($id){
        $coupons = Coupons::where('status', $id)->get();
        return view('admin.layout.page.coupon.listloai', compact('coupons', 'id'));
    }
    public function GetAdd(){
        return view('admin.layout.page.coupon.themmoi');
    }
    public function PostAdd(Request $request){
        $this->validate($request, [
            'name' => 'unique:coupons,name_coupon'
        ],
        [
            'name.unique' => 'Mã giảm giả này đã tồn tại'
        ]);
        $data = array();
        $data['name_coupon'] = $request->name;
        $data['value'] = $request->value;
        $insert = DB::table('coupons')->insert($data);
        return redirect()->back()->with('alert', 'Bạn đã thêm thành công');
    }
}
