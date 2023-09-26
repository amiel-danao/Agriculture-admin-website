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
Route::match(['get', 'post'], '/', function () {
    return view('pages.dashboard');
})->name('dashboard');
Route::get('/users', function () {
    return view('pages.users'); // Replace 'userspage' with your actual view name
})->name('users');

Route::get('/customers', function () {
    return view('pages.customers'); // Replace 'customerspage' with your actual view name
})->name('customers');

Route::get('/crops', function () {
    return view('pages.crops'); // Replace 'croppage' with your actual view name
})->name('crops');

Route::get('/settings', function () {
    return view('pages.settings'); // Replace 'croppage' with your actual view name
})->name('settings');

Route::get('users/index', 'App\Http\Controllers\UserController@index')->name('users.index');

Route::get('customer/index', 'App\Http\Controllers\CustomerController@index')->name('customer.index');



