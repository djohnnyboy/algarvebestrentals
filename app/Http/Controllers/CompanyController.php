<?php

namespace App\Http\Controllers;

use Auth;
use App\Company;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Validator;
use App\Http\Requests\CompanyRequest;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::check()) {
            $companies = Company::all();
            return view('companies.index',['companies' => $companies]);
        }
        return view('auth.login');  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (Auth::check()) {
            return view('companies.create');
        }
        return view('auth.login');  
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CompanyRequest $request)
    {
        if (Auth::check()) {
           
            $company = Company::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'phone' => $request->input('phone'),
                'nif' => $request->input('nif'),
                'active' => $request->input('active'),
            ]);
           
            if ($company) {
               if (View::exists('companies.index')) {
                   return redirect()->route('companies.index')
                            ->with('success','Company created succesfully');
               }
            }
        }
        return view('auth.login');  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function show(Company $company)
    {
        if (Auth::check()) {
            $company = Company::findOrFail($company->id);
            return view('companies.show',['company' => $company]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function edit(Company $company)
    {
        if (Auth::check()) {
            $company = Company::findOrFail($company->id);
            return view('companies.edit',['company' => $company]);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function update(CompanyRequest $request, Company $company)
    {
        if (Auth::check()) {
           
            $company = Company::where('id', $company->id)
                    ->update([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'phone' => $request->input('phone'),
                'nif' => $request->input('nif'),
                'active' => $request->input('active'),
            ]);
          

            if ($company) {
               if (View::exists('companies.index')) {
                   return redirect()->route('companies.index')
                            ->with('success','Company edit successfully');
               }
            }
        }
        return view('auth.login'); 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Company $company)
    {
        if (Auth::check() ) { 
            $company = Company::findOrFail($company->id);
            if ($company->delete()) {
                if (View::exists('companies.index')) {
                    return redirect()->route('companies.index')
                        ->with('success','Company deleted with success');
                }       
            }
            return back()->withInput()
                ->with('errors', 'Company could not be deleted');
        }
        return view('auth.login'); 
    }
}
