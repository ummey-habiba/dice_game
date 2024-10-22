import 'dart:math';

import 'package:dice_game/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceGameState extends StatelessWidget {
  const DiceGameState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Consumer<DiceProvider>(
        builder:(context, provider , child) =>  Column(
          children: [
            Text('Total Point =${provider.point}'),
            Text('Dice Sum =${provider.dicesum}'),
            Text('Target =${provider.target}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dice(facevalue: '${provider.faceValue1}'),
                Dice(facevalue: '${provider.faceValue2}'),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: provider.isGameRunning ? provider.rollTheDice : null,
              child: Text('ROLL'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: provider.isGameRunning|| provider.isGameFinish ? provider.reset: null,
              child: Text('RESET'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: provider.isGameFinish ? null : () {
                provider.reset();
                Navigator.pop(context);
              },
              child: Text('FINISH'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              provider.status,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  const Dice({super.key, required this.facevalue});

  final String facevalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5.0),
      color: Colors.red,
      child: Text(
        facevalue,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      height: 100,
      width: 100,
    );
  }
}
