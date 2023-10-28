<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

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

Route::redirect('/', 'login');

Route::match(['get', 'post'], '/', function () {
    return view('pages.dashboard');
})->name('dashboard');
Route::get('/dashboard', function () {
    return view('pages.dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});
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
require __DIR__.'/auth.php';
