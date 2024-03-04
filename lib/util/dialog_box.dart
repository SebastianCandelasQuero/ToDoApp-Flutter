import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/my_buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback guardar;
  VoidCallback cancelar;

  DialogBox({
    super.key,
    required this.controller,
    required this.guardar,
    required this.cancelar
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Añadir nueva tarea",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //guardar
            MyButton(text: "Guardar", onPressed: guardar),
            const SizedBox(width: 8),
            //borrar
            MyButton(text: "Cancelar", onPressed: cancelar),
          ],)
        ],),
      ),
    );
  }
}