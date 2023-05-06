import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';

class CurvedListItem extends StatelessWidget {
  final name;
  final score;
  final position;
  CurvedListItem(
      {super.key,
      required this.name,
      required this.score,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: this.position%2 == 0 ? Theme.of(context).primaryColor : SharedConstants.colorPink,
      child: Container(
        decoration: BoxDecoration(
            color: this.position%2 == 0 ? SharedConstants.colorPink : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
        padding: EdgeInsets.only(left: 32, right: 50, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.name,
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('Score: ${this.score}',
                    style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            CircleAvatar(
              minRadius: 50,
              backgroundColor: Colors.white,
              child: this.position == 0 
              ? Image.asset(
                'assets/trophy.png',
                fit: BoxFit.cover,
              )
              : Text('${this.position + 1}', style: SharedConstants.getItimFontGoogle
                        .copyWith(fontSize: 35, fontWeight: FontWeight.bold ,color: SharedConstants.colorGreyText)
            ))
          ],
        ),
      ),
    );
  }
}
