<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    public function index()
    {
        $users = User::all(); // Get all users
        $trashedUsers = User::onlyTrashed()->get(); // Get soft-deleted users
        // dd($trashedUsers);
        return view('users.index', compact('users', 'trashedUsers'));
    }

    public function create()
    {
        // Return view to add a new user
        return view('users.create');
    }

    public function store(Request $request)
    {
        // dd($request->all());
        // Store a new user

        // Validate the request data
    $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
    ]);

    // Create the user
    $user = new User();
    $user->name = $request->name;
    $user->email = $request->email;
    $user->password = Hash::make($request->password); // Hash the password
    $user->save();

    // Redirect with a success message
    return redirect()->route('dashboard')->with('success', 'User added successfully.');

    }

    public function show(User $user)
    {
        // Return view to show user details
        return view('users.show', compact('user'));
    }

    public function edit(User $user)
    {
        // Return view to edit user details
        return view('users.edit', compact('user'));
    }

    public function update(Request $request, User $user)
    {
        // Update user details
        $user->update($request->all());
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
}