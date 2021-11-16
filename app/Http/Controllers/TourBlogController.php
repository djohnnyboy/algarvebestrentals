<?php

namespace App\Http\Controllers;

use App\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

class TourBlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (View::exists('tours.index')) {
            $posts = Blog::all();
            return view('tours.index', ['posts' => $posts]);      
        }
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Blog::findOrFail($id);
        return view('tours.show', ['post' => $post]);
    }

}
