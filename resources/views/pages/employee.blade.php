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
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Date Registered</th>
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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/firebase/10.5.2/firebase-app.js" integrity="sha512-+ZbQvyYWP3kj9kNQTLKiGMnf+Iyg4nlXubjuL1tV2g1+oRLHKwjPGzsZix+lV1vArsSNPP/UX0xR473ib0vSnQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/firebase/10.5.2/firebase-firestore.min.js" integrity="sha512-e59uPIwBdx+hNx8Q2ZJyC2+5Y5zXzo1+teWLliHXpLm6/dfwxTiwTivqQmUH3WLCGD0vygzN8twBUQXqD6l2YQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.5.2/firebase-app.js";
  import { getFirestore, collection, getDocs } from 'https://www.gstatic.com/firebasejs/10.5.2/firebase-firestore.js';
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  const firebaseConfig = {
    apiKey: "AIzaSyC4Pr5NOJ4a762XZfFkYKKJx_f-vfl8Rwg",
    authDomain: "amaff-f0630.firebaseapp.com",
    projectId: "amaff-f0630",
    storageBucket: "amaff-f0630.appspot.com",
    messagingSenderId: "1005200614911",
    appId: "1:1005200614911:web:7dd7d86cd57ce75174b3ca"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const db = getFirestore(app);

  $(document).ready(function () {
        

        const employeesCollection = collection(db, 'Employees'); // Access Firestore collection correctly

        const formatHumanDate = (timestamp) => {
            const jsDate = timestamp.toDate();
            return jsDate.toLocaleString(); // Adjust the format as needed
        };

        // Query the collection and retrieve the data
        const fetchData = async () => {
            var data = [];
            const querySnapshot = await getDocs(employeesCollection);
            querySnapshot.forEach((doc) => {
                const employee = doc.data();
                console.log(employee);

                const dateCreated = formatHumanDate(employee.dateCreated);
                employee.dateCreated = dateCreated;
                data.push(employee);
            });

            const customerTable = $('#customer-table').DataTable({
                data: data,
                columns: [
                    { data: 'email', name: 'email' },
                    { data: 'uid', name: 'uid' },
                    { data: 'mobileNumber', name: 'mobileNumber' },
                    { data: 'firstName', name: 'firstName' },
                    { data: 'lastName', name: 'lastName' },
                    { data: 'dateCreated', name: 'dateCreated' },
                ],
                columnDefs: [{
                    "defaultContent": "-",
                    "targets": "_all"
                }]
            });
        };

        fetchData();
    });
</script>


@endsection