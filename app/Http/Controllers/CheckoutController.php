<?php

namespace App\Http\Controllers;

use App\Category;
use App\Order;
use App\Product;
use App\OrderProduct;
use App\Mail\OrderPlaced;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\CheckoutRequest;
use Gloudemans\Shoppingcart\Facades\Cart;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Cartalyst\Stripe\Exception\CardErrorException;
use Auth;

class CheckoutController extends Controller
{

    protected $cart;

    public function __construct()
    {
        $this->cart = Cart::instance('default');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        if (!$request->has('step')) {
            $step = 1;
        } else {
            $step = (int) $request->step;
        }

        if ($step > 4 && !auth()->user()) {
            return redirect()->route('login');
        }

        $cartItem = null;
        $day_products = [];

        $cartItem = $this->getCurrentCartItem();
        $current_day = date('Y-m-d');

        if ($step == 3) {
            $day_products = [
                [
                    'date' =>  date("d-m", strtotime("+2 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+2 day", strtotime($current_day))))),
                    'products' =>  Product::groupProductByMeals(date("Y-m-d", strtotime("+2 day", strtotime($current_day))))
                ],
                [
                    'date' => date("d-m", strtotime("+3 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+3 day", strtotime($current_day))))),
                    'products' => Product::groupProductByMeals(date("Y-m-d", strtotime("+3 day", strtotime($current_day))))
                ],
                [
                    'date' => date("d-m", strtotime("+4 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+4 day", strtotime($current_day))))),
                    'products' => Product::groupProductByMeals(date("Y-m-d", strtotime("+4 day", strtotime($current_day))))
                ],
                [
                    'date' => date("d-m", strtotime("+5 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+5 day", strtotime($current_day))))),
                    'products' => Product::groupProductByMeals(date("Y-m-d", strtotime("+5 day", strtotime($current_day))))
                ],
                [
                    'date' => date("d-m", strtotime("+6 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+6 day", strtotime($current_day))))),
                    'products' => Product::groupProductByMeals(date("Y-m-d", strtotime("+6 day", strtotime($current_day))))
                ],
                [
                    'date' => date("d-m", strtotime("+7 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+7 day", strtotime($current_day))))),
                    'products' => Product::groupProductByMeals(date("Y-m-d", strtotime("+7 day", strtotime($current_day))))
                ],
                [
                    'date' => date("d-m", strtotime("+8 day", strtotime($current_day))),
                    'day' => date('D', strtotime(date("Y-m-d", strtotime("+8 day", strtotime($current_day))))),
                    'products' => Product::groupProductByMeals(date("Y-m-d", strtotime("+8 day", strtotime($current_day))))
                ]
            ];

            if ($cartItem && isset($cartItem->options)) {
                foreach ($day_products as &$d) {

                    if ($cartItem->options['days'] == 5) {
                        if (in_array($d['day'], ['Sat', 'Sun'])) {
                            $d['disabled'] = true;
                        }
                    }

                    if ($cartItem->options['days'] == 6) {
                        if (in_array($d['day'], ['Sun'])) {
                            $d['disabled'] = true;
                        }
                    }
                }
            }
        }

        if($step == 4){
            $this->addShipping();
            if(!session()->has('user_data')){
                $this->addUserData(Auth::user()->toArray());
            }
        }

        return view('checkout.checkout')->with([
            'step' => $step,
            'categories' => Category::get(),
            'cartItem' => $cartItem,
            'day_products' => $day_products
        ]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CheckoutRequest $request)
    {
        try {
            $order = $this->addToOrdersTables($request, null);

            // Mail::send(new OrderPlaced($order));
            // decrease the quantities of all the products in the cart
            // $this->decreaseQuantities();

            $this->cart->destroy();

            session()->forget('coupon');
            session()->forget('user_data');
            session()->forget('coupon');
            session()->forget('shipping');
            session()->forget('draft_cart');

            return redirect()->route('confirmation.index')->with('success_message', 'Thank you! Your payment has been successfully accepted!');

        } catch (CardErrorException $e) {
            $this->addToOrdersTables($request, $e->getMessage());
            return back()->withErrors('Error! ' . $e->getMessage());
        }
    }

    protected function addToOrdersTables($request, $error)
    {
        // Insert into orders table
        $user_data = session()->get('user_data');
        $coupon = session()->get('coupon');
        $shipping = session()->get('shipping');
        $shipping['option'] = $request->shipping_option;

        $cart_discount = 0;

        $order_data = [
            'user_id' => auth()->user() ? auth()->user()->id : null,
            'billing_email' => $user_data['email'],
            'billing_name' => $user_data['name'] . isset($user_data['lastname']) ?? '',
            'billing_address' => $user_data['address'],
            'billing_province' => $user_data['district_id'],
            'billing_phone' => $user_data['phone'],

            'billing_discount' => 0,
            'billing_discount_code' => '',
            'billing_subtotal' =>  Cart::subtotal(),
            'billing_total' => Cart::total(),
            'shipped' => json_encode($shipping),
            'status' => 'O',
            'error' => $error,
        ];

        // Insert into order_product table
        foreach (Cart::content() as $cartItem) {

            $options = $cartItem->options;

            $cart_discount += $options['discount'];
    
            // OrderProduct::create([
            //     'order_id' => $order->id,
            //     'product_id' => $item->model->id,
            //     'quantity' => $item->qty,
            // ]);
        }

        $order_data['billing_discount'] = $cart_discount;
        $order_data['payment_gateway'] = $request->payment_method;

        if($coupon && isset($coupon['price'])){
            $order_data['billing_discount'] += $coupon['price'];
            $order_data['billing_total'] -= $coupon['price'];
            $order_data['billing_discount_code'] = $coupon['code'];
        }

        $order_data = Order::create($order_data);

        return $order_data;
    }

    protected function decreaseQuantities()
    {
        foreach (Cart::content() as $item) {
            $product = Product::find($item->model->id);

            $product->update(['quantity' => $product->quantity - $item->qty]);
        }
    }

    protected function productsAreNoLongerAvailable()
    {
        foreach (Cart::content() as $item) {
            $product = Product::find($item->model->id);
            if ($product->quantity < $item->qty) {
                return true;
            }
        }

        return false;
    }

    public function addToCart(Request $request)
    {
        $category = Category::where('id', $request->category_id)->first();

        if (!$request->has('category_id') && empty($category)) {
            return redirect()->route('checkout.index');
        }

        session()->put('draft_cart', [
            'id' => $category->id,
            'name' => $category->name,
            'qty' => 1,
            'price' => $category->price,
            'options' => []
        ]);

        return redirect()->route('checkout.index', ['step' => 2]);
    }

    public function addOptions(Request $request)
    {

        $cartItem = $this->getCurrentCartItem();
        
        $price = $cartItem['price'];

        $options = $request->options ?? [];

        if (!empty($options)) {
            $count_meal = count($options['meal']);
            $count_day = (int) $options['days'];
            $count_week = (int) $options['meal_of_week'];
            $total_discount = 0;

            $extra_services = config('constants.extra_services');
            $sizes = config('constants.sizes');

            foreach ($options['extra'] as $key => $value) {
                if ($value == 'Y') {
                    $price += $extra_services[$key];
                }
            }

            if ($options['size'] == 'M') {
                $price += $sizes['M'];
            }

            $total_price = $price * $count_meal * $count_day * $count_week;


            if ($count_week == 4) {
                $total_discount = $total_price * 0.1;
                $total_price = $total_price * 0.9;
            }

            $options['discount'] = $total_discount;
        }

        $cartItem['price'] = $total_price;
        $cartItem['options'] = $options;
        
        if($cartItem['price'] > 0){
            $this->setCurrentCartItem($cartItem);
        }
        return redirect()->route('checkout.index', ['step' => 3]);
    }

    public function addProducts(Request $request)
    {
        $cartItem =  $this->getCurrentCartItem();

        $cartItem['options']['product_of_meals'] = $request->options['meals'];

        $this->setCurrentCartItem($cartItem , true);

        return redirect()->route('checkout.index', ['step' => 4]);
    }

    public function addShipping()
    {
        $user = auth()->user();

        if ($user && $user->shipping && $user->shipping->price) {
            session()->put('shipping', [
                'shipping_id' => $user->shipping->id,
                'price' => $user->shipping->price
            ]);
        }

        return false;
    }

    /**
     * Get current CartItem draft from session
     * 
     * @param string $attr index of array from session
     *  
     * @return array $draft_cart;
     */

    public function getCurrentCartItem($attr = null)
    {
        if($attr){
            return session()->get('draft_cart')[$attr];
        }else{
            return session()->get('draft_cart');
        }
    }

    /**
     * Set cart Item to session 
     * 
     * @param  array $cartItem
     * @param boolean $save // true => add to cart , false => only on session
     * 
     */
    public function setCurrentCartItem($cartItem , $save = false)
    {
        if($save){
            $cartItem = $this->cart->add([
                'id' => $cartItem['id'],
                'name' => $cartItem['name'],
                'qty' => 1,
                'price' => $cartItem['price'],
                'options' => $cartItem['options']
            ])->associate('App\Category');

        }else{
            return session()->put('draft_cart', $cartItem);
        }
    }

    public function addUserData($user_data)
    {
        session()->put('user_data', $user_data);
    }

    public function addPayment(Request $request)
    {

    }

    public function addCoupon()
    {

    }

    public function updateUserdata(Request $request)
    {

        if(!empty($request->user_data)){
            session()->put('user_data',$request->user_data);
        }
        
        return redirect()->route('checkout.index',['step' => 4]);
    }
}
