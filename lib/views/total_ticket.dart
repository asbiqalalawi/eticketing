import 'package:flutter/widgets.dart';

class TotalTiket with ChangeNotifier {
  int _jmlTiket = 0;

  int get jmlTiket => _jmlTiket;
  set jmlTiket(int value) {
    _jmlTiket = value;
    notifyListeners();
  }
}
