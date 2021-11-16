<?php

namespace App\Http\Controllers;

use Auth;
use Image;
use Validator;
use App\Blog;
use Illuminate\Http\Request;
use App\Http\Requests\BlogRequest;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Exception\NotReadableException;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (View::exists('blog.index')) {
            $posts = Blog::all();
            return view('blog.index', ['posts' => $posts]);      
        }   
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (Auth::check()) {
            return view('blog.create');
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BlogRequest $request)
    {
        if (Auth::check()) { 
            $filename = $request->file('image');
            $image_resize = Image::make($filename)->resize(312, 105)->save($filename);
            $path = $request->file('image')->store('public/posts'); 

            $post = Blog::create([
                'title' => $request->input('title'),
                'body' => $request->input('body'),
                'image' => $path,
                'coordinates' => $request->input('coordinates')
            ]);

            if ($post) {
                if (View::exists('blog.index')) {
                    return view('blog.index')->with('success', 'Post created successfully.');
                }
            }
            return back()->withInput()->with('errors', 'Error creating new Blog Post');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function edit(Blog $blog)
    {
        if (Auth::check()) {
            $post = Blog::findOrFail($blog->id);
            return view('blog.edit', ['post' => $post]);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function update(BlogRequest $request, Blog $blog)
    {
        if (Auth::check() ) {
           
            $postsUpdate = Blog::where('id', $blog->id)
                    ->update([
                        'title' => $request->input('title'),
                        'body' => $request->input('body'),
                        'coordinates' => $request->input('coordinates')
                    ]);
            if ($request->hasFile('image')) {
                $filename = $request->file('image');
                $image_resize = Image::make($filename)->resize(312, 105)->save($filename);
                $path = $request->file('image')->store('public/posts'); 

                $postsUpdate = Blog::where('id', $blog->id)
                            ->update([
                                'image' => $path
                            ]);
            }
            if ($postsUpdate) {
                if (View::exists('blog.index')) {
                    return redirect()->route('blog.index')
                        ->with('success','Post successfully updated');
                }
            }        
            return back()->withInput()->with('errors', 'Post nao fez update');
        
        }
        return view('auth.login');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blog $blog)
    {
        if (Auth::check() ) { 
            $post = Blog::findOrFail($blog->id);
            if ($post->delete()) {
                if (View::exists('blog.index')) {
                    return redirect()->route('blog.index')
                        ->with('success','Post deleted with success');
                }       
            }
            return back()->withInput()->with('errors', 'Post could not be deleted');
        }
        return view('auth.login'); 
    }
}
