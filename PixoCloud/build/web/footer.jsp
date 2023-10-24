<!DOCTYPE html>
<html>
<head>
    <title>Footer</title>
    <style>
  footer {
  margin-top: 200px;
  
  background-color: #212121;
  color: #fff;
  font-family: sans-serif;
  font-size: 16px;
  line-height: 1.5;
  padding: 40px 0;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.footer-section {
  flex: 1 1 300px;
  margin-bottom: 20px;
}

.footer-section.about .logo-text {
  font-size: 32px;
  margin-bottom: 10px;
}

.footer-section.about p {
  font-size: 14px;
  margin-bottom: 20px;
}

.contact span {
  display: block;
  margin-bottom: 10px;
}

.socials a {
  display: inline-block;
  width: 40px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  border-radius: 50%;
  margin-right: 10px;
  color: #fff;
  background-color: #333;
  transition: background-color 0.3s ease;
}

.socials a:hover {
  background-color: #666;
}

.footer-section.links h2 {
  font-size: 24px;
  margin-bottom: 20px;
  margin-left: 50px;
 
}

.footer-section.links ul {
  list-style: none;
  padding: 0;
  margin: 0;
  margin-left: 50px;
}

.footer-section.links li {
  margin-bottom: 10px;
}

.footer-section.links a {
  color: #fff;
  text-decoration: none;
  transition: color 0.3s ease;
}

.footer-section.links a:hover {
  color: #999;
}

.footer-section.contact-form h2 {
  font-size: 24px;
  margin-bottom: 20px;
}

.contact-input {
  display: block;
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: none;
  border-radius: 4px;
  background-color: #333;
  color: #fff;
  font-size: 14px;
}

.contact-input::placeholder {
  color: #999;
}

.contact-btn {
  display: block;
  width: 150px;
  padding: 10px;
  border: none;
  border-radius: 4px;
  background-color: #ef5350;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.contact-btn:hover {
  background-color: #e53935;
}

.footer-bottom {
  background-color: #000;
  color: #999;
  font-size: 14px;
  text-align: center;
  padding: 10px 0;
  margin-top: 40px;
}

    </style>
</head>
<body>
    <!-- Your page content here -->
    <div class="content">
        <!-- Your content goes here, or leave it empty for a minimal page -->
    </div>

 <footer>
  <div class="footer-content">
    <div class="footer-section about">
      <h1 class="logo-text"></h1>
      <img src="https://res.cloudinary.com/dzfcjmoon/image/upload/v1698130704/qfwftw6jmwqybvtzynqa.png" alt="" height="170px" width="200px">
      <p>A user-friendly JSP-based image management system for efficient image uploads, organization, and secure file management. Upload, view, and delete your images effortlessly. Your personalized online image repository.
      </p>
      <div class="contact">
        <span><i class="fas fa-phone"></i> &nbsp; 8494011335</span>
        <span><i class="fas fa-envelope"></i> &nbsp; adhfarrather@gmail.com</span>
      </div>
      <div class="socials">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
    <div class="footer-section links">
      <h2>Quick Links</h2>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Terms & Conditions</a></li>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>
    <div class="footer-section contact-form">
      <h2>Contact Us</h2>
      <form action="#" method="post">
        <input type="email" name="email" class="text-input contact-input" placeholder="Your email address">
        <textarea name="message" class="text-input contact-input" placeholder="Your message"></textarea>
        <button type="submit" class="btn btn-big contact-btn"><i class="fas fa-envelope"></i> Send</button>
      </form>
    </div>
  </div>
  <div class="footer-bottom">
    &copy; 2023 <b>PixoCloud</b> . All rights reserved. Design by <b>Adhfar Mujtaba</b>.
  </div>
</footer>
    <script src="https://kit.fontawesome.com/51d4b418bd.js" crossorigin="anonymous">  var fullImgBox = document.getElementById("fullImgBox");</script>
</body>
</html>
