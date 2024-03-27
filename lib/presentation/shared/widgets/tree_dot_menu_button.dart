import 'package:flutter/material.dart';

class ThreeDotMenuButton extends StatelessWidget {
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const ThreeDotMenuButton({super.key, 
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          value: 'edit',
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Editar', style: TextStyle(fontSize: 14.0)),
            iconColor: theme.primaryColor,
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Borrar',style: TextStyle(fontSize: 14.0)),
            iconColor: theme.primaryColor,
          ),
        ),
      ],
      onSelected: (String value) {
        if (value == 'edit') {
          onEditPressed();
        } else if (value == 'delete') {
          onDeletePressed();
        }
      },
      icon: Icon(Icons.more_vert, color: theme.primaryColor,),
    );
  }
}
