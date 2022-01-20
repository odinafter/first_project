import 'package:flutter/material.dart';
import 'history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myName = 'Dsper';
  String mySurname = 'Fulcon';
  int oldCounter = 0;
  int myOld = 10;
  double moneyCounter = 0;
  double myMoney = 0;

  void increaseNumber() {
    setState(() {
      oldCounter = oldCounter + 5;
    });
  }

  void addMoney() {
    setState(() {
      moneyCounter = moneyCounter + 1.1;
    });
  }

  void decreaseNumber() {
    setState(() {
      oldCounter = oldCounter - 1;
    });
  }

  void decreseMoney() {
    setState(() {
      moneyCounter = moneyCounter - 1.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text('My info'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.account_circle, size: 150, color: Colors.purple),
            Text(
              'ชื่อ: $myName นามสกุล: $mySurname',
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'อายุ: $myOld ปี  เงิน: $myMoney ล้านบาท',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: increaseNumber,
                      child: const Text('ปุ่มเพิ่มอายุ'),
                    ),
                    const Text(
                      'อายุของฉัน(ปี)',
                    ),
                    Text(
                      '$oldCounter ปี',
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: decreaseNumber,
                      child: const Text('ปุ่มลบอายุ'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: addMoney,
                      child: const Text("กดเพื่อเพิ่มเงิน"),
                    ),
                    const Text(
                      'เงินของฉัน(ล้านบาท)',
                    ),
                    Text(
                      '${moneyCounter.toStringAsFixed(1)} ลบ.',
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: decreseMoney,
                      child: const Text('กดเพื่อลดเงิน'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      myMoney = moneyCounter;
                      myOld = oldCounter;
                    });
                  },
                  child: const Text('ยืนยัน'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(
                          myName: myName,
                          mySurname: mySurname,
                          moneyAmount: myMoney,
                          myAge: myOld,
                        ),
                      ),
                    );
                  },
                  child: const Text('ต่อไป'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
