<?php

namespace App\Services;

use App\Models\User;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class UserService
{
    public function getAll()
    {
        return User::all();
    }

    public function store(Request $request){
        // Create the user
    $user = new User();
    $user->name = $request->name;
    $user->email = $request->email;
    $user->password = Hash::make($request->password); // Hash the password
    $user->save();

    // Redirect with a success message
    return redirect()->route('dashboard')->with('success', 'User added successfully.');
    }

    public function getById($id)
    {
        return User::findOrFail($id);
    }

    public function create(array $data)
    {
        $data['password'] = Hash::make($data['password']);
        return User::create($data);
    }

    public function update(User $user, array $data)
    {
        if (isset($data['password'])) {
            $data['password'] = Hash::make($data['password']);
        }
        return $user->update($data);
    }

    public function delete(User $user)
    {
        return $user->delete();
    }

    // Add methods for soft deleting, restoring, etc., as needed.
}