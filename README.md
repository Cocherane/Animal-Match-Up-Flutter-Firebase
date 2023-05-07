# Animal Match-Up

<a href="https://docs.flutter.dev/get-started/install/windows" target="_blank"><img src="https://img.shields.io/badge/Flutter-3.7.9-blue" alt="Flutter" /></a>
<a href="https://firebase.google.com/" target="_blank"><img src="https://img.shields.io/badge/Firebase%20Core-2.4.1-yellow" alt="Firebase" /></a>
<a href="https://docs.flutter.dev/get-started/install/windows" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://memorygame-2686f.web.app/#swiper" target="_blank"><img src="https://img.shields.io/badge/Check%20Web-v1.0.1-green" alt="Web" /></a> <br>
A new Flutter project with Firebase.

<p align="center">
  <a href="https://memorygame-2686f.web.app/#swiper" target="blank"><img src="https://raw.githubusercontent.com/Cocherane/Imagenpractica3/main/photo_2023-05-06_17-38-28.jpg" width="200" alt="Flutter" />
 
  </a>
  
   <img src="https://raw.githubusercontent.com/Cocherane/Imagenpractica3/main/undefined%20-%20Imgur.gif" width="200" height="445" alt="Flutter" />
  
</p>


<div align="center">
  <a href="https://www.youtube.com/watch?v=m4TaU1oLjHc"><img src="https://img.youtube.com/vi/m4TaU1oLjHc/0.jpg" alt="Watch the video"></a>
  <h4>Watch the video</h4>
</div>






## Description

"Animal Match-Up" is an engaging Flutter application that combines a matching game with an educational twist. The primary goal of the game is to find and match pairs of animals hidden behind cards. Once you successfully find a pair, you will be presented with a detailed description of the animal, enhancing your knowledge about different species.

As you progress through the game, your score will increase with each correct match, rewarding you with 500 points. However, be cautious as each incorrect guess will result in a deduction of 50 points. Strive to achieve the highest score possible and challenge yourself to improve your memory skills and animal knowledge.

To provide a seamless user experience, the application utilizes Firebase as its backend infrastructure. All user data, including scores and achievements, will be securely stored and synchronized across devices. Compete with other players and strive to reach the top of the global leaderboard, showcasing your memory and animal identification skills.

Embark on this exciting adventure with "Animal Match-Up" and let the challenge of matching pairs of animals entertain and educate you simultaneously.

## Installation

```bash
$ Flutter pub get
```

## Running the app
Step 1: Create a Firebase Project

    Go to the Firebase Console (console.firebase.google.com) and create a new project.

Step 2: Set up an Android App

    Click on the "Android" icon to add an Android app to your project.
    Provide your app's package name (usually in the form "com.example.appname").
    Download the google-services.json file provided by Firebase.

Step 3: Configure Android App

    Move the downloaded google-services.json file to the "android/app" directory of your Flutter project.

Step 3: Configure firebase in your project

    Replace the existing shared_constants.dart file with this updated code snippet, and make sure to update the placeholder values with the corresponding values from your google-services.json file.


```dart

     class SharedConstants {
        ...
        ...
        static String apiKey = "APIKEY FIREBASE";
        static String authDomain = "SOMETHING.firebaseapp.com";
        static String projectId = "PROJECT ID";
        static String storageBucket = "STORAGEappspotcom";
        static String messagingSenderId = "NUMBER MESSAGE SENDER ID";
        static String appId = "APP ID";
}
```

Step 4: Run the aplication

```bash
# development mode
$ flutter run 
```




For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
