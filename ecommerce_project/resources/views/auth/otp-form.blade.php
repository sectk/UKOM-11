<!DOCTYPE html>
<html>

<head>
    @include('home.css')
</head>

<body>
    <div class="hero_area">
        <!-- header section starts -->
        @include('home.header')
        <!-- end header section -->

        <x-guest-layout>
            <!-- Session Status -->
            <x-auth-session-status class="mb-4" :status="session('status')" />

            <!-- Form OTP -->
            <form method="POST" action="{{ route('verify.otp') }}">
                @csrf

                <!-- OTP Code -->
                <div>
                    <x-input-label for="otp" :value="__('OTP Code')" />
                    <x-text-input id="otp" class="block mt-1 w-full" type="text" name="otp" required autofocus />
                    <x-input-error :messages="$errors->get('otp')" class="mt-2" />
                </div>

                <div class="flex items-center justify-end mt-4">
                    <x-primary-button class="ms-3">
                        {{ __('Verify OTP') }}
                    </x-primary-button>
                </div>
            </form>
        </x-guest-layout>
    </div>
</body>

</html>