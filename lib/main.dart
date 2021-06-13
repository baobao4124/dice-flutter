import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Quinn Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage()),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void setRandomDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setRandomDice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    setRandomDice();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'))),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    setRandomDice();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'))),
        ],
      ),
    );
  }
}
