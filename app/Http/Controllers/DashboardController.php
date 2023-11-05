<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Crop;
use App\Models\User;

class DashboardController extends Controller
{
    public function index()
    {
        $userCount = User::count();
        $cropCount = Crop::count();

        return view('pages.dashboard', compact('userCount', 'cropCount'));
    }
}
