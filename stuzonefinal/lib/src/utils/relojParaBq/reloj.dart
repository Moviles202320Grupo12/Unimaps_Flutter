import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  bool isRunning = false;
  int seconds = 0;

  void startTimer() {
    isRunning = true;
    notifyListeners();
  }

  void stopTimer() {
    isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    seconds = 0;
    notifyListeners();
  }
}
