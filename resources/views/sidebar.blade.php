<!-- sidebar.blade.php -->

<aside class="sidebar">
    <div class="logo">
        <img src="{{ asset('images/logo.png') }}" alt="Logo">
    </div>
    <ul class="sidebar-buttons">
        <li><button class="sidebar-button" onclick="location.href='/dashboard'">Dashboard</button></li>
        <li><button class="sidebar-button" onclick="location.href='/about'">Users</button></li>
        <li><button class="sidebar-button" onclick="location.href='/contact'">Customers</button></li>
        <li><button class="sidebar-button" onclick="location.href='/about'">Crop Details</button></li>
        <li><button class="sidebar-button" onclick="location.href='/contact'">Settings</button></li>
    </ul>
</aside>

<style>
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
        position: fixed;
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

    .sidebar-buttons {
        flex-grow: 1;
    }

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
