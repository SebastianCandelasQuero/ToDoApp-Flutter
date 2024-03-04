import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String nombreTarea;
  final bool tareaCompletada;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.nombreTarea,
    required this.tareaCompletada,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            //Checkbox Realizada o No
            Checkbox(
                value: tareaCompletada, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //Nombre de la tarea
            Text(
                  nombreTarea,
                  style: TextStyle(decoration: tareaCompletada
                      ? TextDecoration.lineThrough
                      : TextDecoration.none
                  ),
              ),
            Spacer(),
            IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteFunction?.call(context);
            },
            color: Colors.red,
          ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12)
          ),
      ),
    );
  }
}