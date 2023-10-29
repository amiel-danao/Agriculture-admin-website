@extends('home-master')

@section('title', 'Dashboard')

@section('style')
<style>
.dashboardtxt {
    margin-left: 280px;
    margin-top: 50px; /* Adjust the margin to make space for the navigation bar */
    text-align: left;
}

.category {
    display: inline-block;
    margin: 10px;
}

.category-title {
    font-size: 22px;
    color: rgb(0, 0, 0);
    margin-left: 0;
}

.category-description {
    font-size: 16px;
    margin-top: 4px;
    color: gray;
    text-align: center;
}

.Counts {
    font-size: 26px;
    text-align: center;
}

.category-box {
    width: 300px;
    height: 150px;
    background-color: #ffffff;
    color: #050000;
    border-radius: 5px;
    text-align: left;
    padding: 10px;
}

.chart-box {
    width: 50%; /* Adjust the width for the combined chart box */
    height: 250px;
    background-color: #ffffff;
    color: #050000;
    border-radius: 5px;
    text-align: left;
    padding: 10px;
    margin: 20px auto 0;
    display: flex;
    justify-content: space-between; /* Space elements evenly */
}

.chart-container {
    width: 40%; /* Adjust the width for individual charts */
    height: 80%;
    background-color: #ffffff;
    color: #050000;
    border-radius: 5px;
    text-align: left;
    padding: 10px;
}

.chart canvas {
    width: 100%;
    height: 100%;
}
</style>
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
            <div class="dashboard">
                <div class="dashboardtxt">
                    <h1>Dashboard</h1>
                </div>
                <div class="row mr-auto">

                    <div class="card col-3 m-1">
                        <div class="card-body">
                            <h5 class="card-title">Users</h5>                    
                            <p class="card-text category-description">An overview of all your users on your platform.</p>
                            <p class="card-subtitle mb-2 text-body-secondary Counts">[Profile Count]</p>
                        </div>
                    </div>
                    <div class="card col-3 m-1">
                        <div class="card-body">
                            <h5 class="card-title">Employees</h5>                    
                            <p class="card-text category-description">An overview of all your Employees on your platform.</p>
                            <p class="card-subtitle mb-2 text-body-secondary Counts">[Employees Count]</p>
                        </div>
                    </div>

                    <div class="card col-3 m-1">
                        <div class="card-body">
                            <h5 class="card-title">Crop Details</h5>                    
                            <p class="card-text category-description">An overview of all your crops on your platform.</p>
                            <p class="card-subtitle mb-2 text-body-secondary Counts">[Crop Count]</p>
                        </div>
                    </div>
                </div>

                {{-- <div class="row mr-auto">
                   
                        <div class="col-8 p-4">
                            <canvas id="myChart"></canvas>
                        </div>
                        <div class="col p-4">
                            <canvas id="myPieChart"></canvas>
                        </div>
                    
                </div> --}}
            
                <div class="text-center my-1">
                    <div style="width: 70%; height: 450px; margin: 0 auto; border-radius: 10px;">
                        <img src="{{ asset('images/agriculture.png') }}" alt="Logo" style="width: 100%; height: 100%;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



</div>
@endsection

@section('footer')
    @include('partials.footer')
@endsection

@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Updated colors for the chart dataset
    var backgroundColors = [
        'rgba(255, 99, 132, 0.6)',
        'rgba(54, 162, 235, 0.6)',
        'rgba(255, 206, 86, 0.6)',
        'rgba(75, 192, 192, 0.6)',
        'rgba(153, 102, 255, 0.6)',
    ];

    var borderColor = [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
    ];

    // Sample data for the chart
    var data = {
        labels: ['January', 'February', 'March', 'April', 'May'],
        datasets: [{
            label: 'Sample Data',
            data: [12, 19, 3, 5, 2],
            backgroundColor: backgroundColors,
            borderColor: borderColor,
            borderWidth: 1,
        }],
    };

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: data,
    });

    var pieData = {
        labels: ['Category A', 'Category B', 'Category C'],
        datasets: [{
            data: [30, 40, 30],
            backgroundColor: [
                'rgba(255, 99, 132, 0.6)',
                'rgba(54, 162, 235, 0.6)',
                'rgba(255, 206, 86, 0.6)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
            ],
            borderWidth: 1,
        }],
    };

    var pieCtx = document.getElementById('myPieChart').getContext('2d');
    var myPieChart = new Chart(pieCtx, {
        type: 'pie',
        data: pieData,
    });
</script>

@endsection
