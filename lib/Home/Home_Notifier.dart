import 'package:flutter/cupertino.dart';

class Home_Notifier extends ChangeNotifier{
  int value = 0;
  int? value2;
  int value1 = 0;

  void setStates(int val){
      value = val;
      notifyListeners();
  }

  void setValue1(int val){
    value1 = val;
    notifyListeners();
  }

  void set(int val){
    value2 = val;
    notifyListeners();
  }
}