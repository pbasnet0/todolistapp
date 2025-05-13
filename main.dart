import 'package:flutter/material.dart';
import 'taskform.dart';
import 'about.dart';

GlobalKey<ToDoListState> toDoListKey = GlobalKey<ToDoListState>();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To-Do List",
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      initialRoute: '/',
      routes: {
        '/': (context) => ToDoList(key: toDoListKey), 
        '/form': (context) => TaskForm(appKey: toDoListKey), 
        '/about': (context) => About(),
      },
    ),
  );
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  ToDoListState createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.blue),
            title: Text(_tasks[index].title),
            subtitle: Text("${_tasks[index].description} - ${_tasks[index].dueDate}"),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteConfirmationDialog(context, index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
      ),
    );
  }

  void addTask(Task newTask) {
    setState(() {
      _tasks.add(newTask);
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Task"),
          content: Text("Are you sure you want to delete this task?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                setState(() {
                  _tasks.removeAt(index); 
                });
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }
}

class Task {
  final String title, description, dueDate;
  Task({required this.title, this.description = "", this.dueDate = ""});
}











