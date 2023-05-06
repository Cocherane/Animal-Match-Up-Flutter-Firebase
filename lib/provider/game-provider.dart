import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/helpers/helpers-utils.dart';
import 'package:parctica6_app_memory/service/game-service.dart';
import 'package:parctica6_app_memory/widgets/dialog-details.dart';
import 'package:parctica6_app_memory/widgets/game-loser.dart';
import 'package:parctica6_app_memory/widgets/game-winner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier {
  // Varibles for state changes
  bool isPanelLoading = true;
  bool isRecordLoading = true;
  GameService service = GameService();
  String? userName;
  int detailsCard = 0;
  List<int> stateGridGameChoose = [];
  bool blockAllFlipCard = false;
  List<int> positionGridCard = [];
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  int numberOfCardFounds = 0;
  int numberOfFails = 0;
  int points = 500;
  int maxPoints = 0;
  bool isWinner = false;
  int winnerPoint = 0;
  List<QueryDocumentSnapshot<Object?>> records = [];
  List<Map<String, dynamic>> objectsGridGame = [
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
    {"isFound": false},
  ];

  // int isObjectGridActive(int position) {

  // }
  // init peovider
  GameProvider() {
    // initialize sort position grid card
    generateCardPosition();
  }

  // generate card position
  void generateCardPosition() async {
    // BORARRRRR TESTING
    // await saveUserName("Ariel");
    await service.getRecordsData();
    // BORARRRRR TESTING

    // call service to get card data
    objectsGridGame = await service.getCardsData();
    // is loading panel card is inactive
    isPanelLoading = false;
    // generate card position
    positionGridCard = List<int>.generate(20, (index) => index);
    positionGridCard.shuffle();
    // generate card state keys
    cardStateKeys = List<GlobalKey<FlipCardState>>.generate(
        20, (_) => GlobalKey<FlipCardState>());
    // get user name from SharedPreferences
    userName = await getUserName();
    maxPoints = await getUserScore() ?? 0;
    notifyListeners();
  }

  restarGameProvider() async {
    // initialize sort position grid
    // generateCardPosition();
    // set winner status to false
    isWinner = false;
    // all points, card found, fails number to initial values
    numberOfCardFounds = 0;
    numberOfFails = 0;
    points = 500;
    // card choose stored position to empty
    stateGridGameChoose = [];
    // set all card data isFound to false
    for (var cardData in objectsGridGame) {
      cardData['isFound'] = false;
    }
    // set all card to default position
    for (var element in cardStateKeys) {
      if (!element.currentState!.isFront) {
        element.currentState!.toggleCard();
      }
    }
    // sort position card
    await Future.delayed(
        const Duration(milliseconds: 500), (() => positionGridCard.shuffle()));

    notifyListeners();
  }

  // choose card position
  chooseCardPositionGrid(int id, BuildContext context) async {
    // check if there are one two positions selected in [stateGridGameChoose]
    if (stateGridGameChoose.isEmpty) {
      // add index to the stateGridGameChoose
      stateGridGameChoose.add(id);
    } else {
      // check if there are any match
      if (HelpersUtils.getIdCardData(stateGridGameChoose[0]) ==
          HelpersUtils.getIdCardData(id)) {
        // set match to objectsGridGame true
        objectsGridGame[HelpersUtils.getIdCardData(id)]["isFound"] = true;
        // add point to found a match
        numberOfCardFounds += 1;
        points += 50;
        // do a navigator to card details page
        detailsCard = HelpersUtils.getIdCardData(id);
        // Navigator.pushNamed(context, 'details');
        DialogDetails.dialogBuilder(context);
        // check if there is winner
        if (numberOfCardFounds == 10) {
          // set winnerPoint
          winnerPoint = points;
          // save record to database
          service.setRecordData(userName!, points);
          // set local score if it is upper than saved score
          var tempMaxScore = await getUserScore() ?? 0;
          if (tempMaxScore < points) {
            await saveUserScore(points);
            //save to maxScore
            setMaxScore(points);
          }
          // restar all cards
          restarGameProvider();
          // block all cards
          blockAllFlipCard = true;
          // set winner status to true
          isWinner = true;
          print('Winner: ');
        }
        print('POINT PLUS ${numberOfCardFounds}');
      } else {
        // save first choose card
        var tempChoose = stateGridGameChoose[0];
        // block all cards flip
        permitAllCardsFlip(true);
        // action to back card flip
        Future.delayed(const Duration(milliseconds: 500), () {
          cardStateKeys[id].currentState!.toggleCard();
          cardStateKeys[tempChoose].currentState!.toggleCard();
          permitAllCardsFlip(false);
        });

        // add a fail point
        numberOfFails += 1;
        points -= 25;
        // check if there is loser
        if (points == 0) {
          // sent a fail page
          DialogLoser.dialogBuilder(context);
          print('loser: ');
        }
        print('Fail point ${numberOfFails}');
      }
      // clean stateGridGameChoose to empty
      stateGridGameChoose.clear();
    }
    notifyListeners();
  }

  // block all cards
  permitAllCardsFlip(bool action) {
    blockAllFlipCard = action;
    notifyListeners();
  }

  // save score maxScore local to notifyListeners
  setMaxScore(int max) async {
    maxPoints = max;
    print(maxPoints);
    await saveUserScore(max);
    notifyListeners();
  }

  changeIsloadingRecord() {
    notifyListeners();
  }

  // load data of records
  loadDataRecords() async {
    service.getRecordsData().then((recordsData) {
      records = recordsData;
      isRecordLoading = false;
      notifyListeners();
    });
  }

  // sigout fron username
  signOut() async {
    userName = '';
    maxPoints = 0;
    await saveUserName('');
    await saveUserScore(0);
  }

  // set user name
  Future<bool> saveUserName(String userNameIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString('USERNAME', userNameIn);
  }

  // getting the user name from SF
  Future<String?> getUserName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    var name = sf.getString('USERNAME');
    return name;
  }

  // set user score
  Future<bool> saveUserScore(int userScore) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setInt('SCORE', userScore);
  }

  // getting the user score from SF
  Future<int?> getUserScore() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    var score = sf.getInt('SCORE');
    return score;
  }
}
