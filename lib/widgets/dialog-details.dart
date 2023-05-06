import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:parctica6_app_memory/widgets/game-winner.dart';
import 'package:provider/provider.dart';

class DialogDetails {
  static Future<void> dialogBuilder(BuildContext context) {
    // set provider
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    // set a variable card data
    Map<String, dynamic> dataCardDetailsById =
        gameProvider.objectsGridGame[gameProvider.detailsCard];

    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 0, bottom: 5, left: 0, right: 0),
          // contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
            children: [
              FadeInImage(
                placeholder: Image.asset('assets/loading.gif').image,
                image: NetworkImage(dataCardDetailsById['imgUrlPoster'] ?? dataCardDetailsById['imgUrl'])
              ),
              // Image.network(
              //   dataCardDetailsById['imgUrlPoster'] ?? dataCardDetailsById['imgUrl'],
              //   fit: BoxFit.fill,
              // ),
              Text(
                dataCardDetailsById['name'],
                style: SharedConstants.getItimFontGoogle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: SharedConstants.colorGreyText),
              ),
              Text(
                dataCardDetailsById['title'],
                style: SharedConstants.getItimFontGoogle
                    .copyWith(color: SharedConstants.colorGreyText),
              )
            ],
          ),
          content: SingleChildScrollView(
              child: Column(
            children: [
              Text(dataCardDetailsById['description'] * 2,
                  style: SharedConstants.getItimFontGoogle,
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 250,
              ),
            ],
          )),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                minRadius: 30,
                child: Text(
                  'Close',
                  style: SharedConstants.getEx2FontGoogle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: SharedConstants.colorGrey),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (gameProvider.isWinner) {
                  DialogWinner.dialogBuilder(context);
                  // set winner status to false
                  gameProvider.isWinner = false;
                  
                }
              },
            ),
          ],
        );
      },
    );
  }
}
