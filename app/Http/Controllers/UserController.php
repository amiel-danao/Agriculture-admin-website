<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use DataTables;

class UserController extends Controller
{
    public function index(Request $request)
    {
        // if ($request->ajax()) {
        //     $data = User::select('email', 'user_id', 'mobile_number', 'name')->latest()->get();
        //     return \Yajra\DataTables\Facades\DataTables::of($data)->make(true);
        // }
        // return view('users');
        if ($request->ajax()) {
            $users = User::latest()->get();
            return Datatables::of($users)
                ->addIndexColumn()
                ->addColumn('checkbox', function($row){
                    $checkbox = '<input type="checkbox" name="user_id[]" value="'.$row->id.'">';
                    return $checkbox;
                })
                ->addColumn('action', function($row){
                    $editUrl = route('users.edit', ['user' => $row->id]);
                    $deleteUrl = route('users.destroy', ['user' => $row->id]);
                    $csrf = csrf_field();
                    $method = method_field('DELETE');
                    $btn = '<a href="'.$editUrl.'" class="edit btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>';
                    $btn .= '<form action="'.$deleteUrl.'" method="POST" style="display:inline-block">
                                '.$csrf.'
                                '.$method.'
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure you want to delete this user?\')"><i class="fas fa-trash"></i></button>
                            </form>';
                    return $btn;
                })
                ->rawColumns(['checkbox', 'action'])
                ->make(true);
        }
    
        return redirect()->route('users.index')->with('success', 'User deleted successfully');
    }
    public function delete(Request $request)
    {
        $userIds = $request->input('user_id');
        User::whereIn('id', $userIds)->delete();
        return redirect()->route('users.index')->with('success', 'Selected users have been deleted.');
    }

    // public function edit(Request $request, $id)
    // {
    //     $user = User::findOrFail($id);
    //     return view('users.edit', compact('user'));
    // }

    // public function update(Request $request, $id)
    // {
    //     $user = User::findOrFail($id);
    //     $user->name = $request->input('name');
    //     $user->email = $request->input('email');
    //     $user->mobile_number = $request->input('mobile_number');
    //     $user->save();
    //     return redirect()->route('users.index')->with('success', 'User has been updated.');
    // }

    public function edit(Request $request)
    {
        $userIds = explode(',', $request->query('user_ids'));
        $users = User::whereIn('id', $userIds)->get();
        return view('users.edit', compact('users'));
    }

    public function update(Request $request)
    {
        foreach ($request->input('user_ids') as $userId) {
            $user = User::find($userId);
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->mobile_number = $request->input('mobile_number');
            $user->save();
        }
        return redirect()->route('users.index')->with('success', 'Users updated successfully.');
    }
    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('users.index')->with('success', 'User deleted successfully');
    }

}