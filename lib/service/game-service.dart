import 'package:cloud_firestore/cloud_firestore.dart';

class GameService {
  // reference to the collection cards data
  final CollectionReference cardsCollection =
      FirebaseFirestore.instance.collection('cardsdata');
  // reference to the collection cards data
  final CollectionReference recordsCollection =
      FirebaseFirestore.instance.collection('records');

  // gettin user data
  Future getCardsData() async {
    QuerySnapshot querySnapshot = await cardsCollection.get();
    return querySnapshot.docs
        .map((e) => e.data() as Map<String, dynamic>)
        .toList();
  }

  // getting records data
  Future getRecordsData() async {
    QuerySnapshot querySnapshot = await recordsCollection.orderBy('score', descending: true).get();
    return querySnapshot.docs;
  }

  Future setRecordData(String name, int score) async {
    await recordsCollection.add({
      "name": name,
      "score": score,
      "date": DateTime.now().millisecondsSinceEpoch
    });
  }
}
