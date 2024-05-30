<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Product;
use App\Trait\commonTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    use commonTrait;
    public function cart()
    {
        if(Auth::guard('website')->check()) {
            $data['cart'] = Cart::with('products')->where('user_id',Auth::guard('website')->user()->id)->whereNull('deleted_at')->whereNull('order_id')->get();
            $data['order'] = Order::where('user_id',Auth::guard('website')->user()->id)->where('order_status', "Pending")->first();
            return $this->webFile('cart',$data);
        }
        return redirect()->route('login');
    }
    public function cart_products(Request $request)
    {
        $data = $request->all();
        if(Auth::guard('website')->check()) {
            $user = Auth::guard('website')->user();
            if(isset($user) && !empty($user)) {
                if($user->role == "user") {
                    $user_id =  Auth::guard('website')->user()->id;
                    $product = Product::with('category')->with('subcategory')->where('status',1)->where('deleted_at', NULL)->where('id',$data['product_id'])->first();
                    $cart_data = Cart::with('orders')->where('user_id', $user_id)->where('product_id', $product['id'])->whereNull('deleted_at')->whereNull('order_id')->first();
    
                    if(!empty($cart_data) && isset($cart_data)) {
                        $qunatity = $cart_data['quantity'];
                        $total = $data['quantity'] + $qunatity;
                        $cart_data['quantity'] = $total;
                        $cart_data['total'] = $total * $cart_data['price'];
                        $cart_data->update();
                    } else {
                        $cart = new Cart();
                        $cart->user_id = $user_id;
                        $cart->product_id = $data['product_id'];
                        $cart->name = $product['name'];
                        $cart->quantity = $data['quantity'];
                        $cart->price = $product['price'];
                        $cart->total = $product['price'] * $data['quantity'];
                        $cart->profile_picture = $product['profile_picture'];
                        $cart->save();
                    }

                    $final_total = 0;
                    $cart_data_row = Cart::with('orders')->where('user_id', $user_id)->whereNull('deleted_at')->whereNull('order_id')->get();
                    
                    if(!empty($cart_data_row)) {
                        foreach($cart_data_row as $row) 
                        {
                            $total = $row['price'] * $row['quantity'];
                            $final_total = $final_total + $total;
                        }
                    }

                    $order_data = Order::where('user_id', $user_id)->where("order_status", "Pending")->first();
    
                    if(!empty($order_data['user_id']) && $order_data['user_id'] == $user_id) {
                        $order_data['sub_total'] = $final_total;
                        $order_data['shipping_charge'] = 10;
                        $order_data['total'] = $final_total + 10;
                        $order_data->update();
                    } else {
                        $order = new Order;
                        $order->user_id = $user_id;
                        $order->sub_total =  $total;
                        $order->shipping_charge = 10;
                        $order->total = $total + 10;
                        $order->order_status = "Pending";
                        $order->save();
                    }
                    
                    return response()->json(['status' => true, 'message' => 'Product added to cart successfully!']);
                } else {
                    return response()->json(['status' => false, 'message' => 'First Login Please!']);
                }
            } else {
                return response()->json(['status' => false, 'message' => 'First Login Please!']);
            }
        } else {
            return response()->json(['status' => false, 'message' => 'First Login Please!']);
        }
    }

    public function change_quantity(Request $request)
    {
        $data = $request->all();
        $user_id = Auth::guard('website')->user()->id;
        $cart = Cart::where('user_id', $user_id)->where('product_id', $data['product_id'])->whereNull('deleted_at')->first();
        $cart['quantity'] = (int)$data['quantity'];
        $cart['total'] = (int)$data['quantity'] * (int)$cart['price'];
        $cart->update();
        
        $cart_data = Cart::where('user_id', $user_id)->whereNull('deleted_at')->get();
        $order = Order::where('user_id',$user_id)->where('order_status', "Pending")->first();
        $final_total = 0;
        foreach($cart_data as $row) 
        {
            $total = $row['price'] * $row['quantity'];
            $final_total = $final_total + $total;
        }

        if(!empty($order['user_id']) && $order['user_id'] == $user_id) {
            if($order['order_status'] == "Pending") {
                $order['sub_total'] = $final_total;
                $order['shipping_charge'] = 10;
                $order['total'] = $final_total + 10;
                $order->update();
            } 
        }
        $cart_total['cart_product_total'] = $cart['total'];
        $cart_total['cart_sub_total'] = $order['sub_total'];
        $cart_total['cart_total'] = $order['total'];
        return response()->json(['status' => true, 'message' => 'Cart Data Changed Successfully!', 'data' => $cart_total]);
    }

    public function remove_cart_items(Request $request)
    {
        $data = $request->all();
        $user_id = Auth::guard('website')->user()->id;
        $cart = Cart::where('user_id', $user_id)->where('product_id', $data['product_id'])->whereNull('deleted_at')->first();
        $cart['deleted_at'] = Carbon::now();
        $cart->update();

        $cart_data = Cart::where('user_id', $user_id)->whereNull('deleted_at')->get();
        $order = Order::where('user_id',$user_id)->where('order_status', "Pending")->first();
        $final_total = 0;
        foreach($cart_data as $row) 
        {
            $total = $row['price'] * $row['quantity'];
            $final_total = $final_total + $total;
        }

        if(!empty($order['user_id']) && $order['user_id'] == $user_id) {
            if($order['order_status'] == "Pending") {
                $order['sub_total'] = $final_total;
                $order['shipping_charge'] = 0;
                $order['total'] = $final_total + 0;
                $order->update();
            } 
        }

        $cart_total['cart_sub_total'] = $order['sub_total'];
        $cart_total['cart_shipping_charge'] = $order['shipping_charge'];
        $cart_total['cart_total'] = $order['total'];
        return response()->json(['status' => true, 'message' => 'Cart Item Removed Successfully!','data' => $cart_total]);
    }

    public function checkout(Request $request)
    {
        $data = $request->all();
        $order_id = $data['id'];
        $user_id = Auth::guard('website')->user()->id;
        $order_data = Order::where('id', $order_id)->where('user_id',$user_id)->where('order_status', "Pending")->whereNull('order_date')->first();
        if($order_data) {
            $order_data['order_number'] = random_int(1000000, 9999999);
            $order_data['order_date'] = Carbon::now();
            $order_data->update();
        }

        $cart_data =  Cart::where('user_id',$user_id)->whereNull('deleted_at')->whereNull("order_id")->get();
        if(!empty($cart_data)) {
            foreach($cart_data as $row) 
            {
                $row['order_id'] = $order_id;
                $row->update();
            }
        }
        return response()->json(['status' => true, 'message' => 'Checkout Successfully!']);
    }

    public function payment()
    {
        $user_id = Auth::guard('website')->user()->id;
        $data['order'] = Order::where('user_id',$user_id)->where('order_status', "Pending")->first();
        return $this->webFile('payment',$data);
    }

    public function card_payment(Request $request)
    {
        $data = $request->all();
        $user_id = Auth::guard('website')->user()->id;
        $order= Order::where('user_id',$user_id)->where('order_status', "Pending")->where('id', $data['order_id'])->first();
        $order['address'] = $data['street'] . " " . $data['city'] . " " . $data['zip_code'] . " " . $data['state'] . " " . $data['country'];
        $order['order_status'] = "Received";
        $order->update();

        $payment_data = Payment::where('user_id', $user_id)->where('order_id', $data['order_id'])->first();

        if(empty($payment_data)) {
            $payment = new Payment();
            $payment->order_id = $data['order_id'];
            $payment->user_id = $user_id;
            $payment->holder_name = $data['holder_name'];
            $payment->card_number = $data['card_number'];
            $payment->expiry_date = $data['expiry_date'];
            $payment->cvv = $data['cvv'];
            $payment->save();
        }
        return response()->json(['status' => true, 'message' => 'Order has been placed!!']);
    }

    public function order_place()
    {
        return $this->webFile('order_placed');
    }
}