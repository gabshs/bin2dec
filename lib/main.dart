import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bin2Dec',
      home: Bin2Dec(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Bin2Dec extends StatefulWidget {
  @override
  _Bin2DecState createState() => _Bin2DecState();
}

class _Bin2DecState extends State<Bin2Dec> {
  String result = '0';
  final _decimalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    _convertValue() {
      result = '0';
      int binaryNumber = int.parse(_decimalController.text);
      int aux = 0;
      bool isBinary = true;

      for (int i = 0; i < _decimalController.text.length; i++) {
        if (_decimalController.text.contains(RegExp(r'^[10]+$'))) {
          aux += (binaryNumber % 10) * pow(2, i);
          binaryNumber = (binaryNumber / 10).floor();
          print((binaryNumber / 10).floor());
        } else {
          isBinary = false;
          print((binaryNumber / 10).floor());
          break;
        }
      }
      setState(() {
        isBinary ? result = aux.toString() : result = 'NAB (Bin)';
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size * 0.5,
                    width: double.infinity,
                    color: Colors.greenAccent,
                    padding: EdgeInsets.only(bottom: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Bin2Dec",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.black),
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          controller: _decimalController,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 70),
                          maxLength: 8,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '1101'),
                          keyboardType: TextInputType.number,
                        ),
                        Text(
                          'Binary',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size * 0.5,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Result",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.greenAccent),
                        ),
                        Text(
                          '$result',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(color: Colors.greenAccent),
                        ),
                        Text(
                          'Decimal',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.greenAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.43,
                left: MediaQuery.of(context).size.width * 0.37,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10, color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.refresh, color: Colors.greenAccent),
                    iconSize: 42,
                    onPressed: _convertValue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
