<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Product;

use App\Models\User;

use App\Models\Cart;

use App\Models\Order;

use Illuminate\Support\Facades\Auth;

use function Pest\Laravel\get;

class HomeController extends Controller
{
    public function index()
    {
        $user =  User::where('usertype', 'user')->get()->count();
        $product = Product::all()->count();
        $order = Order::all()->count();
        $deliverd = Order::where('status', 'Delivered')->get()->count();

        $orders = Order::all();
        $products = [];

        for ($i = 0; $i < sizeof($orders); $i++) {
            $products[$i] = Product::where([['id', $orders[$i]->product_id]])->first();
        }

        $total = 0;

        for ($i = 0; $i < sizeof($products); $i++) {
            $temp = floatval(str_replace('.', '', $products[$i]->price)) * $orders[$i]->quantity; 
            $total += $temp;
        }

        $total = number_format(doubleval(str_replace('.', '', $total)), 0, '.', '.');

        return view('admin.index', compact('user', 'product', 'order', 'deliverd', 'total'));
    }

    public function home()
    {
        $product = Product::all();

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.index', compact('product', 'count'));
    }

    public function login_home()
    {
        $product = Product::all();

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.index', compact('product', 'count'));
    }

    public function product_details($id)
    {
        $data = Product::find($id);

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.product_details', compact('data', 'count'));
    }

    public function decrease_cart($id)
    {
        $user = Auth::user();
        $user_id = $user->id;

        // Check if the product is already in the cart
        $cart = Cart::where('user_id', $user_id)
            ->where('product_id', $id)
            ->first();

        if ($cart) {
            // Product is already in the cart, update quantity

            if ($cart->quantity == 1) {
                // return url(`delete_cart/${$id}`);
                // return url('delete_cart', $id);
                $this->delete_cart($cart->id);
            } else {
                $cart->quantity -= 1;
                $cart->save();
            }
        }

        return redirect()->back();
    }

    public function add_cart($id)
    {
        $user = Auth::user();
        $user_id = $user->id;

        // Check if the product is already in the cart
        $cart = Cart::where('user_id', $user_id)
            ->where('product_id', $id)
            ->first();

        if ($cart) {
            // Product is already in the cart, update quantity
            $cart->quantity += 1;
            $cart->save();
        } else {
            // Product is not in the cart, add new entry
            $cart = new Cart;
            $cart->user_id = $user_id;
            $cart->product_id = $id;
            $cart->quantity = 1; // Initial quantity
            $cart->save();
        }

        return redirect()->back();
    }


    public function mycart()
    {

        if (Auth::id()) {
            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();

            $cart = Cart::where('user_id', $userid)->get();

            $quantities = [];
            for ($i = 0; $i < sizeof($cart); $i++) {
                $quantities[$i] = $cart[$i]['quantity'];
            }
        }

        return view('home.mycart', compact('count', 'cart', 'quantities'));
    }

    public function delete_cart($id)
    {
        $data = Cart::find($id);
        $data->delete();
        return redirect()->back();
    }

    public function comfirm_order(Request $request)
    {
        $name = $request->name;
        $address = $request->address;
        $phone = $request->phone;
    
        $userid = Auth::user()->id;
    
        $cart = Cart::where('user_id', $userid)->get();
    
        foreach ($cart as $carts) {
            $order = new Order;
            $order->name = $name;
            $order->rec_address = $address;
            $order->phone = $phone;
            $order->user_id = $userid;
            $order->product_id = $carts->product_id;
            $order->quantity = $carts->quantity; // Include quantity here
            $order->save();
        }
    
        // Clear cart after placing the order
        Cart::where('user_id', $userid)->delete();
    
        return redirect()->back()->with('success', 'Product ordered successfully!');
    }
    

    public function myorders()
    {

        $user = Auth::user()->id;

        $count = Cart::where('user_id', $user)->get()->count();

        $order = Order::where('user_id', $user)->get();

        return view('home.order', compact('count', 'order'));
    }

    public function shop()
    {
        $product = Product::all();

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.shop', compact('product', 'count'));
    }

    public function why()
    {
        $product = Product::all();

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.why', compact('count'));
    }

    public function testimonial()
    {
        $product = Product::all();

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.testimonial', compact('count'));
    }

    public function contact()
    {
        $product = Product::all();

        if (Auth::id()) {

            $user = Auth::user();

            $userid = $user->id;

            $count = Cart::where('user_id', $userid)->count();
        } else {
            $count = '';
        }

        return view('home.contact', compact('count'));
    }
}
