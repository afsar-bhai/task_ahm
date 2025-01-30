import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../view_models/task_provider.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.indigo,
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 40),
        child: Column(
          children: [
            Text(" Enter Task Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Designation'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo
                ),
                onPressed: () {
                  // Create a new task
                  final task = Task(
                    name: _nameController.text,
                    email: _emailController.text,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    date: DateTime.now(),
                  );

                  // Add the task using the provider
                  ref.read(taskProvider.notifier).addTask(task);

                  // Navigate back to the home screen
                  Navigator.pop(context);
                },
                child: Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}