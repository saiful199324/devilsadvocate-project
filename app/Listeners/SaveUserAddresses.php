<?php

namespace App\Listeners;

use App\Events\UserSaved;
use App\Models\Address;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SaveUserAddresses
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\UserSaved  $event
     * @return void
     */
    public function handle(UserSaved $event)
    {
        $user = $event->user;
        $addressData = $event->addresses;

        // dd($user->id);

        foreach ($event->addresses as $addressData) {
            $user->addresses()->create([
                'address' => $addressData,
                'user_id' => $user->id,
            ]);
        }
    }
}
