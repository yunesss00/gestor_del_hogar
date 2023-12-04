import '../../core/states_managment/state_manager.dart';
import 'package:flutter/foundation.dart';

class ListenableBean<T> {
  ListenableBean();

  ValueNotifier<T> getListenable(){
    return StateManager.getListenableBean<T>(this as T);
  }
}