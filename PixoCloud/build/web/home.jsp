<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pixo Cloud</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<jsp:include page="header.jsp" />
<body>
<%
String username = (String) session.getAttribute("username");
if (username == null) {
    // User is not logged in, redirect to the login page with a parameter
    response.sendRedirect("index.jsp?notLoggedIn=true"); // Add the parameter
}
%>

<div class="logout-button-container">
    <form action="logout.jsp" method="post">
        <input type="submit" value="Logout" class="logout-button">
    </form>
</div>

<div id="imageModal" class="modal">
    <span class="close" onclick="closeImageModal()">&times;</span>
    <a id="downloadLink" download><button>Download</button></a>
    <img id="fullScreenImage" class="modal-content">
    
    <!-- Add previous and next arrow buttons -->
    <button id="prevButton" onclick="showPreviousImage()">&#10094;</button>
    <button id="nextButton" onclick="showNextImage()">&#10095;</button>
</div>

<div class="container">
    <p>Hello, <%= session.getAttribute("username") %>! </p>

    <!-- Image Upload Form -->
    <form action="ImageUploadServlet" method="post" enctype="multipart/form-data">
        <label for="file">Choose Image to Upload</label>
        <input type="file" name="file" id="file" required onchange="displaySelectedFileNames()" multiple>

        <span id="selectedFileName">No file chosen</span>
        <input type="submit" value="Upload">
    </form>
</div>
<div class="button-container">
    <button id="selectButton" onclick="selectImages()">Select</button>
    <button id="selectAllButton" onclick="selectAllImages()">Select All</button>
    <button id="unselectButton" style="display: none;" onclick="unselectImages()">Unselect</button>
    <button id="deleteButton" style="display: none;" onclick="deleteImages()">Delete</button>
</div>
    <form id="deleteImagesForm" action="ImageDeleteServlet" method="post">
    <input type="hidden" name="selectedImages" id="selectedImagesInput" value="">
</form>
    
   

<div class="image-grid" oncontextmenu="return false;">
    <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    boolean imagesExist = false; // Add this variable to track if there are images

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");
        stmt = conn.createStatement();
        
        // Get the username of the logged-in user
        String loggedInUsername = (String) session.getAttribute("username");
        
        // Retrieve images associated with the logged-in user
        rs = stmt.executeQuery("SELECT * FROM cloudimg WHERE username = '" + loggedInUsername + "'");
        
        while (rs.next()) {
            String uniqueFileName = rs.getString("unique_filename");
            %>
            <div class="image-card">
                <img src="images/<%= uniqueFileName %>" alt="<%= uniqueFileName %>" onclick="openImageModal('images/<%= uniqueFileName %>')">
                <input type="checkbox" class="image-checkbox" name="selectedImages" value="<%= uniqueFileName %>">
            </div>
            <%
            imagesExist = true; // Images are found in the database
        }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("An error occurred while closing resources: " + e.getMessage());
        }
    }
    %>
</div>

<%-- Display a message when no images are found --%>
<% if (!imagesExist) { %>
    <div class="no-images-message" style="color: black; font-weight: bold;">
        Nothing to Show, please upload some images.
    </div>
<% } %>



<!-- JavaScript function to handle scrolling and navigation -->
<script>
    var imageIndex = 0;

    function openImageModal(imageUrl) {
        var modal = document.getElementById("imageModal");
        var fullScreenImage = document.getElementById("fullScreenImage");
        var downloadLink = document.getElementById("downloadLink");

        fullScreenImage.src = imageUrl;
        downloadLink.href = imageUrl;
        modal.style.display = "block";

        // Find the index of the selected image
        var imageCards = document.getElementsByClassName("image-card");
        for (var i = 0; i < imageCards.length; i++) {
            if (imageCards[i].firstElementChild.getAttribute("alt") === imageUrl) {
                imageIndex = i;
                break;
            }
        }

        // Show or hide navigation arrows based on the index
        updateNavigationArrows();
    }

    function closeImageModal() {
        var modal = document.getElementById("imageModal");
        modal.style.display = "none";
    }

    function showPreviousImage() {
        if (imageIndex > 0) {
            imageIndex--;
            var imageCards = document.getElementsByClassName("image-card");
            var imageUrl = imageCards[imageIndex].firstElementChild.getAttribute("alt");
            openImageModal("images/" + imageUrl);
            updateNavigationArrows();
        }
    }

    function showNextImage() {
        var imageCards = document.getElementsByClassName("image-card");
        if (imageIndex < imageCards.length - 1) {
            imageIndex++;
            var imageUrl = imageCards[imageIndex].firstElementChild.getAttribute("alt");
            openImageModal("images/" + imageUrl);
            updateNavigationArrows();
        }
    }

    function updateNavigationArrows() {
        var prevButton = document.getElementById("prevButton");
        var nextButton = document.getElementById("nextButton");

        if (imageIndex === 0) {
            prevButton.style.display = "none";
        } else {
            prevButton.style.display = "block";
        }

        if (imageIndex === document.getElementsByClassName("image-card").length - 1) {
            nextButton.style.display = "none";
        } else {
            nextButton.style.display = "block";
        }
    }

    function displaySelectedFileName() {
        var fileInput = document.getElementById("file");
        var selectedFileName = document.getElementById("selectedFileName");

        if (fileInput.files.length > 0) {
            selectedFileName.textContent = fileInput.files[0].name;
        } else {
            selectedFileName.textContent = "No file chosen";
        }
    }
    
    
    
    
    
    
 var isFirstImageSelected = false;
var isAllSelected = false;
var isImageModalEnabled = true; // Add this variable

function toggleImageCheckboxes(display) {
    var imageCheckboxes = document.querySelectorAll('.image-checkbox');
    for (var i = 0; i < imageCheckboxes.length; i++) {
        imageCheckboxes[i].style.display = display;
    }
}

function openImageModal(imageUrl) {
    if (isImageModalEnabled) {
        var modal = document.getElementById("imageModal");
        var fullScreenImage = document.getElementById("fullScreenImage");
        var downloadLink = document.getElementById("downloadLink");

        fullScreenImage.src = imageUrl;
        downloadLink.href = imageUrl;
        modal.style.display = "block";

        // Find the index of the selected image
        var imageCards = document.getElementsByClassName("image-card");
        for (var i = 0; i < imageCards.length; i++) {
            if (imageCards[i].firstElementChild.getAttribute("alt") === imageUrl) {
                imageIndex = i;
                break;
            }
        }

        // Show or hide navigation arrows based on the index
        updateNavigationArrows();
    }
}

function closeImageModal() {
    var modal = document.getElementById("imageModal");
    modal.style.display = "none";
}

function selectImages() {
    toggleImageCheckboxes('block');
    isImageModalEnabled = false; // Disable the image modal
    if (!isFirstImageSelected) {
        var imageCheckboxes = document.querySelectorAll('.image-checkbox');
        if (imageCheckboxes.length > 0) {
            imageCheckboxes[0].checked = true;
        }
        isFirstImageSelected = true;
        document.getElementById("unselectButton").style.display = "block";
        document.getElementById("deleteButton").style.display = "block";
    }
}

function unselectImages() {
    toggleImageCheckboxes('none');
    isImageModalEnabled = true; // Re-enable the image modal
    var imageCheckboxes = document.querySelectorAll('.image-checkbox');
    for (var i = 0; i < imageCheckboxes.length; i++) {
        imageCheckboxes[i].checked = false;
    }
    document.getElementById("unselectButton").style.display = "none";
    document.getElementById("deleteButton").style.display = "none";
    isFirstImageSelected = false;
}

function selectAllImages() {
    toggleImageCheckboxes('block');
    isImageModalEnabled = false; // Disable the image modal
    var imageCheckboxes = document.querySelectorAll('.image-checkbox');
    for (var i = 0; i < imageCheckboxes.length; i++) {
        imageCheckboxes[i].checked = true;
    }
    isAllSelected = true;
    document.getElementById("unselectButton").style.display = "block";
    document.getElementById("deleteButton").style.display = "block";
}

// Call toggleImageCheckboxes to initially hide the checkboxes
toggleImageCheckboxes('none');

 
document.addEventListener("DOMContentLoaded", function () {
    var imageCards = document.getElementsByClassName("image-card");
    var isSelectionMode = false; // Variable to track whether selection mode is active
    var selectAllButton = document.getElementById("selectAllButton");

    for (var i = 0; i < imageCards.length; i++) {
        imageCards[i].addEventListener("click", function (event) {
            var checkbox = this.querySelector(".image-checkbox");

            if (isSelectionMode) {
                checkbox.checked = !checkbox.checked;

                // Toggle the selected class for styling
                if (checkbox.checked) {
                    this.classList.add("selected");
                } else {
                    this.classList.remove("selected");
                }

                // Check if all checkboxes are checked or not
                updateSelectAllButtonState();
                event.stopPropagation(); // Prevent the click event from propagating to the "Select All" button
            }
        });
    }

    // Function to enter selection mode
    function enterSelectionMode() {
        toggleImageCheckboxes("block");
        isImageModalEnabled = false; // Disable the image modal
        isSelectionMode = true;

        // Select only the first image
        var firstImageCard = imageCards[0];
        firstImageCard.classList.add("selected");
        firstImageCard.querySelector(".image-checkbox").checked = true;

        // Check if all checkboxes are checked or not
        updateSelectAllButtonState();
    }

    // Function to exit selection mode
    function exitSelectionMode() {
        toggleImageCheckboxes("none");
        isImageModalEnabled = true; // Re-enable the image modal
        isSelectionMode = false;

        // Remove the border and unselect all images
        for (var i = 0; i < imageCards.length; i++) {
            imageCards[i].classList.remove("selected");
            imageCards[i].querySelector(".image-checkbox").checked = false;
        }

        // Uncheck the "Select All" button
        selectAllButton.checked = false;
    }

    // Function to select all images
    function selectAllImages() {
        for (var i = 0; i < imageCards.length; i++) {
            var imageCard = imageCards[i];
            var checkbox = imageCard.querySelector(".image-checkbox");

            // Check the checkbox and add the "selected" class to all images
            checkbox.checked = true;
            imageCard.classList.add("selected");
        }

        // Check the "Select All" button
        selectAllButton.checked = true;
    }

    // Function to update the "Select All" button state based on checkbox status
    function updateSelectAllButtonState() {
        var allChecked = true;
        for (var i = 0; i < imageCards.length; i++) {
            var checkbox = imageCards[i].querySelector(".image-checkbox");
            if (!checkbox.checked) {
                allChecked = false;
                break;
            }
        }
        selectAllButton.checked = allChecked;
    }

    // Add event listener to the buttons
    document.getElementById("selectButton").addEventListener("click", enterSelectionMode);
    document.getElementById("unselectButton").addEventListener("click", exitSelectionMode);
    document.getElementById("deleteButton").addEventListener("click", exitSelectionMode);
    selectAllButton.addEventListener("click", selectAllImages);
});

   <!-- Add this JavaScript code to your home.jsp -->
function deleteImages() {
    var selectedImages = [];
    var imageCheckboxes = document.querySelectorAll('.image-checkbox:checked');

    if (imageCheckboxes.length === 0) {
        alert("Please select at least one image to delete.");
        return;
    }

    // Show a confirmation dialog
    var confirmation = confirm("Are you sure you want to delete the selected images?");

    if (confirmation) {
        // If the user confirms, proceed with deletion
        imageCheckboxes.forEach(function (checkbox) {
            selectedImages.push(checkbox.value);
        });

        // Set the selected image filenames in the hidden input field
        document.getElementById("selectedImagesInput").value = selectedImages.join(",");

        // Submit the form to the ImageDeleteServlet
        document.getElementById("deleteImagesForm").submit();
    } else {
        // If the user clicks "Cancel" (no), unselect the images
        var imageCheckboxes = document.querySelectorAll('.image-checkbox:checked');
        imageCheckboxes.forEach(function (checkbox) {
            checkbox.checked = false;
        });
        document.getElementById("unselectButton").style.display = "none";
        document.getElementById("deleteButton").style.display = "none";
        isFirstImageSelected = false;
    }
}



function displaySelectedFileNames() {
    var fileInput = document.getElementById("file");
    var selectedFileName = document.getElementById("selectedFileName");
    
    if (fileInput.files.length > 0) {
        var fileNames = [];
        for (var i = 0; i < fileInput.files.length; i++) {
            fileNames.push(fileInput.files[i].name);
        }
        selectedFileName.textContent = fileNames.join(", ");
    } else {
        selectedFileName.textContent = "No file chosen";
    }
}


</script>

<jsp:include page="footer.jsp" />
</body>
</html>
