<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Product;
use App\Category;

class ApiController extends Controller
{

    public function getMeals(Request $request)
    {
        $product_categoires = Category::get()->toArray();
        // $products = Product::get();

        $my_date = date('Y-m-d'); 
        $week = date("W", strtotime($my_date)); // get week
        $y =    date("Y", strtotime($my_date)); // get year

        $first_date =  strtotime("+2 day", strtotime($my_date)); //first date 
 
        // Get date of week
        $date_in_weeks = Product::getGroupProductforWeeks($first_date);
        
        foreach($product_categoires as & $category){
            if($request->type == 'day'){
                foreach($date_in_weeks as $key => $day){
                    $category['products'][$key]['item'] = Product::join('category_product', 'category_product.product_id', '=', 'products.id')->where('category_product.category_id', $category['id'])->where('sale_at',$day['fulldate'])->get();
                    $category['products'][$key]['date'] = $day['date'];
                    $category['products'][$key]['day'] = $day['day'];
                } 
            }else{
                $category['products'] = Product::join('category_product', 'category_product.product_id', '=', 'products.id')->where('category_product.category_id', $category['id'])->get();
            }
        }

        return $this->successResponse([
            'categories' => $product_categoires
        ],'', 201); 
    }

    public function checkPhone(Request $request)
    {
        $user = User::where('phone', '=', $request->phone)->first();

        return $this->successResponse(['is_exist' => $user ? true : false , 'phone' => $request->phone],'', 201); 
    }


}
