<?php

use Illuminate\Support\Facades\Route;       


Route::match(['get', 'post'], '/', function () {
    return view('pages.dashboard');
})->name('dashboard');
Route::get('/users', function () {
    return view('pages.users'); // Replace 'userspage' with your actual view name
})->name('users');

Route::get('/customers', function () {
    return view('pages.customers'); // Replace 'customerspage' with your actual view name
})->name('customers');

Route::prefix('crops')->group(function () {
    // Display the list of crops
    Route::get('/', 'App\Http\Controllers\CropController@index')->name('crops.index');

    // Create a new crop
    Route::post('/', 'App\Http\Controllers\CropController@store')->name('crops.store');

    // Edit a crop (display edit form)
    Route::get('/{id}/edit', 'App\Http\Controllers\CropController@edit')->name('crops.edit');

    // Update a crop
    Route::patch('/{id}', 'App\Http\Controllers\CropController@update')->name('crops.update');

    // Delete a crop
    Route::delete('/{id}', 'App\Http\Controllers\CropController@destroy')->name('crops.destroy');
});




Route::get('/settings', function () {
    return view('pages.settings');
})->name('settings');

Route::get('users/index', 'App\Http\Controllers\UserController@index')->name('users.index');

Route::get('customer/index', 'App\Http\Controllers\CustomerController@index')->name('customer.index');

