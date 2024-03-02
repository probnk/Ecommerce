import 'package:flutter/cupertino.dart';

class FavouriteNotifier extends ChangeNotifier{

  int selected = 1;
  bool isSelected = false;

  void changeState(){
      isSelected = !isSelected;
      notifyListeners();
  }

  void increament(){
    selected++;
    notifyListeners();
  }

  void decrement(){
    selected--;
    notifyListeners();
  }

}