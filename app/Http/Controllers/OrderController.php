<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Bill;
use App\Models\Bill_detail;
use App\Models\Coupons;

class OrderController extends Controller
{
    //
    public function List(){
        $bills = Bill::all();
        return view('admin.layout.page.quanlydonhang.list', compact('bills'));
    }
    public function ListLoai($id){
        $bill_id = Bill::where('status', $id)->get();
        $status = $id;
        return view('admin.layout.page.quanlydonhang.listloai', compact('bill_id', 'status'));
    }

    public function Detail($id){
        $bill = Bill::find($id);

        $id_coupon = $bill->id_coupon;
        $coupon = Coupons::where('id', $id_coupon)->first();

        if($coupon != null){
            $valuecoupon = $coupon->value;
        }
        else{
            $valuecoupon = '0';
        }


        $bill_details = Bill_detail::where('id_bill', $id)->get();
        return view('admin.layout.page.quanlydonhang.detail', compact('bill', 'bill_details', 'valuecoupon'));
    }

    public function update(Request $request, $id){
        // dd($id);
        // dd($request->status);
        $status = $request->status;
        $update = Bill::where('id', $id)->update(['status' => $status]);
        if($status == 2){
            $bill = Bill::find($id);
            $total = $bill->total;

            $email = $bill->user->email;
            $sentData = [
                'title' => 'Đơn hàng của bạn với mã vận đơn',
                'total' => $total,
                'id' => $bill->id,
            ];
            \Mail::to($email)->send(new \App\Mail\EmailCheckout_2($sentData));
        }

        else{
            $bill = Bill::find($id);
            // $total = $bill->total;

            $email = $bill->user->email;
            $sentData = [
                'title' => 'Đơn hàng của bạn đã được giao thành công',
                // 'content' => 'Cảm ơn bạn đã tin tưởng và lựa chọn TRUMMOHINH.COM để mua sản phẩm',
                'id' => $bill->id,

            ];
            \Mail::to($email)->send(new \App\Mail\EmailCheckout_3($sentData));
        }
        // else{
        //     $bill = Bill::find($id);
        //     // $total = $bill->total;

        //     $email = $bill->user->email;
        //     $sentData = [
        //         'title' => 'Đơn hàng của bạn đã bị hủy',
        //         // 'content' => 'Cảm ơn bạn đã tin tưởng và lựa chọn TRUMMOHINH.COM để mua sản phẩm',
        //         'id' => $bill->id,

        //     ];
        //     \Mail::to($email)->send(new \App\Mail\EmailCheckout_4($sentData));
        // }
        return redirect()->back()->with('alertdonhang', 'Đã cập nhật đơn hàng thành công');
    }



}
