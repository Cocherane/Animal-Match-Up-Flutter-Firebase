import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/pages/game-details.dart';
import 'package:parctica6_app_memory/pages/game-menu.dart';
import 'package:parctica6_app_memory/pages/game-more.dart';
import 'package:parctica6_app_memory/pages/game-panel.dart';
import 'package:parctica6_app_memory/pages/game-records.dart';
import 'package:parctica6_app_memory/pages/game-swiper.dart';
import 'package:parctica6_app_memory/pages/game-tutorial.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';

import 'package:window_size/window_size.dart';



void main() async {
  // inicializar firebase
  WidgetsFlutterBinding.ensureInitialized();
  // inicializador si solo es en una aplicaciom movil
  // await Firebase.initializeApp();
  

  // para inicializar en todas las aplicaciones
  if (kIsWeb) {
    // run the web aplicacion
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: SharedConstants.apiKey,
            appId: SharedConstants.appId,
            messagingSenderId: SharedConstants.messagingSenderId,
            projectId: SharedConstants.projectId));
  } else {
    // run the mobil aplicacion
    await Firebase.initializeApp();
  }

  

  // para darle un tamano fijo a la aplicacion en windows
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowTitle('My App');
  //   setWindowMaxSize(const Size( 606 , 1280));
  //   setWindowMinSize(const Size(606 , 1280));
  // }

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameProvider(), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(240, 230, 218, 1),
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 230, 218), // Color.fromARGB(255, 248, 241, 241),
        
      ),
      initialRoute: 'swiper',
      routes: {
        'game':(context) => GamePanel(),
        'records':(context) => GameRecords(),
        'details':(context) => GameCardDetails(),
        'menu':(context) => GameMenu(),
        'more':(context) => GameMore(),
        'tutorial':(context) => GameTutorial(),
        'swiper': (context) => GameSwiper()
      },
    );
  }
}
