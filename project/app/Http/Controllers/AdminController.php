<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
        //<-------------- Start Method -------------->\\

    public function AdminDashboard() 
    {
        
        return view('admin.index');

    }  
        //<-------------- End Method -------------->\\

        //<-------------- Start Method -------------->\\

    public function AdminLogout(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/admin/login');
    } 
        //<-------------- End Method -------------->\\

        //<-------------- Start Method -------------->\\

    public function AdminLogin()
    {

        return view('admin.admin_login');

    }
        //<-------------- End Method -------------->\\

        //<-------------- Start Method -------------->\\

    public function AdminProfile()
    {

        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('admin.admin_profile_view',compact('profileData'));
        
    }
        //<-------------- End Method -------------->\\

        //<-------------- Start Method -------------->\\

    public function AdminProfileStore(Request $request)
    {
        //<-------------- Get User Specific User Id -------------->\\
        
        $id = Auth::user()->id;
        $data = User::find($id);

        //<-------------- End Method -------------->\\

        //<--------- Get All Data OF Above Getting User ID --------->\\

        $data->username = $request->username;
        $data->name = $request->name;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address = $request->address;

        //<--------- End Method --------->\\

        //<--------- User Image Update Condition --------->\\

        if ($request->file('photo')) 
        {
            $file = $request->file('photo');

            //<--------- Image Replace at the Time of Update --------->\\

            @unlink(public_path('upload/admin_images/'.$data->photo));

            //<-------------- End Method -------------->\\

            //<-------------- Image Name With Extension -------------->\\

            $filename = date('YmdHi').$file->getClientOriginalName();

            //<---------- Show Image Name With Extension ---------->\\

            $file->move(public_path('upload/admin_images'),$filename);
            $data['photo'] = $filename;
        }

        $data->save();

        //<--- Show Success Message When Password Change Successfull --->\\

        $notification = array(
            'message' => 'Admin Profile Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    }
        //<-------------- End Method -------------->\\

        //<-------------- Start Method -------------->\\

    public function AdminChangePassword()
    {

        $id = Auth::user()->id;
        $profileData = User::find($id);

        return view('admin.admin_change_password',compact('profileData'));

    }
        //<-------------- End Method -------------->\\

        //<-------------- Start Method -------------->\\

    public function AdminUpdatePassword(Request $request)
    {
        //<-------------- Validation -------------->\\
        $request->validate([

            'old_password' => 'required',
            'new_password' => 'required|confirmed'

        ]);

        //<-------------- Match The Old Password -------------->\\

        if (!Hash::check($request->old_password, auth::user()->password))
        {

        //<--- Show Error Message When Old Password are not Match --->\\

            $notification = array(
            'message' => 'Old Password Does Not Match',
            'alert-type' => 'error'
        );
            return back()->with($notification);
        }

        //<-------------- Update The New Password -------------->\\
        User::whereId(auth()->user()->id)->update([

            'password' => Hash::make($request->new_password)

        ]);

        //<--- Show Success Message When Password Change Successfull --->\\

        $notification = array(
            'message' => 'Password Change Successfully',
            'alert-type' => 'success'
        );
            return back()->with($notification);
        
    }

    //<-------- Admin User All Method -------->\\

    public function AllAdmin()
    {
        
        $alladmin = User::where('role','admin')->get();

        return view('backend.pages.admin.all_admin',compact('alladmin'));

    }
}
