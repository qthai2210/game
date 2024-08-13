import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  // random number
  List<int> numbers = List.generate(50, (index) => index + 1)..shuffle();
}
