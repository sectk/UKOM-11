<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Models\OTP;
use App\Mail\SendOTP;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        // Authenticate the user
        $request->authenticate();

        // Regenerate the session
        $request->session()->regenerate();

        // Get the authenticated user
        $user = $request->user();

        // Generate and send OTP
        $otp = rand(100000, 999999);
        OTP::updateOrCreate(
            ['email' => $user->email],
            ['otp' => $otp]
        );

        // Send OTP to user's email
        Mail::to($user->email)->send(new SendOTP($otp));

        // Redirect to OTP form
        return redirect()->route('otp.form');
    }

    /**
     * Verify the OTP and login the user.
     */
    public function verifyOTP(Request $request): RedirectResponse
    {
        $request->validate([
            'otp' => 'required|numeric',
        ]);

        // Get the authenticated user
        $user = Auth::user();

        // Check for valid OTP
        $otpRecord = OTP::where('email', $user->email)
                        ->where('otp', $request->otp)
                        ->first();

        if ($otpRecord) {
            $otpRecord->delete(); // Delete OTP after successful verification
            return redirect()->intended(route('dashboard', absolute: false));
        }

        return redirect()->back()->withErrors(['otp' => 'Invalid OTP.']);
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}