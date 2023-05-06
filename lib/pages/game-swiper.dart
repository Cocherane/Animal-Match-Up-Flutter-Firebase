import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';

class GameSwiper extends StatefulWidget {
  GameSwiper({super.key});

  @override
  State<GameSwiper> createState() => _GameSwiperState();
}

class _GameSwiperState extends State<GameSwiper> {
  int page = 0;
  String fullName = '';
  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // providers
    final gameProvider = Provider.of<GameProvider>(context);
    // page swiper
    final pages = [
      Container(
        color: SharedConstants.colorGreyText,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/tropicalbird.png',
              width: kIsWeb ? 400 : double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            Column(
              children: <Widget>[
                Text("Hi !!!",
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("It's Brain challenger",
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
                Text('')
              ],
            )
          ],
        ),
      ),
      Container(
        
        color: Colors.deepPurpleAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/tropicalbird.png',
              width: kIsWeb ? 400 : double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            Column(
              children: <Widget>[
                Text("The game is about",
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("uncovering ",
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("pairs of cards",
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
      SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/winner.png',
                width: kIsWeb ? 400 : double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(padding: const EdgeInsets.all(20.0)),
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 10),
                      child: gameProvider.userName == '' || gameProvider.userName == null
                          ? Column(
                              children: [
                                Text("Enter a nickname to play",
                                    style: SharedConstants.getItimFontGoogle
                                        .copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                TextFormField(
                                  // decoracion del widget decoration
                                  // OJO copyWith anade mas funcionadlidad a el style
                                  decoration: SharedConstants
                                      .textInputDecoration
                                      .copyWith(
                                          labelText: 'Nickname',
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                  onChanged: (value) {
                                    setState(() {
                                      fullName = value;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                SharedConstants.colorPink,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                        onPressed: () =>
                                            register(context, gameProvider),
                                        child: Text(
                                          'Register',
                                          style: SharedConstants
                                              .getItimFontGoogle
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                        ))),
                              ],
                            )
                          : Column(
                              children: [
                                Text("Welcome ${gameProvider.userName}",
                                    style: SharedConstants.getItimFontGoogle
                                        .copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                SharedConstants.colorPink,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                        onPressed: () => {
                                              Navigator.pushReplacementNamed(
                                                  context, 'menu')
                                            },
                                        child: Text(
                                          'PLAY',
                                          style: SharedConstants
                                              .getItimFontGoogle
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                        ))),
                              ],
                            )),
                ],
              )
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
        body: Stack(children: [
      LiquidSwipe(
        pages: pages,
        slideIconWidget: Icon(Icons.arrow_back_ios),
        fullTransitionValue: 500,
        enableSideReveal: true,
        enableLoop: false,
        onPageChangeCallback: (activePageIndex) {
          setState(() {
            page = activePageIndex;
          });
        },
        ignoreUserGestureWhileAnimating: true,
      ),
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(pages.length, _buildDot),
            ),
          ],
        ),
      ),
    ]));
  }

  // widget to dhow dot pages
  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  // Register funtion activation
  void register(BuildContext contex, GameProvider gameProvider) async {
    if (fullName.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Nickname is required')));
    } else {
      print(fullName);
      gameProvider.userName = fullName;
      await gameProvider.saveUserName(fullName);
      Navigator.pushReplacementNamed(context, 'menu');
    }
    // if (formKey.currentState!.validate()) {
    //   setState(() {
    //     // _isLoading = true;
    //   });

    // llamar al servicio para registrar el usuario
    //   await authService
    //       .registerUserWithEmailandPassword(fullName, email, password)
    //       .then((value) async {
    //     if (value == true) {
    //       // saving the shared preferences
    //       // save the user is logged in
    //       await HelperFunctions.saveUserLoggedInStatus(true);
    //       // set user email save
    //       await HelperFunctions.saveUserEmailSF(email);
    //       // set user name save
    //       await HelperFunctions.saveUserNameSF(fullName);
    //       // pass next page HomePage
    //       nextScreen(context, const HomePage());

    //     } else {
    //       // mesaje de widgets folder
    //       showSnackBar(context, value, Colors.red);
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     }
    //   });
    // }
  }
}
