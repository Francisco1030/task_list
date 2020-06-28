import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:list_task/model/task.dart';
import 'package:path_provider/path_provider.dart';

class HomeController {

  final taskController = TextEditingController();

  // List<Task> tasks = [
  //   // Task(title: "Atividade ED", status: false),
  //   // Task(title: "Atividade DB", status: false)
  // ];

  List tasks = [];

  void add() {
    // tasks.add(Task(title: taskController.text, status: false));
    // taskController.text = "";
    // saveData();
    //print(taskController.value.text);
    Map<String, dynamic> newToDo = Map();
      newToDo["title"] = taskController.text;
      taskController.text = "";
      newToDo["ok"] = false;
      tasks.add(newToDo);

      saveData();
  }

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    String data = json.encode(tasks);
    final file = await getFile();

    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await getFile();
      
      return file.readAsString();
    } catch(e) {
      return null;
    }
  }

}
