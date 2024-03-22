Project Download and Installation Guide

Prerequisites

    PHP version: 8.1.10
    MySQL version: 8.0.30
    Composer installed

Step 1: Download the Project

    Open your web browser and navigate to https://github.com/saiful199324/devilsadvocate-project.
    Click on the "Code" button and choose the "Download ZIP" option.
    Extract the downloaded ZIP file to your desired location.

Step 2: Database Setup

    Navigate to the db folder within the extracted project.
    Locate the devilsadvocate.sql file.
    Create a database name devilsadvocate.
    Import the devilsadvocate.sql file into your MySQL (devilsadvocate) database using phpMyAdmin or any MySQL database management tool.

Step 3: Install Dependencies

    Make sure Composer is installed on your machine.
    Navigate to the project directory.
    Run composer update.

Step 4: Generate Laravel Key

    Run the command to generate a new application key. php artisan key:generate

Step 5: Autoload and Optimize

    Run the following commands:
    composer dump-autoload
    php artisan optimize

Step 6: Start the Development Server

    Run the command:php artisan serve

Step 7: Access the Application

    Open your web browser.
    Enter either http://127.0.0.1:8000 or http://localhost:8000 in the address bar.you can register as a new user or you can login
    email = cei.developer1@gmail.com	
    password = 12345678

Step 8: Explore the Application You should now see the User List in your browser.



Troubleshooting

    If any issues arise during the installation, If any need please contact with me.

Happy Coding!
