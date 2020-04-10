import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:list_task/model/task.dart';
import 'package:path_provider/path_provider.dart';

class HomeController {

  final taskController = TextEditingController();

  List<Task> tasks = [
    Task(title: "Atividade ED", status: false),
    Task(title: "Atividade DB", status: false)
  ];

  void add() {
    tasks.add(Task(title: taskController.text, status: false));
    taskController.text = "";
    print(taskController.value.text);
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
