import 'dart:math';

import 'package:flutter/foundation.dart';

class DiceProvider extends ChangeNotifier{
  final _random = Random();
  int _dicesum = 0, _target = 0, _faceValue1 = 1, _faceValue2 = 1, _point = 100;
  String _status = '';
  bool _isGameRunning = true;
  bool _isGameFinish = false;


  int get dicesum => _dicesum;

  get target => _target;

  get faceValue1 => _faceValue1;

  get faceValue2 => _faceValue2;

  get point => _point;

  String get status => _status;

  bool get isGameRunning => _isGameRunning;

  bool get isGameFinish => _isGameFinish;



  void rollTheDice() {

      _faceValue1 = _random.nextInt(6) + 1;
      _faceValue2 = _random.nextInt(6) + 1;
      _dicesum = _faceValue1 + _faceValue2;
      if (_target > 0) {
        if (_dicesum == _target) {
          _status = 'Player Wins!';
          _point += 100;
          _isGameRunning = false;
        } else if (_dicesum == 7) {
          _status = 'Player Loses!';
          _point -= 100;
          _isGameRunning = false;
          checkPoint();
        }
      }
      else {
        if(_dicesum ==7 || _dicesum == 11){
          _status ='Player Wins!';
          _point+=100;
          _isGameRunning= false;
        }
        else if(_dicesum ==2 || _dicesum == 3 || _dicesum == 12){
          _status ='Player Loses!';
          _point-=100;
          _isGameRunning= false;
          checkPoint();
        }
        else {_target ==_dicesum ;}
      }
 notifyListeners();
  }

  void reset() {

      _dicesum = 0;
      _faceValue2 = 1;
      _faceValue1 = 1;
      _target = 0;
      _status = '';
      _isGameRunning= true;
   notifyListeners();
  }

  void checkPoint() {
    if (_point == 0) {

        _isGameFinish = true;
    notifyListeners();
    }
  }
}