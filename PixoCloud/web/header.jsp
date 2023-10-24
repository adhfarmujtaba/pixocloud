<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
    <style>
        /* Header styles */
        header {
            background: linear-gradient(135deg, #3498db, #9b59b6); /* Gradient background */
            color: #fff; /* Light text color */
            display: flex; /* Use flexbox to align content */
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add a subtle shadow */
        }

        /* Logo styles */
        .logo {
            width: 150px; /* Adjust the width as needed */
            height: auto; /* Maintain aspect ratio */
        }

        /* Navigation links styles */
        .nav {
            list-style: none;
            display: flex;
            margin: 0; /* Remove default list margin */
            padding: 0; /* Remove default list padding */
        }

        .nav li {
            font-weight: bold;
            margin-right: 20px; /* Adjust the spacing between links */
        }

        /* Styling for navigation links */
        .nav a {
            text-decoration: none;
            color: #fff;
            transition: color 0.3s; /* Smooth color transition on hover */
        }

        .nav a:hover {
            color: #3498db; /* Change color on hover to match the gradient */
        }
    </style>
</head>
<body>
    <header>
        <img class="logo" src="https://res.cloudinary.com/dzfcjmoon/image/upload/v1698131139/tlis1lumwv5rdz2hbxgl.png" alt="PIXO Cloud Logo">
        <ul class="nav">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </header>
</body>
</html>
