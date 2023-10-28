<!-- navigation.blade.php -->

<form method="POST" action="{{ route('logout') }}">
    @csrf

    <nav class="navigation">
        <ul class="nav-links">
            <li class="nav-right">
                <button type="submit" class="logout-button">Log out</button>
            </li>
        </ul>
    </nav>
</form>
<style>
    /* Navigation Styles */
    /* .navigation {
        background-color: #ffffff;
        color: #fff;
        width: 84%;
        height: 50px;
        position: absolute;
        top: 2;
        left: 15%;
        z-index: 2;
        border-radius: 0;
    } */

    .nav-links {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        justify-content: space-around;
        align-items: center;
        height: 100%;
    }

    .nav-links li {
        display: inline;
    }

    .nav-right {
        margin-left: auto; /* Pushes the button to the right */
    }

    .logout-button {
        background-color: #04a24c;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 12px;
        font-size: 13px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-right: 10px;
    }

    .logout-button:hover {
        background-color: #000;
    }

    .nav-links a {
        color: #020000;
        text-decoration: none;
        font-size: 18px;
        padding: 10px 20px;
        border-radius: 12px;
        transition: background-color 0.3s ease;
    }

    .nav-links a:hover {
        background-color: #fff;
        color: #000;
    }
</style>
