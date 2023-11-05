@extends('home-master')

@section('title', 'Edit Crop')

@section('style')
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <!-- <link rel="stylesheet" href="{{ asset('css/app.css') }}"> Include your custom CSS file -->
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

            <div class="row mt-3">
                <div class="col-md-8">
                    <h1>Edit Crop</h1>
                </div>
            </div>

            <div class="table-responsive mt-4">
                <form method="POST" action="{{ route('crops.update', ['id' => $crop->id]) }}">
                    @csrf
                    @method('PATCH') <!-- Method override for PATCH request -->
                    <input type="hidden" name="id" value="{{ $crop->id }}">
                    <div class="mb-3">
                        <label for="name" class="form-label">Crop Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $crop->name) }}">
                    </div>
                    <div class="mb-3">
                        <label for="count" class="form-label">Crop Count</label>
                        <input type="number" class="form-control" id="count" name="count" value="{{ old('count', $crop->count) }}">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Crop Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3">{{ old('description', $crop->description) }}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="variations" class="form-label">Variations</label>
                        <div id="variations">
                            @foreach ($variations as $variation)
                                <div class="input-group mb-2">
                                    <input type="text" class="form-control" name="variations[]" value="{{ $variation->name }}">
                                    <button type="button" class="btn btn-danger btn-sm remove-variation">Remove Variation</button>
                                </div>
                            @endforeach
                        </div>
                        <button type="button" class="btn btn-primary btn-sm mt-2" id="addVariation">Add Variation</button>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <a class="btn btn-secondary" href="{{ route('crops.index') }}">Back to Crops</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        // Edit Crop button click handler
        $('.edit-crop-button').click(function () {
            var row = $(this).closest('tr');
            var cropId = row.data('crop-id');
            $('#id').val(cropId);

            var cropName = row.find('td:eq(0)').text();
            var cropDescription = row.find('td:eq(1)').text();
            var cropCount = row.find('td:eq(2)').text();
            $('#name').val(cropName);
            $('#description').val(cropDescription);
            $('#count').val(cropCount);

            // Populate existing variations
            var variations = row.find('td:eq(3)').text().split(', ');
            $('#variations').empty(); // Clear any existing variations
            for (let i = 0; i < variations.length; i++) {
                let variationInput = '<input type="text" class="form-control mb-2" name="variations[]" value="' + variations[i] + '">';
                $('#variations').append(variationInput);
            }
        });
    });
    $(document).ready(function () {
        // Add Variation button click handler
        $('#addVariation').click(function () {
            var variationInput = '<div class="input-group mb-2">' +
                '<input type="text" class="form-control" name="variations[]" placeholder="Variation">' +
                '<button type="button" class="btn btn-danger btn-sm remove-variation">Remove Variation</button>' +
                '</div>';
            $('#variations').append(variationInput);
        });

        // Remove Variation button click handler
        $(document).on('click', '.remove-variation', function () {
            $(this).parent().remove();
        });
    });
</script>
@endsection
