# bizz_card

BizzCard is a simple application that i hade to do for gritlab.

The application shows a static card with your personal information.

This subject is divided into 3 parts. Overall objective is for you to learn about:

Applying the essence of Flutter - widgets.
Basic structure of a Flutter app.
How to run Flutter on physical devices or Android/iOS emulator.
Note: only standard Flutter packages and url_launcher (for bonus) are allowed.

First Part

To create your first Flutter application open Android Studio or a similar IDE and follow the steps:

Open the IDE and select Start a new Flutter project.
Select Flutter Application as the project type. Then click Next.
Specify the path to Flutter SDK’s location (select Install SDK… if the text field is blank).
Enter the project name (for example, myapp). Then click Next.
Click Finish.
Wait for Android Studio to install the SDK and create the project.
See the Run the app section here to run a sample app.

The starter point in Flutter app is in lib/main.dart. Change this file to change the app's behavior.

Second Part:

You must display the following information in the BizzCard:

First Name
Last Name
Age
Phone number
Email
Photo/Image
Here is an example of what we are asking:
<!-- <center> -->
<center>
<img src="./resources/bizzCard.01.png?raw=true" style = "width: 210px !important; height: 420px !important;"/>
<!-- </center> -->
</center>


All the following features must be present:

Include an AppBar with the backgroundColor set to blueAccent and with a title "BizzCard"
Display a profile picture with a circular shape.
Show First Name and Last Name in bold with font size 30.
Show Age, email, and phone number with font size 20.
Possible diagram of a widget tree for the app.

Hints
Learn about these:

AppBar which is a built-in Flutter widget that provides a Material Design app bar for the top of the screen.
Column to align text in a card
Stack to place image on Container
Padding to add paddings to Container
Use DecorationImage inside BoxDecoration to style image
Bonus
Add a QR code below the image, so that anyone can scan it and get your full contact.
Use local assets to store the images.
Include icons in the AppBar and info, i.e., notifications, menu options, phone number and email.