@extends('home-master')

@section('title', 'Users')

@section('style')
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
@endsection

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-2 ps-0">
        @include('partials.sidebar')
        </div>
        <div class="col">
            <div class="row">
                @include('partials.navbar')
            </div>

            <div class="row">
                <h1>Users</h1>
                    
                <form action="{{ route('users.delete') }}" method="POST" class="d-inline">
                    @csrf
                    @method('DELETE')
                    <div class="table-responsive">
                        <table id="users-table" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="check-all"></th>
                                    <th>Email</th>
                                    <th>User ID</th>
                                    <th>Mobile Number</th>
                                    <th>Name</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-3">
                        <button type="submit" class="btn btn-danger" style="background-color: #dc3545;" onclick="return confirm('Are you sure you want to delete the selected users?')">Delete User</button>
                        {{-- <a href="{{ route('pages.edit') }}" class="btn btn-primary" id="edit-user-btn">Edit User</a> --}}
                        {{-- <a href="{{ route('users.create') }}" class="btn btn-primary">Add User</a> --}}
                    </div>
                    @if(session('success'))
                        <div class="alert alert-success">
                            {{ session('success') }}
                        </div>
                    @endif
                </form>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#users-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ route('users.index') }}",
            columns: [
                { data: 'checkbox', name: 'checkbox', orderable: false, searchable: false },
                { data: 'email', name: 'email' },
                { data: 'user_id', name: 'user_id' },
                { data: 'mobile_number', name: 'mobile_number' },
                { data: 'name', name: 'name' },
            ]
        });
    });

    $(document).ready(function () {
        $('#check-all').click(function () {
            $('input[type="checkbox"]').prop('checked', this.checked);
        });
    });
</script>
@endsection