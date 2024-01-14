import 'package:flutter/material.dart';

class WeekDayCard extends StatelessWidget {
  final int day;
  final String weekDay;
  final bool haveTask;
  final bool isToday;
  final int elevation;

  const WeekDayCard({super.key,
    required this.day,
    required this.weekDay,
    required this.haveTask,
    required this.isToday,
    this.elevation = 0
  });


  @override
  Widget build(BuildContext context) {
    
    return Card(
      color: isToday ? Theme.of(context).primaryColor : null, 
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              weekDay,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '$day',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (haveTask)
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  size: 10,
                  Icons.circle,
                  color: Theme.of(context).secondaryHeaderColor, // Puedes cambiar el color según tus preferencias
                ),
              ),
          ],
        ),
      ),
    );
  }
}
