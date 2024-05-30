<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    use commonTrait;
    public function index() {
        return $this->adminFile('dashboard');
    }

    public function myProfile(Request $request) 
    {
        $id = Auth::guard('admin')->user()->id;

        if($request->all())
        {
            $data = $request->input();
            if($file = $request->hasFile('profile_photo')) {
                $existingFile = Auth::guard('admin')->user()->profile_picture;

                if ($existingFile && Storage::exists($existingFile)) {
                    Storage::delete($existingFile);
                }
                $file = $request->file('profile_photo');
                $profile_photo_name = time() . rand(1,100) . '.' . $file->extension();
                $profile_photo_path = 'public/uploads/users';
                $path = $request->file('profile_photo')->storeAs(
                    $profile_photo_path ,$profile_photo_name
                );
                $update['profile_photo'] = $path;
            }
            $update['name'] = $data['name'];
            $update['phone_number'] = $data['phone_number'];
            $update['other_info'] = $data['other_info'];
            User::where("id", $id)->update($update);

            Session::flash('success_message', 'Profile Updated Successfully');
            return redirect()->route('admin.dashboard');
        }

        return view('admin.pages.auth.profile');
    }

    public function change_password(Request $request)
    {
        $id = Auth::guard('admin')->user()->id;
        if($request->all()) {
            if(!Hash::check($request->old_password,Auth::guard('admin')->user()->password))
            {
                Session::flash('error_message', 'Password is wrong! Please enter correct password');
                return redirect()->route('admin.change-password');
            }

            $user = User::find($id);
            $user->password = Hash::make($request->new_password);
            $user->update();
    
            Session::flash('success_message', 'Password Changed Successfully');
            return redirect()->route('admin.dashboard');
        }
        return view('admin.pages.auth.change-password');
    } 
}
