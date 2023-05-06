import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:parctica6_app_memory/helpers/helpers-utils.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';

class CardSwitch extends StatefulWidget {
  // card data
  int cardDataId;
  CardSwitch({super.key, required this.cardDataId});

  @override
  State<CardSwitch> createState() => _CardSwitchState();
}

class _CardSwitchState extends State<CardSwitch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // gameProvider = Provider.of<GameProvider>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void restart() {
    // gameProvider = Provider.of<GameProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    bool isblockFlipcard =
        gameProvider.stateGridGameChoose.contains(widget.cardDataId) ||
            gameProvider.objectsGridGame[
                    HelpersUtils.getIdCardData(widget.cardDataId)]["isFound"] ==
                true;

    return FlipCard(
      // autoFlipDuration: Duration(seconds: 3),
      key: gameProvider.cardStateKeys[widget.cardDataId],
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      // side: isblockFlipcard
      //     ? CardSide.BACK
      //     : CardSide.FRONT, // The side to initially display.
      flipOnTouch: isblockFlipcard || gameProvider.blockAllFlipCard ? false : true,
      onFlipDone: (isFront) {
        if (isFront && !isblockFlipcard) {
          gameProvider.chooseCardPositionGrid(widget.cardDataId, context);
          print("${widget.cardDataId} ${isFront} IN ${isblockFlipcard}");
        } else {
          print("${widget.cardDataId} ${isFront} OUT ${isblockFlipcard}");
        }
      },
      // onFlip: () => gameProvider.chooseCardPositionGrid(widget.cardDataId),
      front: Container(
        child: CircleAvatar(
          backgroundColor: Color.fromRGBO(204, 133, 159, 0.6),//SharedConstants.colorGreyText.withOpacity(0.6),
          // backgroundImage: Image.asset('assets/question.png',).image,
          minRadius: 7,
          child: Image.asset('assets/question.png',),
          // child:  Text('${HelpersUtils.getIdCardData(widget.cardDataId)}', 
          // style: SharedConstants.getItimFontGoogle.copyWith(fontSize: 35, fontWeight: FontWeight.bold),
          // ),
        ),
      ),
      back: Container(
        child: CircleAvatar(
          backgroundColor: Colors.purple,
          backgroundImage: NetworkImage(gameProvider.objectsGridGame[
                    HelpersUtils.getIdCardData(widget.cardDataId)]["imgUrl"]),
        ),
      ),
    );
  }
}


// import 'dart:math';

// import 'package:flutter/material.dart';

// class FlipCard extends StatefulWidget {
//   FlipCard({super.key});

//   @override
//   State<FlipCard> createState() => _FlipCardState();
// }

// class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation _animation;
//   AnimationStatus _status = AnimationStatus.dismissed;

//   @override
//   Widget build(BuildContext context) {
//     _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _animation = Tween(end: 1.0, begin: 0.0).animate(_controller);

//     return Transform(
//       alignment: FractionalOffset.center,
//       transform: Matrix4.identity()
//         ..setEntry(3, 2, 0.0015)
//         ..rotateY(pi * _animation.value),
//       child: Card(
//         child: _animation.value <= 0.5
//             ? Container(
//                 color: Colors.deepOrange,
//                 width: 240,
//                 height: 300,
//                 child: const Center(
//                     child: Text(
//                   '?',
//                   style: TextStyle(fontSize: 100, color: Colors.white),
//                 )))
//             : Container(
//                 width: 240,
//                 height: 300,
//                 color: Colors.grey,
//                 child: Image.network(
//                   'https://www.kindacode.com/wp-content/uploads/2021/09/girl.jpeg',
//                   fit: BoxFit.cover,
//                 )),
//       ),
//     );
//   }
// }
