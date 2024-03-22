<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Services\UserService;
use App\Http\Requests\UserPostRequest;
use App\Interfaces\UserServiceInterface;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
  

    public function index()
    {

        return view('users.index', compact('users'));
    }

    public function create()
    {
        // Return view to add a new user
        return view('users.create');
    }

    public function store(UserPostRequest $request)
    {
    

    return (new UserService)->store($request);

    

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