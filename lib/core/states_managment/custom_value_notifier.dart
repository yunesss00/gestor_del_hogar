import 'package:flutter/foundation.dart';

class CustomValueNotifier<T> extends ValueNotifier<T> {
  CustomValueNotifier(super.value);

  void notifyListeners() {
    print('Notify listeners');
    super.notifyListeners();
  }
}