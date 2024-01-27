import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../domain/entities/task.dart';

class GenericPulsableCard extends StatefulWidget {
  final int id;
  final String name;
  final String description;
  final IconButton? icon1;
  final IconButton? icon2;

  const GenericPulsableCard({
    Key? key,
    required this.name,
    required this.description,
    this.icon1,
    this.icon2,
    required this.id,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenericPulsableCardState createState() => _GenericPulsableCardState();
}

class _GenericPulsableCardState extends State<GenericPulsableCard> {
  bool isPressed = false;
  List<Task> lstTasks = [];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        if (isPressed) {
          lstTasks.add(Task(id: widget.id));
        } else {
          lstTasks.removeWhere((element) => element.id == widget.id);
        }
      },
      child: Card(
        color: isPressed ? theme.primaryColor : theme.primaryColorDark,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Text(widget.description,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              if (widget.icon1 != null) widget.icon1!,
              const SizedBox(width: 8),
              if (widget.icon2 != null) widget.icon2!,
            ],
          ),
        ),
      ),
    );
  }
}
