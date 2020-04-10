import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_task/controller/home_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  HomeController homeController = new HomeController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void addTask() {
     setState(() {
       widget.homeController.add();
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: widget.homeController.taskController,
                      decoration: InputDecoration(
                          labelText: "Nova tarefa: ",
                          labelStyle: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("ADD"),
                    textColor: Colors.white,
                    onPressed: addTask,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: widget.homeController.tasks.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(widget.homeController.tasks[index].title),
                      value: widget.homeController.tasks[index].status,
                      secondary: CircleAvatar(
                        child: Icon(widget.homeController.tasks[index].status == true ?
                        Icons.check : Icons.error),
                        ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
