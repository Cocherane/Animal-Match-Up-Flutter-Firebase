import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:parctica6_app_memory/widgets/curved-list.dart';
import 'package:provider/provider.dart';

import '../provider/game-provider.dart';

class GameRecords extends StatelessWidget {
  const GameRecords({super.key});

  @override
  Widget build(BuildContext context) {
    // provider
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Records',
            style: SharedConstants.getItimFontGoogle.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: SharedConstants.colorGreyText,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
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
        ),
        body: gameProvider.isRecordLoading
            ? Center(child: CircularProgressIndicator())
            : records(gameProvider));
  }

  records(GameProvider gameProvider) {
    return ListView.builder(
                  itemCount: gameProvider.records.length,
                  itemBuilder: ((context, index) {
                    return CurvedListItem(
                        name: gameProvider.records[index]['name'],
                        score: gameProvider.records[index]['score'],
                        position: index);
                  }),
                );
  }
}
