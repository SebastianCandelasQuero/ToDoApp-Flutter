import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/dialog_box.dart';
import 'package:flutter_application_1/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

    final _controller = TextEditingController();

   List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false]
  ];

  //checkbox seleccionada
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      _controller.clear();
    });
  }

    //Guaradar tarea
  void guardarTareaNueva(){
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

    //Crear nueva tarea
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            guardar: guardarTareaNueva,
            cancelar: () => Navigator.of(context).pop(),
          );
        })
    ;
  }

    //borrar tarea
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
}


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 132, 183, 209),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('To Do'),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              nombreTarea: toDoList[index][0],
              tareaCompletada: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}