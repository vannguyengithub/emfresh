<?php

namespace App\Http\Controllers;

use App\Product;
use Illuminate\Http\Request;
use App\Testimonial;
use App\Advise;

use TCG\Voyager\Models\Category as PostCategory;
use TCG\Voyager\Models\Post;

class LandingPageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::where('featured', true)->take(8)->inRandomOrder()->get();
        
        $testimonials = Testimonial::published()->take(8)->orderBy('created_at')->get();

        $faqs_ids = PostCategory::where('parent_id' , 2)->get()->pluck('id');

        $faqs = Post::published()->take(4)->whereIn('category_id',$faqs_ids)->orderBy('created_at')->get();

        return view('home')->with([
            'products' => $products,
            'testimonials' => $testimonials,
            'faqs' => $faqs
        ]);
    }

    public function fromAdvice(Request $request)
    {
        $type_input = $this->email_phone($request->email_phone);

        if( $type_input == 'phone' || $type_input == 'email' ){
            $advise = new Advise;
            $advise->email_phone = $request->email_phone;
            $advise->save();
            
            return view('home');
        }
        
    }

    // Check type input
    public function email_phone($email_phone)
    {
        $value_input = $email_phone;

        if(is_numeric($value_input)){
            $field = 'phone';
        } elseif (filter_var($value_input, FILTER_VALIDATE_EMAIL)) {
            $field = 'email';
        } else {
            $field = 'another';
        }

        request()->merge([$field => $value_input]);

        return $field;
    }
}
