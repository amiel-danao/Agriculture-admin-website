@extends('home-master')

@section('title', 'Users')

@section('style')
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noty/3.1.4/noty.min.css" />
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
                                    {{-- <th><input type="checkbox" id="check-all"></th> --}}
                                    <th>Email</th>
                                    <th>User ID</th>
                                    <th>Mobile Number</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
                        </table>
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
</div>

<div id="userModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" id="user_form">
                <div class="modal-header">
                   {{-- <button type="button" class="close" data-dismiss="modal">&times;</button> --}}
                   <h4 class="modal-title">Edit</h4>
                </div>
                <div class="modal-body">
                    {{csrf_field()}}
                    <span id="form_output"></span>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" id="name" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" name="email" id="email" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Mobile Number</label>
                        <input type="text" name="mobile_number" id="mobile_number" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>User ID</label>
                        <input type="text" name="user_id" id="user_id" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                     <input type="hidden" name="id" id="id" value="" />
                    <input type="hidden" name="button_action" id="button_action" value="insert" />
                    <input type="submit" name="submit" id="action" value="Edit" class="btn btn-info btn-sm" />
                    {{-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> --}}
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" style="background-color: #dc3545;">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/noty/3.1.4/noty.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#users-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ route('users.index') }}",
            columns: [
                // { data: 'checkbox', name: 'checkbox', orderable: false, searchable: false },
                { data: 'email', name: 'email' },
                { data: 'user_id', name: 'user_id' },
                { data: 'mobile_number', name: 'mobile_number' },
                { data: 'name', name: 'name' },
                { data: 'action', name: 'action', orderable: false, searchable: false },
            ]
        });
    });

    $(document).ready(function () {
        $('#check-all').click(function () {
            $('input[type="checkbox"]').prop('checked', this.checked);
        });
    });

    $('#edit_data').click(function(){
        $('#userModal').modal('show');
        $('#user_form')[0].reset();
        $('#form_output').html('');
        $('#button_action').val('insert');
        $('#action').val('Edit');
        $('.modal-title').text('Edit');
    });

    $('#user_form').on('submit', function(event){
        event.preventDefault();
        var form_data = $(this).serialize();
        $.ajax({
            url:"{{ route('users.update') }}",
            method:"POST",
            data:form_data,
            dataType:"json",
            success:function(data)
            {
                if(data.error.length > 0)
                {
                    var error_html = '';
                    for(var count = 0; count < data.error.length; count++)
                    {
                        error_html += '<div class="alert alert-danger">'+data.error[count]+'</div>';
                    }
                    $('#form_output').html(error_html);
                }else{
                    $('#userModal').modal('hide');
                    new Noty({
                    type: 'success',
                    layout: 'topRight',
                    text: 'User successfully updated!',
                    timeout: 3000,
                }).show();
                    $('#users-table').DataTable().ajax.reload();
                }
            }
        })
    });

    $(document).on('click', '.edit', function(){
        var id = $(this).attr("id");
        $('#form_output').html('');
        $.ajax({
            url:"{{route('users.fetchdata')}}",
            method:'get',
            data:{id:id},
            dataType:'json',
            success:function(data)
            {
                $('#name').val(data.name);
                $('#email').val(data.email);
                $('#mobile_number').val(data.mobile_number);    
                $('#user_id').val(data.user_id);
                $('#id').val(id);
                $('#userModal').modal('show');
                $('#action').val('Edit');
                $('.modal-title').text('Edit Data');
                $('#button_action').val('update');
            }
        })
    });

    $(document).ready(function(){
        $('.btn-danger').click(function(){
        $('#userModal').modal('hide');
        });
    });
</script>
@endsection