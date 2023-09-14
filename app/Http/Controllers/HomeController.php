<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function showHomepage()
    {
        $users = User::all(); // Fetch user data

        return view('homepage', compact('users')); // Pass user data to the homepage view
    }
}
