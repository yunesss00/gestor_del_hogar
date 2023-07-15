import 'package:flutter/material.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.shopping_bag, color: Theme.of(context).primaryColor),
          label: 'Listas'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.home , color: Theme.of(context).primaryColor),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.task , color: Theme.of(context).primaryColor),
          label: 'Tareas'
        ),
      ]
    );
  }
}