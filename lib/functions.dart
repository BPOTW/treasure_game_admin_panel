import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

void updateUsersData(
    String userKey, String keyOne, bool valueOne, int increment) async {
  try {
    Map<String, dynamic> data = await getData();
    WriteBatch batch = firestore.batch();

    DocumentReference gameData =
        firestore.collection('MainGameData').doc('gamedata');
    DocumentReference userData =
        firestore.collection('MainUsersData').doc(userKey);

    batch
        .update(gameData, {'joinedplayers': data['joinedplayers'] + increment});
    batch.update(userData, {keyOne: valueOne});
    batch.commit();
    print('Batch Data updated successfully');
  } catch (error) {
    print(error);
  }
}

Future<Map<String, dynamic>> getData() async {
  DocumentReference docRef =
      firestore.collection('MainGameData').doc('gamedata');
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
    await firestore.collection('MainGameData').doc('gamedata').update({
      key: Value,
    });
    print('Game Data Updated');
  } catch (error) {
    print('Failed to update Game Data With Error ${error}');
  }
}
