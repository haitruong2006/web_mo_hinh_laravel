<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Products;
use App\Models\Products_image;
use App\Models\Manufacture;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Mail\SendMailRegister;
use App\Models\User;
use App\Mail\SendMailResetPassword;
use App\Models\Products_like;
use App\Models\Cart;
use Illuminate\Support\Facades\Session;
use App\Models\Cart_data;
use App\Models\Cart_data_detail;
use App\Models\Coupons;
use App\Models\Bill;
use App\Models\Bill_detail;
use App\Models\Blog;
use App\Models\Comment;


class PageController extends Controller
{
    //
    public function SapXep(Request $request, $id){
        $gia = $request->gia;
        $gia = (string) $gia;
        $gia = $gia.'000';

        $products = Products::where('id_manufacture', $id)->where('unit_price', '<=', $gia)->orderBy('unit_price', 'desc')->get();


        // dd($products);
        $name_manu = Manufacture::find($id);

       // $products = Products::where('id_manufacture', $id)->get();

        $id_manu = $name_manu->id;
        $products_count = count($products);


       // dd($products_count);


        // return redirect()->back()->with(['name_manu' => $name_manu, 'products' => $products, 'products_count' => $products_count, 'id_manu' => $id_manu, 'gia' => $gia]);
        return view('users.layout.page.loai', compact('name_manu', 'products', 'products_count', 'id_manu', 'gia'));

    }
    public function getIndex(){
        // $products_all = Products::all();
        // $count_product = count($products_all);

        // $bahai1 = Products::where('ratio', '1:32')->get();
        $tilebahai = Products::where('ratio', '1:32')->get();
        $haibon = Products::where('ratio', '1:24')->get();
        $muoitam = Products::where('ratio', '1:18')->get();
        $basau = Products::where('ratio', '1:36')->get();


        $product_new = Products::where('new', 1)->paginate(3);

        $san_pham_moi_nhat = Products::orderBy('id', 'desc')->limit(3)->get();

        $sale = Products::where('promotion_price', '>',  0)->paginate(3);
        $sale_moi_nhat = Products::where('promotion_price', '>',  0)->orderBy('id', 'desc')->limit(3)->get();

        $bugati = Products::where('id_manufacture', 4)->paginate(3);

        $porchers = Products::where('id_manufacture', 18)->paginate(3);

        $blog = Blog::orderBy('id', 'desc')->limit(3)->get();

        if(Auth::check()){
            $user = Auth::user();
            $id_user = $user->id;

            $bahai = Cart_data::where('id_users', $id_user)->orderBy('id', 'desc')->limit(1)->get();
            foreach($bahai as $xe){
                $total = $xe->total;
                $id_cart = $xe->id;
                $cart_detail = Cart_data_detail::where('id_cart', $id_cart)->get();
                $cart_detail_count = count($cart_detail);
                return view('users.layout.page.trangchu.master', compact('tilebahai', 'haibon', 'muoitam', 'basau', 'product_new', 'total', 'san_pham_moi_nhat', 'sale', 'sale_moi_nhat', 'bugati', 'porchers', 'blog'));


            }
        }

        return view('users.layout.page.trangchu.master', compact( 'tilebahai', 'haibon', 'muoitam', 'basau', 'product_new', 'san_pham_moi_nhat', 'sale', 'sale_moi_nhat', 'bugati', 'porchers', 'blog'));

        // $slide = Products::limit(3)->get();



    }

    public function MyProfile(){
        $id_user = Auth::user()->id;

        $bills = Bill::where('id_users', $id_user)->get();

        return view('users.layout.page.MyProfile', compact('bills'));
    }

    public function MyProfileDetail($id){
        $bill = Bill::find($id);

        $id_coupon = $bill->id_coupon;
        $coupon = Coupons::where('id', $id_coupon)->first();
        if($coupon != null){
            $value_coupon = $coupon->value;
        }
        else{
            $value_coupon = 0;
        }

        $bill_detail = Bill_detail::where('id_bill', $id)->get();

        //dd($value_coupon);

        return view('users.layout.page.MyProfileDetail', compact('bill', 'id', 'value_coupon', 'bill_detail'));
    }

    public function CancelOrder($id){
        $bill = Bill::find($id);
        $status = $bill->status;
        if($status == 1){
            $update = Bill::where('id', $id)->update(['status' => 4]);

            $email = $bill->user->email;
            $sentData = [
                'title' => 'Đơn hàng của bạn đã bị hủy',
                // 'content' => 'Cảm ơn bạn đã tin tưởng và lựa chọn TRUMMOHINH.COM để mua sản phẩm',
                'id' => $bill->id,

            ];
            \Mail::to($email)->send(new \App\Mail\EmailCheckout_4($sentData));

            return redirect()->back()->with('alert', 'Bạn đã hủy đơn thành công');
        }
        else{
            return redirect()->back()->with('huydon', 'Quý khách chỉ được hủy đơn trong giai đoạn chủng bị đơn hàng');
        }
    }

    public function UpdateInformation(Request $request, $id){
        $this->validate($request, [
            'phone' => 'min:10|max:11',
            'file' => 'mimes:jpg,png,jpeg',
        ],
        [
            'phone.min' => 'Số điện thoại phải đủ 10 số',
            'phone.max' => 'Số điện thoại không vượt quá 11 số',
            'file.mimes' => 'Hình ảnh chỉ chấp nhận đuôi .JPG .JPEG .PNG'
        ]
        );

        if($request->password != ''){
        //    //$password = Hash::make($request->password);
        //    $user_pass = Auth::user()->password;
           $credentials=['email'=>$request->email,'password'=>$request->password];

            if(Auth::attempt($credentials)){

               // dd($file);
               $file = $request->file('file');
                if($file != ''){
                    $name = $file->getClientOriginalName();
                    $luu_tru = public_path('front_end/img/user');
                    $file->move($luu_tru, $name);
                }
                else{
                    $name = Auth::user()->image;
                }
                // dd($name);
                $data = array();
                $data['full_name'] = $request->full_name;
                $data['email'] = $request->email;
                $data['phone'] = $request->phone;
                $data['address'] = $request->address;
                $data['image'] = $name;
                $update = DB::table('users')->where('id', $id)->update($data);
                return redirect()->back()->with('alert', 'Bạn đã cập nhật thông tin thành công');

            }
            else{
                return redirect()->back()->with('passworderror', 'Mật khẩu sai');
            }

        //    dd($user_pass);

        }
        else{
            return redirect()->back()->with('rongpassword', 'Vui lòng nhập password để hoàn tất thao tác');
        }

    }

    public function Comment(Request $request, $id){
        $content = $request->content;
        $id_user = Auth::user()->id;
        $data = array();
        $data['id_users'] = $id_user;
        $data['id_product'] = $id;
        $data['content'] = $content;
        $data['time'] = date('Y-m-d');
        $insert = DB::table('comment')->insert($data);
        return redirect()->back()->with('commentthanhcong', 'Cảm ơn bạn đã đóng góp ý kiến');
    }

    public function DeleteComment($id){
        $delete = Comment::where('id', $id)->delete();
        return redirect()->back()->with('alert', 'Bạn đã xóa bình luận này');
    }

    public function getMap(){
        return view('users.layout.page.map');
    }
    public function getLoai($id){
        $name_manu = Manufacture::find($id);

        $products = Products::where('id_manufacture', $id)->get();

        $id_manu = $name_manu->id;
        $products_count = count($products);

        return view('users.layout.page.loai', compact('name_manu', 'products', 'products_count', 'id_manu'));
    }

    public function getType($id){
        $ratio = $id;
        $products = Products::where('ratio', $id)->get();
        return view('users.layout.page.type', compact('products', 'ratio'));
    }

    public function getDetail($id){
        $products = Products::find($id);
        $products_image = Products_image::where('id_product', $id)->get();

        $comments = Comment::where('id_product', $id)->get();

        $count_comment = count($comments);

        $select_product = Bill_detail::where('id_product', $id)->get();
        $quantity_da_ban = 0;
       foreach($select_product as $product){
            $quantity_da_ban += $product->quantity;
       }
    //    dd($quantity);

        // $id_users_comemnt = $comments->id_users;
        // dd($id_users_comemnt);
        // dd($count_comment);

        // dd($comments);

        return view('users.layout.page.detail', compact('products', 'products_image', 'comments', 'count_comment', 'quantity_da_ban'));
    }

    public function DeleteProduct($id){
        $old_cart = Session::has('cart')?Session::get('cart'):null;
        $cart = new Cart($old_cart);
        if(is_null($old_cart)){
            $cart_detail = Cart_data_detail::where('id_product', $id)->first();
            //$id_cart = $cart_detail->id_cart;

            $delete_cart_detail = DB::table('cart_detail')
            ->where('id_product', $id)
            ->delete();

            $user = Auth::user();
            $id_user = $user->id;

            $cart = Cart_data::where('id_users', $id_user)->first();
            $id_cart = $cart->id;

            $cart_detail_select = Cart_data_detail::where('id_cart', $id_cart)->get();

            if($cart_detail_select->count() == 0){
                $delete_cart = DB::table('cart')
                ->where('id', $id_cart)
                ->delete();
            }
            return redirect()->back()->with('alert', 'Bạn đã xóa thành công');
        }
        else{
            $cart->removeItem($id);
            if(count($cart->items) > 0){
                Session::put('cart', $cart);
            }
            else{
                Session::forget('cart');
            }
            $cart_detail = Cart_data_detail::where('id_product', $id)->first();
            //$id_cart = $cart_detail->id_cart;

            $delete_cart_detail = DB::table('cart_detail')
            ->where('id_product', $id)
            ->delete();
            $user = Auth::user();
            $id_user = $user->id;

            $cart = Cart_data::where('id_users', $id_user)->first();
            $id_cart = $cart->id;

            $cart_detail_select = Cart_data_detail::where('id_cart', $id_cart)->get();

            if($cart_detail_select->count() == 0){
                $delete_cart = DB::table('cart')
                ->where('id', $id_cart)
                ->delete();
            }
            return redirect()->back()->with('alert', 'Bạn đã xóa thành công');
        }




    }

    public function getSearch(Request $request){
        $product_search = Products::where('name', 'like', '%'.$request->search.'%')
                            ->orWhere('unit_price', '<=', $request->search)

                            ->get();
        $products_count = count($product_search);
        return view('users.layout.page.search', compact('product_search','products_count'));
    }

    public function getLogin(){
        return view('users.layout.page.login');
    }

    public function postLogin(Request $request){
        $this->validate($request, [
            'email'=>'required|email',
            'password' => 'required|min:6|max:20',
        ],
        [
            'email.required' => 'vui lòng nhập email',
            'email.email' => 'Email không đúng định dạng',
            'password.required' => 'vui lòng nhập password',
            'password.min' => 'password ít nhất phải 6 ký tự',
            'password.max' => 'password tối đá được 20 ký tự',
        ]
        );
        $credentials = array('email'=>$request->email,
        'password'=>$request->password
        );

        $credentials=['email'=>$request->email,'password'=>$request->password];
        if(Auth::attempt($credentials)){//The attempt method will return true if authentication was successful. Otherwise, false will be returned.

            return redirect('/')->with('alert', 'Đăng nhập thành công');
        }
        else{
            return redirect()->back()->with('error', 'Đăng nhập thất bại');;
        }
        // return view('users.layout.page.trangchu.master');
    }
    public function getLogout(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->back()->with('alertdangxuat', 'Bạn đã đăng xuất');
    }

    public function getRegister(){
        return view('users.layout.page.register');
    }

    public function postRegister(Request $request){
        $validated = $request->validate([
            'email' => 'unique:users,email',
            'password' => 'min:6|max:20',
            'phone' => 'min:10|max:11',
            'file' => 'mimes:jpg,png,jpeg',
        ],
        [

            'email.unique' => 'email này đã tồn tại',
            'password.min' => 'password tối thiểu 6 ký tự',
            'password.max' => 'password không vượt quá 20 ký tự',
            'phone.min' => 'số điện thoại phải tồn tại 10 số',
            'phone.max' => 'số điện thoại không vượt quá 11 số',
            'file.mimes' => 'Hình ảnh chỉ chấp nhận đuôi .JPG .PNG .JPEG'
        ]

    );
        $file = $request->file('file');
        $name = $file->getClientOriginalName();
        $luu_tru = public_path('front_end/img/user');
        $file->move($luu_tru, $name);

        $data = array();
        $data['full_name'] = $request->full_name;
        $data['email'] = $request->email;
        $data['password'] = Hash::make($request->password);
        $data['phone'] = $request->phone;
        $data['address'] = $request->address;
        $data['date'] = date('Y-m-d');
        $data['image'] = $name;


        $insert = DB::table('users')->insert($data);

        $custommer=$request->email;
        if($custommer!=''){
            $sentData = [
                'title' => 'Chúc mừng bạn đã tạo tài khoản thành công',

            ];
            \Mail::to($request->email)->send(new \App\Mail\SendMailRegister($sentData));

            return redirect()->back()->with('alert', 'Bạn đã đăng ký thành công');
        }
        else{
            return redirect()->back()->with('error', 'Bạn vui lòng kiểm tra email');
        }


    }

    public function getResetPassword(){
        return view('users.layout.page.resetpassword');
    }

    public function postResetPassword(Request $request){
        $email = $request->email;
        $user = User::where('email', $email)->get();

        if($user->count()!=0){
            $sentData = [
                'title' => 'Mật khẩu mới của bạn là:',
                'body' => '123456789'
            ];
            \Mail::to($email)->send(new \App\Mail\SendMailResetPassword($sentData));
            $update = DB::table('users')
            ->where('email', $email)
            ->update(['password' => Hash::make('123456789')]);
            return redirect()->back()->with('alert', 'Mật khẩu mới đã được gửi về Mail vui lòng check Mail của bạn');
        }
        else{
            return redirect()->back()->with('error', 'Mail của bạn không đúng vui lòng kiểm tra lại');
        }

    }

    public function getProductLike(){
        return view('users.layout.page.productlike');
    }

    public function addProductLike($id){
        $user = Auth::user();
        $id_user = $user->id;
        //return redirect()->back()->with('alert', 'Sản phẩm này đã tồn tại trong giỏ hàng');
        $product = Products_like::where('id_product', $id)->get();

        //có user bằng user_id và id_sản phẩm bằng id truyền vào
        $count_product = Products_like::where('id_product', $id)->where('id_users', $id_user)->get();
        if($count_product->count() !=0){
            return redirect()->back()->with('dangerous', 'Sản phẩm này đã được thêm vào mục yêu thích trước đó');
        }
        else{
            $add = new Products_like();
            $add->id_users = $id_user;
            $add->id_product = $id;
            $add->save();
            return redirect()->back()->with('alert', 'Bạn đã thêm sản phẩm yêu thích thành công');
        }



    }

    public function addCart(Request $request, $id){

         //kiểm tra xem có id sản phẩm đó hay k nếu có thù lấy
         $product = Products::find($id);
         //tạo biến old cart ktra xem có session cart chưa nếu có thì lấy session cart đó gắn cho old cart nếu chwua thì null
         $cart = Session::has('cart') ? Session::get('cart') : null;
         if (!$cart) {
             //tạo biến giỏ hàng tạo giỏ hàng mới
             $cart = new Cart($cart);
         }
         // //thêm phần tử vào giỏ hàng
         $cart->add($product, $product->id);
         //gán giỏ hàng vào session cart
         Session::put('cart', $cart);


         $user = Auth::user();
         $id_user = $user->id;
         $cart_data = new Cart_data;
         $cart_data->id_users = $id_user;
         $cart_data->total = $cart->totalPrice;
         $cart_data->save();


         foreach($cart->items as $key=>$value){
             $cart_data_detail = new Cart_data_detail;
             $cart_data_detail->id_cart = $cart_data->id;
             $cart_data_detail->id_product = $key;
             $cart_data_detail->quantity = $value['qty'];
             $cart_data_detail->price = $value['price']/$value['qty'];
             $cart_data_detail->save();
         }
         return redirect()->back()->with('addcart', 'Thêm giỏ hàng thành công');


    }

    public function showCart(){

        $user = Auth::user();
        $id_user = $user->id;

        $bahai = Cart_data::where('id_users', $id_user)->orderBy('id', 'desc')->limit(1)->get();
        foreach($bahai as $xe){
            $total = $xe->total;
            $id_cart = $xe->id;
            $cart_detail = Cart_data_detail::where('id_cart', $id_cart)->get();
            $cart_detail_count = count($cart_detail);

            return view('users.layout.page.cart', compact('cart_detail', 'total', 'cart_detail_count'));
        }
        return view('users.layout.page.cart');


    }

    public function postCounpon(Request $request){

        $coupon_code = $request->name_coupon;
        $coupon = Coupons::where('name_coupon', $coupon_code)->where('status', 1)->first();



        if($coupon != null){
            $valuegiamgia = $coupon->value;
            $id_coupon = $coupon->id;
            return redirect()->back()->with(['magiamgiatrue' => 'true','valuegiamgia' => $valuegiamgia,'idcoupon' => $id_coupon, 'alertmagiamgia' => 'Bạn đã áp dụng mã giảm giá thành công']);
        }
        else{
            return redirect()->back()->with('alertmagiamgia', 'Mã giảm giá không chính xác Hoặc đã được sử dụng vui long kiểm tra lại');
        }


    }

    public function getCkectOut(){
        $user = Auth::user();
        $id_user = $user->id;

        $bahai = Cart_data::where('id_users', $id_user)->orderBy('id', 'desc')->limit(1)->get();
        foreach($bahai as $xe){
            $total = $xe->total;
            $id_cart = $xe->id;
            $cart_detail = Cart_data_detail::where('id_cart', $id_cart)->get();
            $cart_detail_count = count($cart_detail);

            return view('users.layout.page.checkout', compact('cart_detail', 'total', 'cart_detail_count'));
        }

        return view('users.layout.page.checkout');
    }

    public function postCkectOut(Request $request){
        $cart = Session::get('cart');
        $user = Auth::user();
        $id_user = $user->id;
        $validated = $request->validate([
            'phone' => 'min: 10|max: 11',

        ],
        [
            'phone.min' => 'Số điện thoại tối thiểu 10 số',
            'phone.max' => 'số điện thoại không vượt quá 11 số',
        ]
        );
        $check_payment = $request->payment;
       // dd($request->payment);




        $bill = new Bill;
        $bill->id_users = $id_user;
        $bill->id_coupon = $request->idcoupon;
        $bill->name = $request->name;
        $bill->phone = $request->phone;
        $bill->address = $request->address;
        $bill->data_order = date('Y-m-d');

        if ($request->magiamgiatrue  === "true") {
            $totalPrice = $cart->totalPrice + 30000 - $request->valuegiamgia;
            $bill->total = $totalPrice;

            $id_coupon = $request->idcoupon;

        }
        else{
            $totalPrice = $cart->totalPrice + 30000;
            $bill->total = $totalPrice;

            $id_coupon = null;

        }

        $bill->id_coupon = $id_coupon;


        $bill->note = $request->note;

        $bill->save();






        foreach ($cart->items as $key => $value) {
            $bill_detail = new Bill_detail;
            $bill_detail->id_bill = $bill->id;
            $bill_detail->id_product = $key;
            $bill_detail->quantity = $value['qty'];

            $bill_detail->price = ($value['price']/$value['qty']);
            $bill_detail->save();

        }




        if($id_coupon != null){
            $delete_coupons = Coupons::where('id', $id_coupon)->update(['status' => 2]);
        }


        $email = $request->email;

        if($request->magiamgiatrue === 'true'){
            $sentData = [
                'title' => 'Đơn hàng của bạn với mã vận đơn',
                'id' => $bill->id,
                'name' => $request->name,
                'sdt' => $request->phone,
                'address' => $request->address,
                'ghichu' => $request->note,
                'magiamgia' => $request->valuegiamgia,
                'tonggia' => $totalPrice,
            ];
        }
        else{
            $sentData = [
                'title' => 'Đơn hàng của bạn với mã vận đơn',
                'id' => $bill->id,
                'name' => $request->name,
                'sdt' => $request->phone,
                'address' => $request->address,
                'ghichu' => $request->note,
                'magiamgia' => $request->valuegiamgia,
                'tonggia' => $totalPrice,
            ];
        }

        \Mail::to($request->email)->send(new \App\Mail\SendMailCheckout($sentData));

        $cart_select = Cart_data::where('id_users', $id_user)->orderBy('id', 'desc')->get();

        foreach($cart_select as $cart_name){
            $id_cart = $cart_name->id;
            $cart_detail = Cart_data_detail::where('id_cart', $id_cart)->get();
            $delete_cart_detail = DB::table('cart_detail')
            ->where('id_cart', $id_cart)
            ->delete();
            $delete_cart = DB::table('cart')
                   ->where('id', $id_cart)
                   ->delete();
        }

        Session::forget('cart');

        if($request->payment ==2){
            $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
            $vnp_Returnurl = "http://localhost:8000/check-out";
            $vnp_TmnCode = "ELD5COJ7";//Mã website tại VNPAY
            $vnp_HashSecret = "PLEJZFRPDZRFDNDQSRPLONAPUEMFGVRA"; //Chuỗi bí mật
           // $rand = rand(00, 9999);
            $vnp_TxnRef = $bill->id; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
            $vnp_OrderInfo = 'Thanh toasn hoa don';
            $vnp_OrderType = 'billpayment';
            $vnp_Amount = $totalPrice * 100;
            $vnp_Locale = 'vn';
            $vnp_BankCode = 'NCB';
            $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
            //Add Params of 2.0.1 Version

            //Billing

            $inputData = array(
                "vnp_Version" => "2.1.0",
                "vnp_TmnCode" => $vnp_TmnCode,
                "vnp_Amount" => $vnp_Amount,
                "vnp_Command" => "pay",
                "vnp_CreateDate" => date('YmdHis'),
                "vnp_CurrCode" => "VND",
                "vnp_IpAddr" => $vnp_IpAddr,
                "vnp_Locale" => $vnp_Locale,
                "vnp_OrderInfo" => $vnp_OrderInfo,
                "vnp_OrderType" => $vnp_OrderType,
                "vnp_ReturnUrl" => $vnp_Returnurl,
                "vnp_TxnRef" => $vnp_TxnRef,


            );

            if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                $inputData['vnp_BankCode'] = $vnp_BankCode;
            }
            if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
                $inputData['vnp_Bill_State'] = $vnp_Bill_State;
            }

        // //var_dump($inputData);
            ksort($inputData);
            $query = "";
            $i = 0;
            $hashdata = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashdata .= urlencode($key) . "=" . urlencode($value);
                    $i = 1;

                }
                $query .= urlencode($key) . "=" . urlencode($value) . '&';


            }



            $vnp_Url = $vnp_Url . "?" . $query;

            // return redirect()->back()->with('alert', 'Bạn thanh toán thanh');

            if (isset($vnp_HashSecret)) {
                $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//
                $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;

            }
            $returnData = array('code' => '00'
            , 'message' => 'success'
            , 'data' => $vnp_Url);
            $data =array();
            $data['payment'] =2;

            $update = DB::table('bills')->where('id', $bill->id)->update($data);

            if (isset($_POST['redirect'])) {
                header('Location: ' . $vnp_Url);
                die();
            } else {
                echo json_encode($returnData);
            }

            return redirect()->back()->with('alert', 'Bạn đã đặt hàng thành công');

        }


        return redirect()->back()->with('alert', 'Bạn đã đặt hàng thành công');



    }

    public function vnpay_payment(){


        // $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        // $vnp_Returnurl = "http://localhost:8000/check-out";
        // $vnp_TmnCode = "ELD5COJ7";//Mã website tại VNPAY
        // $vnp_HashSecret = "PLEJZFRPDZRFDNDQSRPLONAPUEMFGVRA"; //Chuỗi bí mật

        // $vnp_TxnRef = '123'; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        // $vnp_OrderInfo = 'Thanh Toán Đơn Hàng';
        // $vnp_OrderType = 'billpayment';
        // $vnp_Amount = 20000 * 100;
        // $vnp_Locale = 'vn';
        // $vnp_BankCode = 'NCB';
        // $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
        // //Add Params of 2.0.1 Version
        // // $vnp_ExpireDate = $_POST['txtexpire'];
        // //Billing


        // $inputData = array(
        //     "vnp_Version" => "2.1.0",
        //     "vnp_TmnCode" => $vnp_TmnCode,
        //     "vnp_Amount" => $vnp_Amount,
        //     "vnp_Command" => "pay",
        //     "vnp_CreateDate" => date('YmdHis'),
        //     "vnp_CurrCode" => "VND",
        //     "vnp_IpAddr" => $vnp_IpAddr,
        //     "vnp_Locale" => $vnp_Locale,
        //     "vnp_OrderInfo" => $vnp_OrderInfo,
        //     "vnp_OrderType" => $vnp_OrderType,
        //     "vnp_ReturnUrl" => $vnp_Returnurl,
        //     "vnp_TxnRef" => $vnp_TxnRef


        // );

        // if (isset($vnp_BankCode) && $vnp_BankCode != "") {
        //     $inputData['vnp_BankCode'] = $vnp_BankCode;
        // }
        // if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
        //     $inputData['vnp_Bill_State'] = $vnp_Bill_State;
        // }

        // //var_dump($inputData);
        // ksort($inputData);
        // $query = "";
        // $i = 0;
        // $hashdata = "";
        // foreach ($inputData as $key => $value) {
        //     if ($i == 1) {
        //         $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
        //     } else {
        //         $hashdata .= urlencode($key) . "=" . urlencode($value);
        //         $i = 1;
        //     }
        //     $query .= urlencode($key) . "=" . urlencode($value) . '&';
        // }

        // $vnp_Url = $vnp_Url . "?" . $query;
        // if (isset($vnp_HashSecret)) {
        //     $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//
        //     $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        // }
        // $returnData = array('code' => '00'
        //     , 'message' => 'success'
        //     , 'data' => $vnp_Url);
        //     if (isset($_POST['redirect'])) {
        //         header('Location: ' . $vnp_Url);
        //         die();
        //     } else {
        //         echo json_encode($returnData);
        //     }
        //     // vui lòng tham khảo thêm tại code demo


    }

    public function getBlog(){
        $blog = Blog::all();

        return view('users.layout.page.blog', compact('blog'));
    }

    public function blog_detail($id){
        $blog_detail = Blog::where('id', $id)->get();
        // dd($blog_detail);
        return view('users.layout.page.blog_detail', compact('blog_detail'));
    }

    public function RaiseProduct($id){
        dd($id);
    }



}
