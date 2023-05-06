import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';

class GameMenu extends StatelessWidget {
  GameMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // get provider
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.logout_outlined,
                  color: SharedConstants.colorGreyText),
              onPressed: () async {
                await gameProvider.signOut();
                Navigator.pushReplacementNamed(context, 'swiper');
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // first block
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi ${gameProvider.userName}',
                            style: SharedConstants.getItimFontGoogle.copyWith(
                                color: SharedConstants.colorGreyText,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        Text(
                            'Ready to take up the challenge of playing, learning and having fun.',
                            style: SharedConstants.getItimFontGoogle.copyWith(
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        minRadius: 40,
                        backgroundColor: Colors.white,
                        child: gameProvider.maxPoints == 0
                            ? Image.asset(
                                'assets/score_1.png',
                                fit: BoxFit.cover,
                              )
                            : Column(
                                children: [
                                  Text(
                                    '${gameProvider.maxPoints}',
                                    style: SharedConstants.getItimFontGoogle
                                        .copyWith(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                SharedConstants.colorGreyText),
                                  ),
                                  Text(
                                    'MAX SCORE',
                                    style: SharedConstants.getItimFontGoogle
                                        .copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: SharedConstants.colorPink),
                                  ),
                                ],
                              )))
              ],
            ),

            // seconds block
            SizedBox(
              height: 50,
            ),
            Container(
                width: kIsWeb ? 400 : double.infinity,
                height: kIsWeb ? 400 : MediaQuery.of(context).size.height - 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/tropicalbird.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    buttonMenu(context: context, provider: gameProvider),
                    buttonMenu(
                        name: 'RANKING',
                        icon: 'ranking',
                        navegacion: 'records',
                        context: context,
                        provider: gameProvider),
                    buttonMenu(
                        name: 'TUTORIAL',
                        icon: 'tutorial',
                        navegacion: 'tutorial',
                        context: context,
                        provider: gameProvider),
                    buttonMenu(
                        name: 'MORE...',
                        icon: 'more',
                        navegacion: 'more',
                        context: context,
                        provider: gameProvider),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Padding buttonMenu(
      {name = 'Play',
      icon = 'joystick',
      navegacion = 'game',
      var context,
      required GameProvider provider}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: (() {
          Navigator.pushNamed(context, navegacion);
          if (navegacion.toString() == 'records') {
            provider.loadDataRecords();
          }
        }),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 1),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  border: Border.all(
                      width: 1,
                      color: SharedConstants.colorGreyText.withOpacity(0.3)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 9)
                  ]),
              height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/${icon}.png',
                    fit: BoxFit.cover,
                  ),
                  Text(name.toString().toUpperCase(),
                      style: SharedConstants.getItimFontGoogle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: SharedConstants.colorGreyText,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
