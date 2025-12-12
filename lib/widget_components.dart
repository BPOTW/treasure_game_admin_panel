import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:treasure_game_admin_panel/colors.dart';
import 'package:treasure_game_admin_panel/functions.dart';

class topSectionClass extends StatefulWidget {
  final Map data;
  topSectionClass({super.key, required this.data});

  @override
  State<topSectionClass> createState() => _topSectionClassState();
}

class _topSectionClassState extends State<topSectionClass> {
  int players = 0;
  int prize = 0;
  int awaitConfirmation = 0;

  bool buyOptionValue = false;
  bool joinOptionValue = false;
  bool endOptionValue = false;
  bool onlineOptionValue = false;

  final TextEditingController whatsapp_controller = TextEditingController();
  final TextEditingController payment_name_controller = TextEditingController();
  final TextEditingController payment_type_controller = TextEditingController();
  final TextEditingController payment_number_controller = TextEditingController();
  final TextEditingController playersLableController = TextEditingController();
  final TextEditingController timerLableController = TextEditingController();
  final TextEditingController trapCoordinatesController = TextEditingController();
  final TextEditingController trapRadiusController = TextEditingController();
  final TextEditingController trapWarnController = TextEditingController();

  Widget statisticsSection(
    int players,
    int prize,
    int awaitConfirmation,
  ) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: statisticsBoxColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
                ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Players',
                    style: TextStyle(
                        color: statisticsBoxSecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  Text(
                    players.toString(),
                    style: TextStyle(
                        color: statisticsBoxPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  )
                ]),
          ),
        ),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: statisticsBoxColor,
                ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Prize',
                    style: TextStyle(
                        color: statisticsBoxSecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  Text(
                    prize.toString(),
                    style: TextStyle(
                        color: statisticsBoxPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  )
                ]),
          ),
        ),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: statisticsBoxColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Awaiting Confirmation',
                    style: TextStyle(
                        color: statisticsBoxSecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  Text(
                    awaitConfirmation.toString(),
                    style: TextStyle(
                        color: statisticsBoxPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  )
                ]),
          ),
        ),
      ],
    );
  }

  Widget settingsSection(Map data) {
    setState(() {
      buyOptionValue = data['isBuyingEnable'];
      endOptionValue = data['isGameEnded'];
      onlineOptionValue = data['isGameStarted'];
      payment_name_controller.text = data['paymentName'];
      payment_type_controller.text = data['paymentBank'];
      payment_number_controller.text = data['paymentNumber'];
      playersLableController.text = data['playersLable'];
      timerLableController.text = data['timerLable'];
      timerLableController.text = data['timerLable'];
      trapCoordinatesController.text = data['trapCoordinates'].toString();
      trapRadiusController.text = data['trapRadius'].toString();
      trapWarnController.text = data['warnStartRadius'].toString();
    });
    return Container(
        decoration: BoxDecoration(
            color: settingsBoxColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Buy Option',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Switch(
                      value: buyOptionValue,
                      onChanged: (value) {
                        setState(() {
                          buyOptionValue = value;
                        });
                        updateGameData('isBuyingEnable', value);
                      },
                      activeTrackColor: switchActiveBackgroundColor,
                      activeColor: switchActiveKnobColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'End Game',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Switch(
                      value: endOptionValue,
                      onChanged: (value) {
                        setState(() {
                          endOptionValue = value;
                        });
                        updateGameData('isGameEnded', value);
                      },
                      activeTrackColor: switchActiveBackgroundColor,
                      activeColor: switchActiveKnobColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Is Online',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Switch(
                      value: onlineOptionValue,
                      onChanged: (value) {
                        setState(() {
                          onlineOptionValue = value;
                        });
                        updateGameData('isGameStarted', value);
                      },
                      activeTrackColor: switchActiveBackgroundColor,
                      activeThumbColor: switchActiveKnobColor,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(border: Border.all(color: borderColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time For Buy Option',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          data['gamePassBuyStartTime'].toDate().toString(),
                          style: TextStyle(
                              color: settingsBoxSecondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: settingsBoxSecondaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time For Buy Option',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          data['gamePassBuyEndTime'].toDate().toString(),
                          style: TextStyle(
                              color: settingsBoxSecondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: settingsBoxSecondaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time For Game Start',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          data['gameStartTime'].toDate().toString(),
                          style: TextStyle(
                              color: settingsBoxSecondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: settingsBoxSecondaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time For Game End',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          data['gameEndTime'].toDate().toString(),
                          style: TextStyle(
                              color: settingsBoxSecondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: settingsBoxSecondaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(border: Border.all(color: borderColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'WhatsApp Number',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData('whatsapp', whatsapp_controller.text);
                        },
                        controller: whatsapp_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'WhatsApp Number',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Receiving Name',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'payment_name', payment_name_controller.text);
                        },
                        controller: payment_name_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Receiver Name',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Receiving Number',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'payment_number', payment_number_controller.text);
                        },
                        controller: payment_number_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Receiver Number',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Receiving Account',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'payment_type', payment_type_controller.text);
                        },
                        controller: payment_type_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Receiver Account',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Players Lable',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'playersLable', playersLableController.text);
                        },
                        controller: playersLableController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Players Lable',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Timer Lable',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'timerLable', timerLableController.text);
                        },
                        controller: timerLableController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Timer Lable',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trap Coordinates',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        
                        controller: trapCoordinatesController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Trap Coordinates',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trap Radius',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'trapRadius', int.parse(trapRadiusController.text));
                        },
                        controller: trapRadiusController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Trap Radius',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trap Warn Radius',
                      style: TextStyle(
                          color: settingsBoxPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: TextField(
                        onTapOutside: (pointer) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {
                          updateGameData(
                              'warnStartRadius', int.parse(trapWarnController.text));
                        },
                        controller: trapWarnController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: textFieldFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: textFieldBorderColor)),
                          labelText: 'Trap Warn Radius',
                          labelStyle: const TextStyle(color: textFieldTextColor),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          statisticsSection(
            widget.data['players'],
            widget.data['prize'],
            widget.data['players'],
          ),
          SizedBox(
            width: 5,
          ),
          settingsSection(widget.data),
        ],
      ),
    );
  }
}

class bottomSectionClass extends StatefulWidget {
  const bottomSectionClass({super.key});

  @override
  State<bottomSectionClass> createState() => _bottomSectionClassState();
}

class _bottomSectionClassState extends State<bottomSectionClass> {
  List<bool> confirmPayment = [];
  List<bool> canceledPayment = [];
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  String selectedFilter = 'allplayers';

  Widget paymentConfirmationBox(String id, Map data, int index, bool val) {
    // print(data);
    confirmPayment.add(data['isPaymentVerified']);
    canceledPayment.add(data['paymentStatus'] == 'Payment Verification Failed' ? true : false);
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: usersBoxChildBoxColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name : ',
                        style: TextStyle(
                            color: usersBoxPrimaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data['name'],
                        style: TextStyle(
                            color: usersBoxSecondaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Phone No. : ',
                        style: TextStyle(
                            color: usersBoxPrimaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data['phoneNo'],
                        style: TextStyle(
                            color: usersBoxSecondaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Transaction ID',
                  style: TextStyle(
                      color: usersBoxPrimaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SelectableText(
                  data['transactionId'].toString(),
                  style: TextStyle(
                      color: usersBoxSecondaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Payment Status',
                  style: TextStyle(
                      color: usersBoxPrimaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  data['paymentStatus'],
                  style: TextStyle(
                      color: usersBoxSecondaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Payment Confirm : ',
                        style: TextStyle(
                            color: usersBoxPrimaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Switch(
                        value: confirmPayment[index],
                        onChanged: (value) {
                          setState(() {
                            confirmPayment[index] = value;
                          });
                          updateUsersData(id, 'isPaymentVerified', value, true);
                        },
                        activeTrackColor: switchActiveBackgroundColor,
                        activeThumbColor: switchActiveKnobColor,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Cancel Payment : ',
                        style: TextStyle(
                            color: usersBoxPrimaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Switch(
                        value: canceledPayment[index],
                        onChanged: (value) {
                          setState(() {
                            canceledPayment[index] = value;
                          });
                          updateUsersData(id, 'paymentStatus', value ? 'Payment Verification Failed' : 'Payment Verification In Progress', false);
                        },
                        activeTrackColor: switchActiveBackgroundColor,
                        activeThumbColor: switchActiveKnobColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainUsersDataBox() {
    return Container(
      height: 700,
      decoration: BoxDecoration(
          color: usersBoxColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
      child: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // print(snapshot.data!.docs);
            final List<QueryDocumentSnapshot<Object?>> docs;

            if (selectedFilter == 'allplayers') {
              docs = snapshot.data!.docs;
            } else if (selectedFilter == 'confirmpayment') {
              docs = snapshot.data!.docs.where((doc) {
                return doc['isPaymentVerified'] == false && doc['paymentStatus'] != 'Verified';
              }).toList();
              // docs = snapshot.data!.docs;
            } else if (selectedFilter == 'canceledpayment') {
              docs = snapshot.data!.docs.where((doc) {
                return doc['paymentStatus'] == 'Payment Verification Failed';
              }).toList();
            } else {
              docs = snapshot.data!.docs;
            }
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = docs[index].data() as Map<String, dynamic>;
                  String id = docs[index].id;
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: paymentConfirmationBox(id, data, index, false),
                  );
                });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    confirmPayment.clear();
    canceledPayment.clear();
    return SizedBox(
      width: 900,
      height: 800,
      child: Column(
        children: [
          SizedBox(height: 5,),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: usersBoxTitleBarColor,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedFilter = 'allplayers';
                        confirmPayment.clear();
                        canceledPayment.clear();
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'All Players',
                          style: TextStyle(
                              color: usersBoxSideBarTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 60,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: usersBoxSideBarBorderColor)),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedFilter = 'confirmpayment';
                        confirmPayment.clear();
                        canceledPayment.clear();
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Confirm Payment',
                          style: TextStyle(
                              color: usersBoxSideBarTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 60,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: usersBoxSideBarBorderColor)),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedFilter = 'byrank';
                        confirmPayment.clear();
                        canceledPayment.clear();
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Players By Rank',
                          style: TextStyle(
                              color: usersBoxSideBarTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 60,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: usersBoxSideBarBorderColor)),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedFilter = 'canceledpayment';
                        confirmPayment.clear();
                        canceledPayment.clear();
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Canceled Payment',
                          style: TextStyle(
                              color: usersBoxSideBarTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          mainUsersDataBox()
        ],
      ),
    );
  }
}
