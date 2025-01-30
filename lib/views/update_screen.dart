import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../view_models/task_provider.dart';

class EditTaskScreen extends ConsumerStatefulWidget {
  final Task task;

  EditTaskScreen({required this.task});

  @override
  ConsumerState<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends ConsumerState<EditTaskScreen> {
  final _nameController = TextEditingController(); // New field
  final _emailController = TextEditingController(); // New field
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.task.name; // New field
    _emailController.text = widget.task.email; // New field
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Update  Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 40),
        child: Column(
          children: [
            Text("Update Your Task Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Department'), // New field
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Designation'), // New field
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
                  // Update the task
                  final updatedTask = widget.task.copyWith(
                    name: _nameController.text, // New field
                    email: _emailController.text, // New field
                    title: _titleController.text,
                    description: _descriptionController.text,
                  );
                  ref.read(taskProvider.notifier).updateTask(updatedTask);
                  Navigator.pop(context); // Go back to the home screen
                },
                child: Text('Update Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}