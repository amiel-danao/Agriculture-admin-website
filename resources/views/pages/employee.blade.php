@extends('home-master')

@section('title', 'Employee')

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
                <h1>Employee</h1>
                <table id="customer-table" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
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
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#customer-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ route('customer.index') }}",
            columns: [
                { data: 'email', name: 'email' },
                { data: 'user_id', name: 'user_id' },
                { data: 'mobile_number', name: 'mobile_number' },
                { data: 'name', name: 'name' },
            ]
        });
    });
</script>
@endsection