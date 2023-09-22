<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::match(['get', 'post'], '/homepage', function () {
    return view('homepage');
})->name('homepage');
Route::get('users/index', 'App\Http\Controllers\UserController@index')->name('users.index');

// Route::get('users/index', 'App\Http\Controllers\CustomerController@index')->name('customer.index');



