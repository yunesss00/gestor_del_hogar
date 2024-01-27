import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';

import '../../../core/states_managment/custom_listenable_widget.dart';
import '../../../core/states_managment/state_manager.dart';
import '../../tasks/controller/task_controller.dart';

    TaskController taskController = TaskController();


class TodayTasksWidget extends StatefulWidget {
  final TodayTaskController controller = TodayTaskController();
  final AssignedTask task;
  final done = StateManager.getListenableBean<int?>(0);

  void setDone(int? value) {
    done.value = value;
  }

  TodayTasksWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  TodayTasksWidgetState createState() => TodayTasksWidgetState();
}

class TodayTasksWidgetState extends State<TodayTasksWidget> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.controller.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_value == 0) {
            _value = 1;
          } else {
            _value = 0;
          }
          widget.controller.setValue(_value);
        });
      },
      child: CustomListenableWidget(
        valueListenable: widget.controller._value,
        builder: (context, value, child) {
          return Checkbox(
            value: widget.controller._value.value == 1 ? true: false,
            onChanged: (newValue) async{
              final res = await _updateTask(widget.task.copyWith(done: _value==1 ? 0 : 1));  
              setState(() {
                if (res){
                  if (newValue == true) {
                  _value = 1;
                } else {
                  _value = 0;
                }
                widget.controller.setValue(_value);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al actualizar la tarea'),
                    ),
                  );
                }          
              });
            }
          );
        },
      ),
    );
  }
}

class TodayTaskController {
  final _value = StateManager.getListenableBean<int>(0);

  int get value => _value.value;

  void setValue(int value) {
    _value.value = value;
  }
}

Future<bool> _updateTask(AssignedTask task) async{
    return await taskController.updateAssignedTask(task);
  }
