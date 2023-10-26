<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
    <style>
        /* Header styles */
        header {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Logo styles */
        .logo {
            width: 150px;
            height: auto;
        }

        /* Navigation links styles */
        .nav {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
            /* Move navigation links to the right */
            margin-left: auto;
        }

        .nav li {
            font-weight: bold;
            margin-right: 20px;
        }

        /* Styling for navigation links */
        .nav a {
            text-decoration: none;
            color: #fff;
            transition: color 0.3s;
        }

        .nav a:hover {
            color: #3498db;
        }

        /* User profile styles */
        .user-profile {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .user-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            margin-right: 10px;
            object-fit: cover;
        }

        .user-options {
            display: none;
            position: absolute;
            top: 60px; /* Adjust the vertical position */
            right: 0;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            z-index: 1;
        }

        .user-options a {
            display: block;
            text-decoration: none;
            color: #333;
            padding: 5px 0;
        }

        .user-profile:hover .user-options {
            display: block;
        }
        
         @media (max-width: 600px) {
            /* Mobile CSS */
            .nav {
                display: none; /* Hide the navigation links on mobile */
            }

            .user-profile {
                display: none; /* Hide the user profile on mobile */
            }

            .logo {
                width: 100px; /* Adjust logo size for mobile */
            }

            header {
                flex-direction: column; /* Stack elements vertically on mobile */
            }

            .logocls {
                text-align: center; /* Center the logo and tagline on mobile */
                margin-bottom: 10px; /* Add spacing between elements on mobile */
            }

            p {
                font-size: 16px; /* Adjust the font size for the tagline on mobile */
            }
        }
    </style>
</head>
<body>
    <header>
     <div class="logocls" style="display: flex; align-items: center;">
    <img class="logo" src="https://res.cloudinary.com/dzfcjmoon/image/upload/v1698131139/tlis1lumwv5rdz2hbxgl.png" alt="PIXO Cloud Logo">
    <p style="font-size: 14px; color: #333; font-weight: bold; margin-top: 20px">Image Management System</p>
</div>

        <ul class="nav">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
        <div class="user-profile">
            <img class="user-avatar" src="https://res.cloudinary.com/dzfcjmoon/image/upload/v1698223661/ladftdyk4he9kc6sfuro.png" alt="User Avatar">
            <div class="user-options">
                <a href="edit_profile.jsp">Update Profile</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>
    </header>
</body>
</html>
