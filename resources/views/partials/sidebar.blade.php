<!-- sidebar.blade.php -->

<div class="bg-secondary vh-100">
    <div class="logo">
        <img src="{{ asset('images/logo.png') }}" alt="Logo">
    </div>
    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('dashboard')}}">Dashboard</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('users')}}">Users</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('employee')}}">Employees</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('crops.index')}}">Crop List</a>
    </div>
</div>

