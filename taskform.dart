import 'package:flutter/material.dart';
import 'main.dart'; 

class TaskForm extends StatefulWidget {
  const TaskForm({required this.appKey});

  final GlobalKey<ToDoListState> appKey;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();


  late String _title = "", _description = "", _dueDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Task Title"),
                onSaved: (value) => _title = value ?? "",
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Title is required" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                onSaved: (value) => _description = value ?? "",
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Description is required" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Due Date"),
                onSaved: (value) => _dueDate = value ?? "",
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Due date is required" : null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Submit"),
        backgroundColor: Colors.cyan,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final newTask = Task(
              title: _title,
              description: _description,
              dueDate: _dueDate,
            );

            widget.appKey.currentState?.addTask(newTask); 

            Navigator.pop(context);
          }
        },
      ),
    );
  }
}






