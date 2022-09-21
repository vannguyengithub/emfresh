<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function edit()
    {
        return view('profiles.my_profile')->with('user', auth()->user());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        if($request->has('password')){
            $request->validate([
                'password' => 'required|string|min:6|confirmed'
            ]);
        }else{
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users,email,'.auth()->id(),
                'phone' => 'required|string|max:15|unique:users,phone,'.auth()->id(),
                'address' => 'required|string|max:255',
                // 'password' => 'sometimes|nullable|string|min:6|confirmed',
            ]);
        }
        
        $user = auth()->user();

        $input = $request->except('password','password_confirmation');

        if (!$request->filled('password')) {
            
            $user->fill($input)->save();

            return back()->with('success_message', 'Cập nhật hồ sơ thành công');
        }

        $user->password = bcrypt($request->password);

        $user->fill($input)->save();

        
        return back()->with('success_message', 'Cập nhật mật khẩu thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function setting()
    {
        return view('profiles.my_setting')->with('user', auth()->user());;
    }

    public function updateSetting(Request $request)
    {
        $request->validate([
            'input_name' => 'required',
            'checked' => 'required',
        ]);

        $input_name = $request->input_name;
        $user = Auth::user();
        
        $user->$input_name = $request->checked == "true" ? 'Y' : '';
        
        $user->save();
        return response()->json();
    }
}
