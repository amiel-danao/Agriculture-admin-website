@extends('home-master')

@section('title', 'Manage Crops')

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
                <div class="col-md-8">
                    <h1>Manage Crops</h1>
                </div>
                <div class="col-md-4 text-right">
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCropModal">Add Crop</button>
                </div>
            </div>
            <div class="table-responsive mt-4">
                <table class="table table-striped" style="margin-top: 20px;">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Count</th>
                            <th>Date Created</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    @foreach($crops as $crop)
                            <tr data-crop-id="{{ $crop->id }}">
                                <td>{{ $crop->name }}</td>
                                <td>{{ $crop->description }}</td>
                                <td>{{ $crop->count }}</td>
                                <td>{{ $crop->created_at }}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm edit-crop-button" data-crop-id="{{ $crop->id }}">Edit</button>

                                    <button type="button" class="btn btn-danger btn-sm delete-crop-button">Delete</button>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- Add Crop Modal -->
<div class="modal fade" id="addCropModal" tabindex="-1" aria-labelledby="addCropModalLabel" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCropModalLabel">Add Crop</h5>
            </div>
            <div class="modal-body">
                <form id="addCropForm" method="POST" action='{{ route('crops.store') }}'>
                    @csrf
                    <div class="mb-3">
                        <label for="cropName" class="form-label">Crop Name</label>
                        <input type="text" class="form-control" id="cropName" name="name">
                    </div>
                    <div class="mb-3">
                        <label for="cropCount" class="form-label">Crop Count</label>
                        <input type="number" class="form-control" id="cropCount" name="count">
                    </div>
                    <div class="mb-3">
                        <label for="cropDescription" class="form-label">Crop Description</label>
                        <textarea class="form-control" id="cropDescription" name="description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <h5>Variations</h5>
                        <div id="addVariationsContainer">
                            <!-- Variations will be added here -->
                        </div>
                        <button type="button" class="btn btn-primary btn-sm mt-2" id="addVariation">Add Variation</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveCrop">Save Crop</button>
            </div>
        </div>
    </div>
</div>




@section('scripts')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        // Add Crop
$('#saveCrop').click(function () {
    console.log('Save Crop button clicked');
    var cropName = $('#cropName').val();
    var cropCount = $('#cropCount').val();
    var cropDescription = $('#cropDescription').val();
    
    // Get variations from the input fields
    var variations = [];
    $('#addVariationsContainer input').each(function () {
        var variation = $(this).val();
        if (variation.trim() !== '') {
            variations.push(variation);
        }
    });

    $.ajax({
        type: 'POST',
        url: '{{ route("crops.store") }}',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            name: cropName,
            count: cropCount,
            description: cropDescription,
            variations: variations // Include variations in the data
        },
        success: function (data) {
            console.log('AJAX request succeeded', data);
            $('#cropName').val('');
            $('#cropCount').val('');
            $('#cropDescription').val('');
            $('#addVariationsContainer').empty();
            $('#addCropModal').modal('hide');
            // Reload the page to update the crop list
            location.reload();
        },
        error: function (xhr, status, error) {
            console.log('AJAX error:', xhr.responseText);
            alert("Failed to add crop.");
        }
    });
});


        $('#addVariation').click(function () {
            var variationInput = '<input type="text" class="form-control mb-2" name="variations[]" placeholder="Variation">';
            $('#addVariationsContainer').append(variationInput);
        });
        $(document).ready(function () {
        // Edit Crop
        $('.edit-crop-button').click(function () {
            var row = $(this).closest('tr');
            var cropId = row.data('crop-id');
            console.log('Clicked Edit button. Crop ID:', cropId);

            // Redirect to the edit page
            window.location.href = '/crops/' + cropId + '/edit';
        });

    });



        // Delete Crop
        $('.delete-crop-button').click(function () {
            var row = $(this).closest('tr');
            var cropId = row.data('crop-id');

            if (confirm('Are you sure you want to delete this crop?')) {
                $.ajax({
                    type: 'DELETE',
                    url: '/crops/' + cropId,
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function (data) {
                        alert('Crop deleted successfully.');
                        // Remove the row from the table
                        row.remove();
                    },
                    error: function (xhr, status, error) {
                        console.log('AJAX error:', xhr.responseText);
                        alert('Failed to delete crop.');
                    }
                });
            }
        });
    });
</script>
@endsection