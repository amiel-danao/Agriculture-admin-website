<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('images/apple-touch-icon.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('images/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('images/favicon-16x16.png') }}">
    <link rel="manifest" href="{{ asset('images/site.webmanifest') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    

    <!-- Scripts -->
    @vite(['resources/js/app.js', 'resources/css/app.css'])
    @yield('style')
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

    .btn-success{
        background-color: #008658 !important;
    }
    .btn-primary{
        background-color: #0c6ef7 !important;
    }

    .btn-danger{
        background-color: #e43943 !important;
    }

    .btn-secondary{
        background-color: #6b757d !important;
    }
    
</style>


</head>
    @csrf
<body>
    @yield('navbar')

    @yield('content')

    @yield('footer')

    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    @yield('scripts')
</body>

</html>
