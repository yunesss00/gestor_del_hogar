import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag, color: Theme.of(context).primaryColor),
          label: 'Listas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Theme.of(context).primaryColor),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task, color: Theme.of(context).primaryColor),
          label: 'Tareas',
        ),
      ],
      onTap: (index) {
        try {
          if (index == 2) {
            context.push('/tasks-screen');
          } else if (index == 1) {
            context.push('/my-home-screen');
          }
        } catch (e) {
          print('Error during navigation: $e');
        }
      },
    );
  }
}
