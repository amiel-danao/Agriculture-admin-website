<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


    <title>Document</title>
</head>
<body>
    <div class="table-container">
        <h1>Customers</h1>
    <table id="customer-table" class="display">
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
</body>
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
<style>
    /* Style for the table container */
    .table-container {
        width: 80%;
        margin: 0 auto; 
        margin-top: 120px;
        margin-left: 350px; 
        background-color: rgba(255, 255, 255, 0.5);
        padding: 20px; 
    }
</style>

</html>