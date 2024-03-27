import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/tree_dot_menu_button.dart';

class GenericCard extends StatelessWidget {
  final String name;
  final String description;
  final IconButton icon1;
  final IconButton? icon2;
  final ThreeDotMenuButton? treedotmenuButton;

  const GenericCard({
    Key? key,
    required this.name,
    required this.description,
    required this.icon1,
    this.icon2, 
    this.treedotmenuButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 8),
                  Text(description, style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
            icon1,
            const SizedBox(width: 8),
            if (icon2 != null) icon2!,
            const SizedBox(width: 8),
            if (treedotmenuButton != null) treedotmenuButton!,
          ],
        ),
      ),
    );
  }
}
