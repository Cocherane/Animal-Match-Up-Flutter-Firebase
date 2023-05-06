import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';

class DialogLoser {
  static Future<void> dialogBuilder(BuildContext context) {
    // set provider
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 10, bottom: 5, left: 0, right: 0),
          // contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
            children: [
              Image.asset(
                'assets/fail.png',
                fit: BoxFit.fill,
              ),
              Text(
                'Game Over!!!',
                style: SharedConstants.getItimFontGoogle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: SharedConstants.colorGreyText),
              ),
            
            ],
          ),
          // content: SingleChildScrollView(
          //     child: Column(
          //   children: [
          //     Text(dataCardDetailsById['description'] * 2,
          //         style: SharedConstants.getItimFontGoogle,
          //         textAlign: TextAlign.justify),
          //     SizedBox(
          //       height: 250,
          //     ),
          //   ],
          // )),
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
                gameProvider.blockAllFlipCard = false;
                gameProvider.restarGameProvider();
              },
            ),
          ],
        );
      },
    );
  }
}
