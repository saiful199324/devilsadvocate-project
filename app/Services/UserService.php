<?php

namespace App\Services;

use App\Models\User;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use App\Events\UserSaved;

class UserService
{
    public function getAll()
    {
        return User::all();
    }

    public function store(Request $request){

        // dd($request->all());
        // Create the user
        
    $user = new User();
    $user->name = $request->name;
    $user->email = $request->email;
    if ($request->file('profile_photo_path')) {
        $file = $request->file('profile_photo_path');
        $filename = date('YmdHi').$file->getClientOriginalName();
        $file->move(public_path('upload/user_images/'),$filename);
    };
    $user->profile_photo_path = $filename;
    $user->password = Hash::make($request->password); // Hash the password
    $user->save();

    $addresses = $request->address;
    // dd($addresses);
    event(new UserSaved($user, $addresses));

    // Redirect with a success message
    return redirect()->route('dashboard')->with('success', 'User added successfully.');
    }

    public function show(User $user)

    {

        
        $user = User::with('addresses')->find($user->id);
        // dd($users->addresses);
        
        $addresses = $user->addresses;
        // dd($addresses);
        return view('users.show', compact('user'));
        
    }

    public function getById($user)
    {
        // dd($user);
        return view('users.edit', compact('user'));
    }

    public function update(Request $request, User $user)
    {
        // dd($user->id);
        $user = User::findOrFail($user->id);
            $user->name = $request->name;
            $user->email = $request->email;
            if ($request->hasFile('profile_photo_path')) {
                $file = $request->file('profile_photo_path');
                $filename = date('YmdHi').$file->getClientOriginalName();
                $file->move(public_path('upload/user_images/'), $filename);
                // Delete old profile photo if exists
                if ($user->profile_photo_path) {
                    $oldFile = public_path('upload/user_images/') . $user->profile_photo_path;
                    if (file_exists($oldFile)) {
                        unlink($oldFile);
                    }
                }
                $user->profile_photo_path = $filename;
            }
            $user->save();

            $addresses = $request->address;
            // dd($addresses);
            event(new UserSaved($user, $addresses));


        return Redirect::route('dashboard')->with('success', 'User updated successfully.');

    }

    public function destroy(User $user)
    {
        // Soft delete the user
        $user->delete();
        return Redirect::route('dashboard')->with('success', 'User deleted successfully.');
    }

    public function restore($id)
    {
        // Restore a soft-deleted user
        User::withTrashed()->where('id', $id)->restore();
        return Redirect::route('dashboard')->with('success', 'User restored successfully.');
    }

    public function forceDelete($id)
    {
        // Permanently delete a user
        User::withTrashed()->where('id', $id)->forceDelete();
        return Redirect::route('dashboard')->with('success', 'User permanently deleted successfully.');
    }

    // Add methods for soft deleting, restoring, etc., as needed.
}