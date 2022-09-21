<?php

namespace App\Http\Controllers;

use App\Faq;
use TCG\Voyager\Models\Category as PostCategory;
use TCG\Voyager\Models\Post;

use Illuminate\Http\Request;

class FaqController extends Controller
{
    public function index(Request $request)
    {
        $faqs_cat = PostCategory::where('parent_id' , 2)->get();

        return view('faqs' , compact('faqs_cat'));
    }

    public function search(Request $request)
    {   
        $posts = Post::where('title','like','%'.$request->keyword.'%')->get();

        return view('components.ajaxs.faq_content' , compact('faqs_cat'));
    }
}
