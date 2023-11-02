<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
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
})->middleware(['auth', 'verified', 'admin'])->name('dashboard');
Route::get('/dashboard', function () {
    return view('pages.dashboard');
})->middleware(['auth', 'verified', 'admin'])->name('dashboard');

// routes for profile pages
// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });

// routes for users pages
Route::get('/users', function () {
    return view('pages.users'); 
})->middleware(['auth', 'verified', 'admin'])->name('users');
Route::middleware(['auth', 'admin'])->group(function () {
    Route::delete('/users/{user}', [UserController::class, 'destroy'])->name('users.destroy');
    Route::delete('/users', [UserController::class, 'delete'])->name('users.delete');
    Route::post('/users/update', [UserController::class, 'update'])->name('users.update');
    Route::get('/users/fetchdata', [UserController::class, 'fetchdata'])->name('users.fetchdata');
});

// routes for employee pages
Route::get('/employee', function () {
    return view('pages.employee'); 
})->middleware(['auth', 'verified', 'admin'])->name('employee');

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
    
    Route::get('/crops', function () {
        return view('pages.crops'); 
    })->middleware(['auth', 'verified', 'admin'])->name('crops');
});




// routes for settings pages
Route::get('/settings', function () {
    return view('pages.settings'); 
})->middleware(['auth', 'verified', 'admin'])->name('settings');




Route::get('users/index', 'App\Http\Controllers\UserController@index')->name('users.index');

Route::get('customer/index', 'App\Http\Controllers\CustomerController@index')->name('customer.index');


require __DIR__.'/auth.php';
