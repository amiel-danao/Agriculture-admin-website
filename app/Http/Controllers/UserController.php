<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Models\User;
use DataTables;
use Validator;

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
                    // $editUrl = route('users.', $row->id);
                    $deleteUrl = route('users.destroy', $row->id);
                    $btn = '<a href="#" class="edit btn btn-primary btn-sm edit" id="'.$row->id.'">Edit</a>';
                    $btn .= '&nbsp;<form action="'.$deleteUrl.'" method="POST" style="display:inline-block;">
                                <input type="hidden" name="_method" value="DELETE">
                                <input type="hidden" name="_token" value="'.csrf_token().'">
                                <button type="submit" class="btn btn-danger btn-sm" style="background-color: #dc3545;" onclick="return confirm(\'Are you sure you want to delete the selected users?\')">Delete</button>
                             </form>';
                    return $btn;
                })
                ->rawColumns(['checkbox', 'action'])
                ->make(true);
        }
    
        return redirect()->route('users')->with('success', 'User deleted successfully');
    }
    public function delete(Request $request)
    {
        $userIds = $request->input('user_id');
        User::whereIn('id', $userIds)->delete();
        return redirect()->route('users.index')->with('success', 'Selected users have been deleted.');
    }

    public function edit($id) : View
    {
    
        $user = User::find($id);

        if (!$user) {
            abort(404);
        }
        return view('pages.edit', ['user']);
    }

    function update(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required',
            'email'  => 'required',
            'mobile_number'  => 'required',
            'user_id'  => 'required',
        ]);
        
        $error_array = array();
        $success_output = '';
        if ($validation->fails())
        {
            foreach ($validation->messages()->getMessages() as $field_name => $messages)
            {
                $error_array[] = $messages; 
            }
        }
        else
        {
            if($request->get('button_action') == 'update')
            {
                $user = User::find($request->get('id'));
                $user->name = $request->get('name');
                $user->email = $request->get('email');
                $user->mobile_number = $request->get('mobile_number');
                $user->user_id = $request->get('user_id');
                $user->save();
                $success_output = '<div class="alert alert-success">Data Updated</div>';
            }
            
        }
        
        $output = array(
            'error'     =>  $error_array,
            'success'   =>  $success_output
        );
        echo json_encode($output);
    }
    
    function fetchdata(Request $request)
    {
        $id = $request->input('id');
        $user = User::find($id);
        $output = array(
            'name'    =>  $user->name,
            'email'     =>  $user->email,
            'mobile_number'     =>  $user->mobile_number,
            'user_id'     =>  $user->user_id,
        );
        echo json_encode($output);
    }
    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('users.index')->with('success', 'User deleted successfully');
    }
}