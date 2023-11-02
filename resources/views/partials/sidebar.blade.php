<!-- sidebar.blade.php -->

<div class="bg-secondary vh-100">
    <div class="logo">
        <img src="{{ asset('images/logo.png') }}" alt="Logo">
    </div>
    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('dashboard')}}">Dashboard</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('users')}}">Users</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('employee')}}">Employee</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('crops.index')}}">Crop Details</a>
        <a class="nav-link active" id="v-pills-home-tab" type="button" role="tab" href="{{route('settings')}}">Settings</a>
    </div>
</div>

<style>
    .nav-pills .nav-link.active, .nav-pills .show>.nav-link{
        color: black;
        background-color: white;
        border: 1px solid;
    }

    .logo {
        text-align: center;
        margin-bottom: 20px;
    }
    .logo img {
        max-width: 80%;
    }

    .sidebar {
        background-color: #57636c;
        color: #fff;
        width: 200px;
        height: 94vh;
        position: absolute;
        top: 50%;
        left: 1%;
        transform: translate(0, -50%);
        padding: 20px;
        border-radius: 1%;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    /* .sidebar-buttons {
        flex-grow: 1;
    } */

    .sidebar-button {
        background-color: #ffffff;
        color: #000000;
        border: 1px solid;
        padding: 10px 20px;
        text-align: left;
        width: 100%;
        font-size: 18px;
        cursor: pointer;
        border-radius: 12px;
        margin-bottom: 5px;
    }

    .sidebar-title {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .sidebar-link {
        color: #fff;
        text-decoration: none;
        display: block;
        margin-bottom: 10px;
        font-size: 18px;
    }

    .sidebar-link:hover {
        text-decoration: underline;
    }
</style>
