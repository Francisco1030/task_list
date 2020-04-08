import 'dart:convert';
import 'dart:io';
import 'package:list_task/model/task.dart';
import 'package:path_provider/path_provider.dart';

class HomeController {

  List<Task> tasks = [];

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
