import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';
import '../widgets/flip-card.dart';

class GamePanel extends StatelessWidget {
  late FlipCardController _controller;

  GamePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
      
        title: Text('Brain challenger',
            style: SharedConstants.getItimFontGoogle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: SharedConstants.colorGreyText)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,   
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.arrow_back,
                    color: SharedConstants.colorGreyText,
                  )),
            ),
          ), 
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: (() {
                    gameProvider.restarGameProvider();
                  }),
                  icon: Icon(
                    Icons.refresh,
                    color: SharedConstants.colorGreyText,
                  )),
            ),
          ),
        ],
      ),
      body: gameProvider.isPanelLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(171, 100, 100, 104)
                                          .withAlpha(60),
                                      blurRadius: 6.0,
                                      spreadRadius: 10,
                                      offset: Offset(
                                        0.0,
                                        3.0,
                                      ),
                                    ),
                                  ]),
                              child: CircleAvatar(
                                // backgroundColor: SharedConstants.colorGrey.withOpacity(0.4),
                                radius: 39,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 37,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        gameProvider.points.toString(),
                                        style: SharedConstants.getEx2FontGoogle
                                            .copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                color: SharedConstants
                                                    .colorGreyText),
                                      ),
                                      Text(
                                        'Score',
                                        style: SharedConstants.getEx2FontGoogle
                                            .copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: SharedConstants
                                                    .colorGreyText),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    width: kIsWeb ? 350 : double.infinity,
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 4,
                      children: List.generate(20, (index) {
                        // choose index position sorted
                        int cardDataId = gameProvider.positionGridCard[index];
                        return Container(
                            // color: Colors.red,
                            child: Center(
                                child: CardSwitch(
                          cardDataId: cardDataId,
                        )));
                      }),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
