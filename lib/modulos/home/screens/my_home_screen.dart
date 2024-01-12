import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/modulos/home/screens/tasks_popup.dart';

import '../../../domain/entities/home.dart';
import '../../../domain/entities/task.dart';
import '../../../presentation/shared/widgets/side_menu.dart';
import '../../../presentation/shared/widgets/weekDay_card.dart';
import '../../tasks/screens/task_controller.dart';
import 'home_controller.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  static const name = 'my-home-screen';


  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Home', style: Theme.of(context).textTheme.titleMedium),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tareas semanales'),
                const SizedBox(height: 16.0),
                _containerWeekDays(context),

                SizedBox(height: 16.0),
                _containerTodayTasks(context),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  color: Colors.orange,
                  child: Center(
                    child: Text('Contenedor 3'),
                  ),
                ),

                // Agrega más elementos según sea necesario
              ],
            ),
          ),
        ),
        drawer: SideMenu(scaffoldKey: scaffoldKey),
      ),
    );
  }
}

_containerTodayTasks(BuildContext context) {
final tasks = getTasks();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Tareas de hoy'),
      const SizedBox(height: 16.0),
      Container(
        decoration: BoxDecoration(
          color: Colors.white10,  // Color de fondo del Container
          borderRadius: BorderRadius.circular(10.0),  // Radio de redondeo de las esquinas
        ),
        child: SizedBox(
          height: 100.0,
          child: FutureBuilder(
            future: tasks,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Acción que se realiza al tocar la tarea
                        print('Tocaste la tarea: ${snapshot.data[index].task!.name}');
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,  // Agrega el estado del checkbox según tus necesidades
                            onChanged: (bool? value) {
                              // Acción que se realiza al cambiar el estado del checkbox
                              print('Estado del checkbox: $value');
                            },
                          ),
                          Text(
                            snapshot.data[index].task!.name,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),

      ),

    ],
  );
}

Future<dynamic> getTasks()  async {
  final TaskController taskController = TaskController();
  return await taskController.getDayTasks(DateTime.now());

}

_containerWeekDays(BuildContext context) {
  final HomeController homeController = HomeController();
  final weekDays = homeController.getWeekDays();
  final DateTime now = DateTime.now();
  final stringWeekdays = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];

  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          return GestureDetector(
            onTap: () {
              _showPopup(context,weekDays[index]);
            },
            child: WeekDayCard(
              day: weekDays[index].day,
              weekDay: stringWeekdays[index],
              haveTask: true,
              isToday: weekDays[index]==now.day,
            ),
          );
        }),
      )
  );
}

Future<void> _showPopup(BuildContext context, DateTime currentDay) async {

  TaskController taskController = TaskController();
  final tasks = await taskController.getDayTasks(currentDay);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TasksPopup(tasks: tasks,);
    },
  );
}
