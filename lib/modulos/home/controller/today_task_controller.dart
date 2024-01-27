import '../../../core/states_managment/state_manager.dart';

class TodayTaskController {
  final _value = StateManager.getListenableBean<int>(0);

  int get value => _value.value;

  void setValue(int value) {
    _value.value = value;
  }
}