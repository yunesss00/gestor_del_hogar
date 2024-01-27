import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';
import 'package:gestor_del_hogar/modulos/home/screens/tasks_popup.dart';
import 'package:gestor_del_hogar/modulos/home/screens/today_tasks_widget.dart';
import 'package:gestor_del_hogar/presentation/shared/shared.dart';

import '../../../presentation/shared/widgets/weekDay_card.dart';
import '../../tasks/controller/task_controller.dart';
import '../controller/home_controller.dart';

HomeController homeController = HomeController();

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  static const name = 'my-home-screen';

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Mi hogar',
                style: Theme.of(context).textTheme.titleMedium),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mis tareas semanales'),
                const SizedBox(height: 16.0),
                FutureBuilder(
                  future: _containerWeekDays(context),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else {
                      return Container(); // Devuelve un Container vacío en lugar de un CircularProgressIndicator
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                _containerTodayTasks(context),
                const SizedBox(height: 16.0),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 16.0,
                )
                //_containerRecentChanges(context),

                // Agrega más elementos según sea necesario
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigation(key: scaffoldKey),
        drawer: SideMenu(scaffoldKey: scaffoldKey),
      ),
    );
  }

  _containerWeekDays(BuildContext context) async {
    final weekDays = homeController.getWeekDays();
    final DateTime now = DateTime.now();
    final stringWeekdays = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];

    final List<int> dotList = [];

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            return GestureDetector(
              onTap: () {
                _showPopup(context, weekDays[index]);
              },
              child: FutureBuilder<WeekDayCard>(
                future: buidCard(weekDays, index, stringWeekdays, dotList, now),
                builder: (BuildContext context,
                    AsyncSnapshot<WeekDayCard> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: Center(
                        child: Container(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return snapshot.data!;
                  }
                },
              ),
            );
          }),
        ));
  }

  Future<WeekDayCard> buidCard(List<DateTime> weekDays, int index,
      List<String> stringWeekdays, List<int> dotList, DateTime now) async {
    dotList = await _getDotWeekTasks();
    return WeekDayCard(
      day: weekDays[index].day,
      weekDay: stringWeekdays[index],
      haveTask: dotList[index] == 1
          ? true
          : false, // Access the elements using the index operator []
      isToday: weekDays[index].day == now.day,
    );
  }

  Future<List<int>> _getDotWeekTasks() async {
    final TaskController taskController = TaskController();
    final dotList = await taskController.getDotListTasks();
    return dotList!;
  }

  Future<void> _showPopup(BuildContext context, DateTime currentDay) async {
    TaskController taskController = TaskController();
    final tasks = await taskController.getMyDayTasks(currentDay);

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TasksPopup(
          tasks: tasks,
        );
      },
    );
  }

  _containerTodayTasks(BuildContext context) {
    final theme = Theme.of(context);
    final tasks = getTasks();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tareas de hoy'),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white10, // Color de fondo del Container
            borderRadius: BorderRadius.circular(
                10.0), // Radio de redondeo de las esquinas
          ),
          child: SizedBox(
            height: 200.0,
            width: MediaQuery.of(context).size.width - 16.0,
            child: FutureBuilder(
              future: tasks,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return const Center(
                      child: Text(
                        "No hay tareas para hoy",
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                            children: [
                              TodayTasksWidget(
                                  task: snapshot.data[index],
                                ),
                              const SizedBox(width: 10.0),
                              Text(
                                snapshot.data[index].task!.name,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                      },
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  

  Future<dynamic> getTasks() async {
    final TaskController taskController = TaskController();
    return await taskController.getDayTasks(DateTime.now());
  }

  _containerRecentChanges(BuildContext context) {
    final actions = getActions();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Acciones recientes'),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white10, // Color de fondo del Container
            borderRadius: BorderRadius.circular(
                10.0), // Radio de redondeo de las esquinas
          ),
          child: SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width - 16.0,
            child: FutureBuilder(
              future: actions,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return const Center(
                      child: Text(
                        "No acciones recientes",
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            //snapshot.data[index].name,
                            'Todo',
                            textAlign: TextAlign.center,
                            //Todo
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  getActions() {
    //todo
    return [];
  }
}
