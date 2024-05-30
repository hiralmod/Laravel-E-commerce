<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    use commonTrait;
    public function index() {
        if(Auth::guard('website')->check()) {
            $user = Auth::guard('website')->user();

            if(isset($user) && !empty($user)) {
                if($user->role == "user") {
                    return redirect()->route('website.home');
                }
            }
        } 
        return $this->webFile('auth.login');
    }

    public function webLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()){
            return redirect()->back()->withErrors($validator)->withInput();
        }
        
        if(Auth::guard('website')->attempt(['email' => $request->email, 'password' => $request->password]))
        {
            $user = Auth::guard('website')->user();
            if(isset($user) && !empty($user)) {
                if($user->role == "user") {
                    Session::flash('success_message', 'Login Successfully!');
                    return redirect()->route('website.home');
                } else {
                    Session::flash('error_message', 'Please Register first');
                    return redirect()->route('login');
                }
            }
        } else {
            Session::flash('error_message', "Entered email address or password incorrect.");
            return redirect()->back()->withInput();
        }
    }

    public function signup() 
    {
        return $this->webFile('auth.register');
    }
    public function register(Request $request)
    {
        $post_field = $request->all();
        $user = User::where('email',$post_field['email'])->first();
        if(empty($user)) {
            $data = new User();
            $data->name = $request['name'];
            $data->email = $request['email'];
            $data->phone_number = $request['phone_number'];
            $data->password = $request['password'];
            $data->role = "user";
            $data->status = "active";
            $data->save();
            return redirect()->route('login');
        } else {
            Session::flash("error_message","Already Signed Up, Please now Log in");
            return redirect()->back()->withInput();
        }
    }

    public function logout()
    {
        Auth::guard('website')->logout();
        return redirect()->route('website.home');
    }
}
