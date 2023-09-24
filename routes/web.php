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
Route::match(['get', 'post'], '/dashboardpage', function () {
    return view('dashboardpage');
})->name('dashboardpage');
Route::get('/userspage', function () {
    return view('userspage'); // Replace 'userspage' with your actual view name
})->name('userspage');

Route::get('/customerspage', function () {
    return view('customerspage'); // Replace 'customerspage' with your actual view name
})->name('customerspage');

Route::get('/croppage', function () {
    return view('croppage'); // Replace 'croppage' with your actual view name
})->name('croppage');

Route::get('users/index', 'App\Http\Controllers\UserController@index')->name('users.index');

Route::get('customer/index', 'App\Http\Controllers\CustomerController@index')->name('customer.index');



