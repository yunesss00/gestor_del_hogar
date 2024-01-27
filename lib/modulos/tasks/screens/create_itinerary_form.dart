import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/weekDay_card.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../domain/entities/task.dart';
import '../../../presentation/shared/widgets/custom_filled_button.dart';
import '../../../presentation/shared/widgets/custom_text_form_field.dart';
import '../../../presentation/shared/widgets/generic_card.dart';
import '../../../presentation/shared/widgets/generic_pulsable_card.dart';
import '../controller/task_controller.dart';

final TaskController taskController = TaskController();

class CreateItineraryForm extends StatelessWidget {
  const CreateItineraryForm();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerDescription = TextEditingController();
    late Itinerary itinerary = const Itinerary();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Text('Datos básicos',
                  style: Theme.of(context).textTheme.titleSmall),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                    label: 'Nombre',
                    controller: controllerName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre';
                      }
                      if (value.length < 3) {
                        return 'El nombre debe tener al menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                    label: 'Descripción',
                    controller: controllerDescription,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una descripción';
                      }
                      if (value.length < 5) {
                        return 'La descripción debe tener al menos 5 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text('Asignación de tareas',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 20),
              _containerWeekDays(context),
            ],
          ),
        ),
      ),
    );
  }
}

_containerWeekDays(BuildContext context) {
  final stringWeekdays = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          return GestureDetector(
              onTap: () {
                _asignTask(context, index);
              },
              child: WeekDayCard(
                  day: index + 1,
                  weekDay: stringWeekdays[index],
                  haveTask: false,
                  isToday: false));
        }),
      ));
}

_asignTask(BuildContext context, int index) {
  final tasks = _getTasks();
  // ignore: use_build_context_synchronously
  final size = MediaQuery.of(context).size;

  // ignore: use_build_context_synchronously
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: size.height - 180, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              child: FutureBuilder(
                future: tasks,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.isEmpty) {
                      return const Center(
                        child: Text(
                          "No hay tareas todavia",
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              if(index == 0)
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  const Expanded(
                                    child: Text('Tareas'),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      
                                    },
                                    icon: const Icon(Icons.add),
                                  ), 
                                  const SizedBox(width: 10),

                                ],
                              ),
                              tasksList(context, index, snapshot.data ),
                            ],
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },

              ),
            ),
          ),
        );
      });
}

_getTasks() async {
  return await taskController.getTasks();
}


Widget tasksList(BuildContext context, int index, List<Task>? tasks) {
  return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: GenericPulsableCard(
          id: tasks![index].id!,
          name: tasks[index].name!,
          description: tasks[index].description!,
        
        ),
);
}