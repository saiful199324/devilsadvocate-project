<?php

namespace App\Interfaces;

use App\Models\User;

interface UserServiceInterface
{
    public function getAll();
    public function getById($id);
    public function create(array $data);
    public function update(User $user, array $data);
    public function delete(User $user);
    // Define other necessary methods.
}