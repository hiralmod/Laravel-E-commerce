<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    use commonTrait;
    public function index() 
    {
        if(Auth::guard('admin')->check()) {
            $user = Auth::guard('admin')->user();

            if(isset($user) && !empty($user)) {
                if($user->role == "admin") {
                    return redirect()->route('admin.dashboard');
                }
            }
        }
        return $this->adminFile('auth.login');
    }

    public function checkLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()){
            return redirect()->back()->withErrors($validator)->withInput();
        }
        
        if(Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password]))
        {
            $user = Auth::guard('admin')->user();

            if(isset($user) && !empty($user)) {
                if($user->role == "admin") {
                    Session::flash('success_message', 'Login Successfully!');
                    return redirect()->route('admin.dashboard');
                } else {
                    Session::flash('error_message', "Entered email address or password incorrect.");
                    return redirect()->back()->withInput();
                }
            }
        } else {
            Session::flash('error_message', "Entered email address or password incorrect.");
            return redirect()->back()->withInput();
        }
    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
}
