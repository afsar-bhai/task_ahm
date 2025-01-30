//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../view_models/task_provider.dart';
// import '../models/task_model.dart';
// import 'add_task_screen.dart';
// import 'update_screen.dart';
//
// class HomeScreen extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Load tasks when the app starts
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(taskProvider.notifier).loadTasks();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final tasks = ref.watch(taskProvider);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background color outside container
//           Container(
//             color: Colors.blue.shade200,
//           ),
//           // Main content
//           Column(
//             children: [
//               // Header Section
//               Container(
//                 padding: EdgeInsets.only(top: 40, left: 16, right: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade200,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Builder(
//                       builder: (context) => IconButton(
//                         icon: Icon(Icons.menu, color: Colors.white),
//                         onPressed: () => Scaffold.of(context).openDrawer(),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Task Management",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           "Make your day productive",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     CircleAvatar(
//                       radius: 30,
//                       child: Image.asset(
//                         'assets/logotask2.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Task List Section
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: tasks.isEmpty
//                       ? Center(
//                     child: Text(
//                       'No tasks found. Add a new task!',
//                       style: TextStyle(fontSize: 18, color: Colors.grey),
//                     ),
//                   )
//                       : ListView.builder(
//                     itemCount: tasks.length,
//                     itemBuilder: (context, index) {
//                       final task = tasks[index];
//                       return Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             child: Image.asset('assets/logotask2.png'),
//                           ),
//                           title: Text(
//                             task.title,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               decoration: task.isCompleted
//                                   ? TextDecoration.lineThrough
//                                   : TextDecoration.none,
//                             ),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Description: ${task.description}'),
//                               Text('Designation: ${task.name}'),
//                               Text('Department: ${task.email}'),
//                             ],
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.edit, color: Colors.blue),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => EditTaskScreen(task: task),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               SizedBox(width: 15,),
//                               SizedBox(
//                                 height: 100, // Set a fixed height to prevent overflow
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Checkbox(
//                                       value: task.isCompleted,
//                                       onChanged: (value) {
//                                         ref.read(taskProvider.notifier).updateTask(
//                                           task.copyWith(isCompleted: value),
//                                         );
//                                       },
//                                     ),
//                                     IconButton(
//                                       icon: Icon(Icons.delete, color: Colors.red),
//                                       onPressed: () {
//                                         ref.read(taskProvider.notifier).deleteTask(task.id!);
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(content: Text('Task deleted')),
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade200,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     child: Image.asset('assets/logotask2.png', fit: BoxFit.cover),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Welcome, User!',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () => Navigator.pop(context),
//             ),
//             Divider(thickness: 1),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () => Navigator.pop(context),
//             ),
//             Divider(thickness: 1),
//             ListTile(
//               leading: Icon(Icons.people),
//               title: Text('Friends'),
//               onTap: () => Navigator.pop(context),
//             ),
//             Divider(thickness: 1),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('Profile'),
//               onTap: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddTaskScreen(),
//             ),
//           );
//         },
//         child: Text("ADD"),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/task_provider.dart';
import '../models/task_model.dart';
import 'add_task_screen.dart';
import 'update_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load tasks when the app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskProvider.notifier).loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background color outside container
          Container(
            color: Colors.blue.shade200,
          ),
          // Main content
          Column(
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.only(top: 40, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          " MY Task ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Make your day productive",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        'assets/logotask2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              // Task List Section
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: tasks.isEmpty
                      ? Center(
                    child: Text(
                      'No tasks found. Add a new task!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                      : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/logotask2.png'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: task.isCompleted
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                      ),
                                    ),
                                    Text('Description: ${task.description}'),
                                    Text('Designation: ${task.name}'),
                                    Text('Department: ${task.email}'),
                                  ],
                                ),
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: task.isCompleted,
                                        onChanged: (value) {
                                          ref.read(taskProvider.notifier).updateTask(
                                            task.copyWith(isCompleted: value),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit, color: Colors.blue),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditTaskScreen(task: task),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.blueGrey),
                                    onPressed: () {
                                      ref.read(taskProvider.notifier).deleteTask(task.id!);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Task deleted')),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                     radius: 30,
                    child: Image.asset('assets/logotask2.png', fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Friends'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        child: Text("ADD"),
      ),
    );
  }
}