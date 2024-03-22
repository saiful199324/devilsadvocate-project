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
        return (new UserService)->show($user);
    }

    public function edit(User $user)
    {
        return (new UserService)->getById($user);
        // Return view to edit user details
        
    }

    public function update(Request $request, User $user)
    {
        return (new UserService)->update($request, $user);
        // Update user details
        
    }

    public function destroy(User $user)
    {
        // Soft delete the user
        return (new UserService)->destroy($user);
    }

    public function restore($id)
    {
        // Restore a soft-deleted user
        return (new UserService)->restore($id);
    }

    public function forceDelete($id)
    {
        // Permanently delete a user
        return (new UserService)->forceDelete($id);
    }
}