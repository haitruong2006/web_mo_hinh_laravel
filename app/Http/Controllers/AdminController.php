<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Manufacture;
use App\Models\Bill;
use App\Models\User;
use Carbon\Carbon;

class AdminController extends Controller
{
    //
    public function index(){

        $month = Carbon::now()->month;

        $bill_chua_xu_ly = Bill::where('status', 1)->get();
        $bill_da_giao = Bill::where('status', 3)->get();
        $bill_da_huy = Bill::where('status', 4)->get();

        $khach_hang = User::where('level', 1)->get();

        $bill_month = Bill::whereMonth('data_order', '=', $month)->get();

        $khach_hang_month = User::where('level', 1)->whereMonth('date', $month)->get();

        $bill_da_giao_month = Bill::where('status', 3)->whereMonth('data_order', $month)->get();

        $bill_da_huy = Bill::where('status', 4)->whereMonth('data_order', $month)->get();
        // dd($khach_hang_month);

        // dd($bill);

        return view('admin.layout.page.home', compact('bill_chua_xu_ly', 'bill_da_giao', 'bill_da_huy', 'khach_hang', 'bill_month', 'khach_hang_month', 'bill_da_giao_month', 'bill_da_huy'));
    }
    public function Getlogin(){
        return view('admin.layout.page.login');
    }
    public function Postlogin(Request $request){
        $this->validate($request, [
            'password' => 'min: 6',
        ],
        [
            'password.min' => 'Password tối thiếu 6 ký tự'
        ]
        );
        $credentials = array('email'=>$request->email,
        'password'=>$request->password
        );

        $credentials=['email'=>$request->email,'password'=>$request->password];
        if(Auth::attempt($credentials)){//The attempt method will return true if authentication was successful. Otherwise, false will be returned.

            return redirect("/admin/home")->with('alert',"Đăng nhập thành công");
        }
        else{
            return redirect()->back()->with('alert', 'Đăng nhập không thành công');;
        }

    }

    public function Getlogout(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('admin.getlogin');
    }

    public function Order(){
        $month = Carbon::now()->month;
        $bills = Bill::whereMonth('data_order', '=', $month)->get();
        $count_bill = count($bills);
        return view('admin.layout.page.thongketrongthang.Order', compact('bills', 'count_bill'));
    }

    public function User(){
        $month = Carbon::now()->month;
        $users = User::whereMonth('date', '=', $month)->get();
        return view('admin.layout.page.thongketrongthang.user', compact('users'));
    }

}
