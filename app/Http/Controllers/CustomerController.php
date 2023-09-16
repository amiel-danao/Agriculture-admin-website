<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Customer;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Customer::select('email', 'user_id', 'mobile_number', 'name')->latest()->get();
            return \Yajra\DataTables\Facades\DataTables::of($data)->make(true);
        }
        return view('customer');
    }
    
}
