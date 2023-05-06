import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedConstants {
  static TextStyle getItimFontGoogle = GoogleFonts.itim(
    color: Color.fromARGB(255, 52, 64, 79),
  );
  static TextStyle getEx2FontGoogle = GoogleFonts.exo2(
    color: Color.fromARGB(255, 52, 64, 79),
  );
  static Color colorGrey = Color.fromARGB(255, 52, 64, 79);

  static Color colorGreyText = Color.fromARGB(255, 111, 105, 134);

  static Color colorPink = Color.fromRGBO(204, 133, 159, 0.6);


  static InputDecoration textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorGreyText, width: 2)),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorGreyText, width: 2)),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorGreyText, width: 2)),
);


// Firebase setting

  static String apiKey = "APIKEY FIREBASE";

  static String authDomain = "SOMETHING.firebaseapp.com";

  static String projectId = "PROJECT ID";

  static String storageBucket = "STORAGE.appspot.com";

  static String messagingSenderId = "NUMBER MESSAGE SENDER ID";

  static String appId = "APP ID";


}
