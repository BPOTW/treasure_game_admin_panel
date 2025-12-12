import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

void updateUsersData(
    String docId, String keyOne, var valueOne, bool val) async {
  try {
    print(keyOne);
    print(valueOne);
    WriteBatch batch = firestore.batch();

    DocumentReference userData =
        firestore.collection('users').doc(docId);
    String paymentStatus = val ? (valueOne ? 'Verified' : 'Not Verified') : valueOne;
    print(paymentStatus);
    !val ? batch.update(userData, {'isPaymentVerified': false}) : (){};
    batch.update(userData, {keyOne: valueOne, 'isGamePassEnable': (paymentStatus == 'Verified' ? true : false), 'paymentStatus':paymentStatus});
    batch.commit();
    print('Batch Data updated successfully');
  } catch (error) {
    print(error);
  }
}

Future<Map<String, dynamic>> getData() async {
  DocumentReference docRef =
      firestore.collection('gameData').doc('gameStates');
  Map<String, dynamic> value = {};
  try {
    // Fetch the document once
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      value = data;
    } else {
      print("Document does not exist!");
      value = {};
    }
  } catch (e) {
    print("Error fetching document: $e");
    value = {};
  }
  return value;
}

void updateGameData(String key, var Value) async {
  try {
    await firestore.collection('gameData').doc('gameStates').update({
      key: Value,
    });
    print('Game Data Updated');
  } catch (error) {
    print('Failed to update Game Data With Error ${error}');
  }
}
