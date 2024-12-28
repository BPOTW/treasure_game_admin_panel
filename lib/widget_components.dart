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
  int joinedPlayers = 0;
  int prize = 0;
  int awaitConfirmation = 0;

  bool buyOptionValue = false;
  bool joinOptionValue = false;
  bool endOptionValue = false;
  bool onlineOptionValue = false;

  final TextEditingController whatsapp_controller = TextEditingController();
  final TextEditingController payment_name_controller = TextEditingController();
  final TextEditingController payment_type_controller = TextEditingController();
  final TextEditingController payment_number_controller =
      TextEditingController();

  Widget statisticsSection(
    int players,
    int joinedPlayers,
    int prize,
    int awaitConfirmation,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 250,
          height: 105,
          decoration: BoxDecoration(
              color: statisticsBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Players',
                  style: TextStyle(
                      color: statisticsBoxSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
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
        Container(
          width: 250,
          height: 105,
          decoration: BoxDecoration(
              color: statisticsBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Joined Players',
                  style: TextStyle(
                      color: statisticsBoxSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Text(
                  joinedPlayers.toString(),
                  style: TextStyle(
                      color: statisticsBoxPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                )
              ]),
        ),
        Container(
          width: 250,
          height: 105,
          decoration: BoxDecoration(
              color: statisticsBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Prize',
                  style: TextStyle(
                      color: statisticsBoxSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
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
        Container(
          width: 250,
          height: 105,
          decoration: BoxDecoration(
              color: statisticsBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Awaiting Confirmation',
                  style: TextStyle(
                      color: statisticsBoxSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
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
      ],
    );
  }

  Widget settingsSection(Map data) {
    setState(() {
      buyOptionValue = data['buy_enable'];
      joinOptionValue = data['joinEnable'];
      endOptionValue = data['gameEnded'];
      onlineOptionValue = data['isGameOnline'];
      whatsapp_controller.text = data['whatsapp'];
      payment_name_controller.text = data['payment_name'];
      payment_number_controller.text = data['payment_number'];
      payment_type_controller.text = data['payment_type'];
    });
    return Container(
        width: 900,
        height: 450,
        decoration: BoxDecoration(
            color: settingsBoxColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              width: 880,
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
                      updateGameData('buy_enable', value);
                    },
                    activeTrackColor: switchActiveBackgroundColor,
                    activeColor: switchActiveKnobColor,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 880,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Join Option',
                    style: TextStyle(
                        color: settingsBoxPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Switch(
                    value: joinOptionValue,
                    onChanged: (value) {
                      setState(() {
                        joinOptionValue = value;
                      });
                      updateGameData('joinEnable', value);
                    },
                    activeTrackColor: switchActiveBackgroundColor,
                    activeColor: switchActiveKnobColor,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 880,
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
                      updateGameData('gameEnded', value);
                    },
                    activeTrackColor: switchActiveBackgroundColor,
                    activeColor: switchActiveKnobColor,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 880,
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
                      updateGameData('isGameOnline', value);
                    },
                    activeTrackColor: switchActiveBackgroundColor,
                    activeColor: switchActiveKnobColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 880,
              height: 1,
              decoration: BoxDecoration(border: Border.all(color: borderColor)),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 880,
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
                        data['register_end_time'].toString(),
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
              height: 5,
            ),
            SizedBox(
              width: 880,
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
                        data['game_start_time'].toString(),
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
              height: 5,
            ),
            SizedBox(
              width: 880,
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
                        data['game_remaining_time'].toString(),
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
              height: 5,
            ),
            Container(
              width: 880,
              height: 1,
              decoration: BoxDecoration(border: Border.all(color: borderColor)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 880,
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
              height: 5,
            ),
            SizedBox(
              width: 880,
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
              height: 5,
            ),
            SizedBox(
              width: 880,
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
              height: 5,
            ),
            SizedBox(
              width: 880,
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
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          statisticsSection(
            int.parse(widget.data['players']),
            widget.data['joinedplayers'],
            int.parse(widget.data['prize_money']),
            (int.parse(widget.data['players']) - widget.data['joinedplayers'])
                as int,
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
      FirebaseFirestore.instance.collection('MainUsersData');
  String selectedFilter = 'allplayers';

  Widget paymentConfirmationBox(String id, Map data, int index, bool val) {
    confirmPayment.add(data['enable']);
    canceledPayment.add(data['paymenterror']);
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        width: 920,
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
                        'User Name : ',
                        style: TextStyle(
                            color: usersBoxPrimaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data['userid'],
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
                        data['phone'],
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
                Text(
                  data['transactionid'].toString(),
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
                          updateUsersData(id, 'enable', value, value ? 1 : -1);
                        },
                        activeTrackColor: switchActiveBackgroundColor,
                        activeColor: switchActiveKnobColor,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Payment Canceled : ',
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
                          print(id);
                          updateUsersData(id, 'paymenterror', value, 0);
                        },
                        activeTrackColor: switchActiveBackgroundColor,
                        activeColor: switchActiveKnobColor,
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
      width: 950,
      height: 450,
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

            final List<QueryDocumentSnapshot<Object?>> docs;

            if (selectedFilter == 'allplayers') {
              docs = snapshot.data!.docs;
            } else if (selectedFilter == 'confirmpayment') {
              docs = snapshot.data!.docs.where((doc) {
                return doc['enable'] == false && doc['paymenterror'] == false;
              }).toList();
              // docs = snapshot.data!.docs;
            } else if (selectedFilter == 'canceledpayment') {
              docs = snapshot.data!.docs.where((doc) {
                return doc['paymenterror'] == true;
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
      width: 1150,
      height: 500,
      child: Column(
        children: [
          Container(
            width: 1150,
            height: 50,
            decoration: BoxDecoration(
                color: usersBoxTitleBarColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Center(
              child: Text(
                'Users',
                style: TextStyle(
                    color: appBarTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 200,
                height: 450,
                decoration: BoxDecoration(
                    color: usersBoxTitleBarColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedFilter = 'allplayers';
                          confirmPayment.clear();
                          canceledPayment.clear();
                        });
                      },
                      child: SizedBox(
                        width: 150,
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
                    Container(
                      width: 150,
                      height: 1,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: usersBoxSideBarBorderColor)),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedFilter = 'confirmpayment';
                          confirmPayment.clear();
                          canceledPayment.clear();
                        });
                      },
                      child: SizedBox(
                        width: 150,
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
                    Container(
                      width: 150,
                      height: 1,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: usersBoxSideBarBorderColor)),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedFilter = 'byrank';
                          confirmPayment.clear();
                          canceledPayment.clear();
                        });
                      },
                      child: SizedBox(
                        width: 150,
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
                    Container(
                      width: 150,
                      height: 1,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: usersBoxSideBarBorderColor)),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedFilter = 'canceledpayment';
                          confirmPayment.clear();
                          canceledPayment.clear();
                        });
                      },
                      child: SizedBox(
                        width: 150,
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
                  ],
                ),
              ),
              mainUsersDataBox()
            ],
          )
        ],
      ),
    );
  }
}
