import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:treasure_game_admin_panel/colors.dart';
import 'package:treasure_game_admin_panel/firebase_options.dart';
import 'package:treasure_game_admin_panel/functions.dart';
import 'package:treasure_game_admin_panel/widget_components.dart';
// import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Map<String, dynamic> values = {
  //   'payment_type': '',
  //   'joinEnable': false,
  //   'whatsapp': '00000000000',
  //   'game_remaining_time': '2025-01-07 12:00:00',
  //   'timeEnded': false,
  //   'register_end_time': '2025-01-01 01:00:00',
  //   'qrEnable': {},
  //   'buy_enable': false,
  //   'gameEnded': false,
  //   'answers': {},
  //   'data': {},
  //   'players': '0',
  //   'playersjoined': '0',
  //   'tasks': '0',
  //   'continueEnable': {},
  //   'game_start_time': '2025-01-01 12:00:00',
  //   'gamecompleted': {},
  //   'optionriddle': '0',
  //   'game': '',
  //   'joinedplayers': 0,
  //   'payment_name': 'zain ali',
  //   'totalIndex': '0',
  //   'prize_money': '0',
  //   'isGameOnline': false,
  //   'payment_number': '0'
  // };

  Map<String, dynamic> gameStates = {
    'gameEndTime': '',
    'gameStartTime': '',
    'gamePassBuyStartTime': '',
    'gamePassBuyEndTime': '',
    'isBuyingEnable': false,
    'isGameEnded': false,
    'isGameStarted': false,
    'players': 0,
    'playersLable': 'Players Lable',
    'prize': 0,
    'timerLable': 'Timer Lable',
    'trapCoordinates': GeoPoint,
    'trapRadius': 0,
    'warnStartRadius': 0,
    'paymentNumber': '',
    'paymentName': '',
    'paymentBank': '',
    'winnerGamePass': '',
    'winnerId': '',
    'winnerName': '',
    'winnerPhone': '',
  };


  Future<void> getLiveData() async {
    DocumentReference docRef =
        firestore.collection('gameData').doc('gameStates');
    docRef.snapshots().listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        setState(() {
          gameStates = snapshot.data() as Map<String, dynamic>;
        });
        // print(value);
      }
    });
  }

  @override
  void initState() {
    getLiveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(value);
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: appBar,
      //   title: Center(
      //     child: Text(
      //       'Treasure Hunt - Admin Panel',
      //       style:
      //           TextStyle(color: appBarTextColor, fontWeight: FontWeight.w600),
      //     ),
      //   ),
      // ),
      body: SizedBox(
        width: deviceWidth,
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              topSectionClass(data: gameStates),
              SizedBox(
                width: 10,
              ),
              bottomSectionClass()
            ],
          ),
        ),
      ),
    );
  }
}
