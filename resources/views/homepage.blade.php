<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    
</head>
<body>
    <div class="background-container"></div>
    <div class="content">
         @include('sidebar')
        @include('navbar')
        {{-- @include('dashboard') --}}
        {{--@include('users')--}}
        @include('customers')
  </div>
</body>
</html>


<style>
    body {
        background-color: #1e2428;
    }
        
    .background-container {
        background-image: url('{{ asset('images/background.jpg') }}');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
        width: 98vw;
        height: 98vh;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: -1;
        border-radius: 1%;
    }

    .content {
        text-align: center;
        padding: 20px;
        z-index: 1;
    }
</style>