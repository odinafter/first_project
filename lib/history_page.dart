import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    Key? key,
    required this.myName,
    required this.mySurname,
    required this.myAge,
    required this.moneyAmount,
  }) : super(key: key);

  final String myName;
  final String mySurname;
  final int myAge;
  final double moneyAmount;

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My history'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ชื่อ: ${widget.myName} นามสกุล: ${widget.mySurname}'),
          Text('อายุ: ${widget.myAge} ปี'),
          Text('เงิน: ${widget.moneyAmount} ล้าน'),
        ],
      ),
    );
  }
}
