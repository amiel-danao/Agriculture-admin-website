<?php

use App\Http\Controllers\CropController;
use App\Http\Controllers\VariationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [AuthController::class, 'sendOTP']);
Route::post('/verify-otp', [AuthController::class, 'verifyOTP']);


Route::get('crops', [CropController::class, 'all']);

Route::get('variations', [VariationController::class, 'index']);
