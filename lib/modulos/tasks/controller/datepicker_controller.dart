import '../../../core/states_managment/state_manager.dart';

class DatePickerController {
  final selectedDate = StateManager.getListenableBean<DateTime>(DateTime.now());
  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
    selectedDate.notifyListeners();
  }

  void clearSelectedDate() {
    selectedDate.value = DateTime.now();
    selectedDate.notifyListeners();
  }


}