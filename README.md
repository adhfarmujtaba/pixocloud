**Project Description**:

**PixoCloud** is a web-based image management system, implemented using JavaServer Pages (JSP), designed to provide users with a seamless platform for efficient image file management. This application empowers users to upload, organize, view, and delete their image files in a user-friendly, secure, and organized environment.

**Project Features**:

1. **User Authentication**:
   - Users are required to log in, ensuring data security and individualized image management.

2. **Image Upload**:
   - Users can upload image files of various formats, including JPEG, PNG, GIF, WebP, and SVG. The system enforces file type validation.

3. **Duplicate File Handling**:
   - PixoCloud checks for duplicate original filenames to prevent overwriting existing images.

4. **Image Organization**:
   - Images are organized by associating them with the user's account, providing each user with a private collection of images.

5. **Database Integration**:
   - Image metadata (e.g., unique filename, original filename, and username) is stored in a relational database for efficient retrieval and management.

6. **Image Viewing**:
   - Users can view images individually in a user-friendly interface that supports navigation.

7. **Image Deletion**:
   - Users can easily delete images from their collection. The system also removes the image file from the server.

8. **Session Management**:
   - User sessions are managed to maintain user context and data security throughout their interactions with the system.

9. **File Size Limitation**:
   - PixoCloud enforces file size limitations to prevent excessively large uploads.

10. **Responsive Design**:
    - The user interface is designed to work seamlessly on various devices and screen sizes, including desktops, tablets, and mobile devices.

11. **Error Handling**:
    - Robust error handling and user-friendly error messages provide clear feedback to users in the event of any issues.

12. **Data Encryption**:
    - All user data and image metadata are encrypted to ensure data security and privacy.

13. **User Privacy**:
    - Images are private, and access is restricted to the user who uploaded them. Other users cannot access another user's data, even using links.

14. **Preventing Duplicate Images**:
    - PixoCloud enforces measures to prevent users from uploading duplicate images.

15. **Loading Spinner**: A loading spinner is implemented to enhance the user experience. It appears during image loading and other data processing operations. The spinner provides a visual indication that the system is working on a task, improving user feedback.

16. **Shimmer Effect**: The user interface features a shimmer effect on image cards, providing a subtle animated effect that adds a modern and engaging element to the design. This effect increases visual appeal and engagement on image grids.

17. **Profile Editing**: Users now have the capability to edit their profile information. They can update their full name, email address, physical address, and mobile number. This feature allows users to maintain up-to-date and accurate account information.

18. **Dynamic User Interface for Mobile Devices**: The application is designed to be responsive and user-friendly on various devices, including mobile phones and tablets. It ensures a consistent and optimized user experience across different screen sizes.

**Technologies Used**:

- **Java Servlets**: For server-side handling of HTTP requests, file uploads, and database interactions.
- **JavaServer Pages (JSP)**: For rendering dynamic web content.
- **MySQL**: As the relational database management system to store image metadata.
- **HTML, CSS, and JavaScript**: For front-end development and user interface.
- **Apache Tomcat**: As the web server and servlet container.
- **JDBC**: For Java Database Connectivity to interact with the MySQL database.

**Project Benefits**:

PixoCloud, the "Image Management System" built with JSP technology, offers an accessible and organized solution for users to store and manage their images. Users can access their image collection from any location with an internet connection, making it a versatile choice for individuals seeking to keep their images well-organized and readily accessible online. The robust authentication, secure database storage, data encryption, and user privacy features ensure that user data remains confidential and protected.

The project is designed with the potential for further enhancements, such as image tagging, sharing, and advanced searching capabilities, to provide an even richer user experience. The addition of loading spinners, shimmer effects, profile editing, and mobile responsiveness adds modern elements and usability to the application.





**Screenshots**:

**1. Login Page**:

![Login - Google Chrome 2023-10-26 12-58-56](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/bd65013d-08ad-4975-b2cf-2ee793ea8e7e)

**2. Registration Page**:

![User Registration - Google Chrome 2023-10-26 13-06-42](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/523667b8-86a2-4327-ba75-33e6d3d9ac4b)


**3. Redirect to login after Secessfull Registration**:

![Untitled desi](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/c1b93740-ff55-4694-acaa-e316fe1bc658)

**4.Home View**:

**1. Home Loading spinner**:

![Login - Google Chrome 2023-10-26 13-14-59](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/924a8739-93ef-4526-91bf-d1e34eccc529)

**2. Home Shimmer loading effect on Images and full view of home page**:

![home view](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/83611640-e291-4cd8-baea-2c16ad3ec567)

**5.Advanced Image Uploading with Multi-File Selection**:

![Untitled design](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/2716d153-c5c6-4ce6-bff2-9a559b227eb6)



**6.Select button For Select image one by one**:

![Select Button](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/6cee3966-eba4-4f70-ab73-fc80f41d0b2b)


**7.User can Select all images and also can Unselect them**:

![SelectAll and Unselect Button](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/c390764b-23c4-48d9-963f-7f919b8c8fe9)


**8.Delete Button with Warning Dialog box**:

![Delete button](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/2a0c0d2b-8cbf-4a31-99eb-768abc194c0c)


**9.full screen View and user can Download image and can  Scroll with Arrows**:

![full screen](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/12d6aa53-3bfb-48b1-b86f-1471b56b8d7b)


**10.Profile Avatar where user can update profile and can logout**:

![Avatar profile](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/e2bc984e-237a-4605-9b1c-a6f700259b63)

**1. Update Profile and after Update Profile view**:

![profile update](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/a0741b0c-ac96-41ff-ae30-82c891a919ee)

**2. Logout**:

![logout](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/343342a4-88a4-4178-947f-24ce5578ed67)


**11. User Data Privacy:**

**1.Data encryption.**

**2.Only User can see the images.**

**3.Images are private so another user Can see Data of any User even using links.**

**4.User Can not upload duplicate Images.**:

![Duplicate Warning](https://github.com/adhfarmujtaba/pixocloud/assets/114349895/f971a392-e30c-4ded-9612-e19afd2371d7)
