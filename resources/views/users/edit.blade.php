<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Edit User
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-5">
                <!-- Notice the action route now points to users.update and includes the user's ID -->
                <form method="POST" action="{{ route('users.update', $user->id) }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT') <!-- Important: Specify the method as PUT for update -->

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="name">
                            Name
                        </label>
                        <!-- Populate value with the user's current name -->
                        <input type="text" name="name" id="name" value="{{ $user->name }}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required autofocus>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                            Email
                        </label>
                        <!-- Populate value with the user's current email -->
                        <input type="email" name="email" id="email" value="{{ $user->email }}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
                    </div>

                    <!-- Address Section -->
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="address">
                            Present Address
                        </label>
                        <input type="text" name="address[]" id="address" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        {{-- Add validation if needed --}}
                    </div>
                    <!-- End Address Section -->

                    <!-- Address Section -->
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="address">
                            Permenant Address
                        </label>
                        <input type="text" name="address[]" id="address" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        {{-- Add validation if needed --}}
                    </div>
                    <!-- End Address Section -->
                    
                    <!-- Optionally, remove password fields or handle them separately -->
                     <!-- Address Section -->
                     <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="address">
                            Upload Photo
                        </label>
                        <input type="file" name="profile_photo_path" id="image">
                        {{-- Add validation if needed --}}
                    </div>
                    <!-- End Address Section -->

                    <div class="flex items-center justify-between">
                        <button type="submit" class="btn btn-primary">
                            Update User
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>