<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\VerificationCode;

class AuthController extends Controller
{
    public function sendOTP(Request $request)
{
    // Validate the mobile_number input here
    $user = User::where('mobile_number', $request->input('mobile_number'))->first();

    if (!$user) {
        return response()->json(['message' => 'Mobile Number not found'], 404);
    }

    // Generate an OTP code
    $otpCode = mt_rand(100000, 999999);
    $expiresAt = now()->addMinutes(15); // OTP expires in 15 minutes

    // Save the OTP code in the verification_codes table
    VerificationCode::create([
        'mobile_number' => $user->mobile_number,
        'code' => $otpCode,
        'expires_at' => $expiresAt,
    ]);

    // Send the OTP code to the user via SMS or any other method

    return response()->json(['message' => 'OTP sent successfully']);
}


public function verifyOTP(Request $request)
{
    // Validate the OTP input here

    $verificationCode = VerificationCode::where('mobile_number', $request->input('mobile_number'))
        ->where('code', $request->input('otp'))
        ->where('expires_at', '>', now())
        ->first();

    if (!$verificationCode) {
        // Invalid OTP or expired
        return response()->json(['message' => 'Invalid OTP code'], 400);
    }

    // Get the user associated with the mobile number
    $user = User::where('mobile_number', $request->input('mobile_number'))->first();

    if (!$user) {
        return response()->json(['message' => 'User not found'], 404);
    }

    // OTP is valid, you can now implement your login logic here

    // Delete the used verification code
    $verificationCode->delete();

    // Return user ID in the response
    return response()->json(['message' => 'OTP verified successfully', 'user_id' => $user->user_id]);
}
}