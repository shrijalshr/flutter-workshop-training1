import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_1/todo/task_model.dart';
import 'package:uuid/uuid.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Simple list',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: TodoListScreen(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({
    super.key,
  });

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _taskController = TextEditingController();
  late List<Task> _tasks;

  List<Task> get _completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();
  List<Task> get _pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  @override
  void initState() {
    super.initState();

    // Initialize tasks with proper indices
    _tasks = [
      Task(title: 'Drink 8 glasses of water', index: 0),
      Task(title: 'Meditate for 10 minutes', index: 1),
      Task(title: 'Read a chapter of a book', index: 2),
      Task(title: 'Go for a 30-minute walk', index: 3),
      Task(title: 'Write in a gratitude journal', index: 4),
      Task(title: 'Plan meals for the day', index: 5),
      Task(title: 'Practice deep breathing exercises', index: 6),
      Task(title: 'Stretch for 15 minutes', index: 7),
      Task(title: 'Limit screen time before bed', index: 8),
      Task(title: 'Review daily goals before sleeping', index: 9),
    ];

    // Pre-complete some tasks for the checked list view

    _tasks[6].isCompleted = true; // Practice deep breathing exercises
    _tasks[5].isCompleted = true; // Plan meals for the day
    _tasks[7].isCompleted = true; // Stretch for 15 minutes
    _tasks[8].isCompleted = true; // Limit screen time before bed
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void saveToPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Task task1 = _tasks[0];
    Map<String, dynamic> task1Map = task1.toMap();
    print("task1Map: $task1Map");
    String? task1String = jsonEncode(task1Map);

    prefs.setString(
      "task",
      task1String,
    );
  }

  void getTaskFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? task = prefs.getString("task");
    Map<String, dynamic> taskMap = jsonDecode(task!);
    Task taskFromMap = Task.fromMap(taskMap);
    print(taskFromMap);
    print("task: $task");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          ElevatedButton(
              onPressed: () {
                saveToPrefs();
              },
              child: Text("Save task 1 to prefs")),
          ElevatedButton(
              onPressed: () {
                getTaskFromPrefs();
              },
              child: Text("Get task 1 from prefs")),
          Expanded(
            child: _buildList(),
          ),
          _buildAddTaskBar(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Personal',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildList() {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          // Determine if we're in the pending or completed section
          final isPendingSection = oldIndex < _pendingTasks.length;
          final isTargetPendingSection = newIndex <= _pendingTasks.length;

          // Only allow reordering within the same section
          if (isPendingSection == isTargetPendingSection) {
            if (isPendingSection) {
              // Reordering within pending items
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Task item = _pendingTasks.removeAt(oldIndex);
              _pendingTasks.insert(newIndex, item);

              // Update the main list
              _tasks = [..._pendingTasks, ..._completedTasks];
            } else {
              // Reordering within completed items
              oldIndex = oldIndex - _pendingTasks.length;
              newIndex = newIndex - _pendingTasks.length;
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Task item = _completedTasks.removeAt(oldIndex);
              _completedTasks.insert(newIndex, item);

              // Update the main list
              _tasks = [..._pendingTasks, ..._completedTasks];
            }

            // Update indices after reordering
            for (int i = 0; i < _tasks.length; i++) {
              _tasks[i].index = i;
            }
          }
        });
      },
      children: [
        ..._pendingTasks.map((task) => _buildTaskItem(task, key: Key(task.id))),
        if (_completedTasks.isNotEmpty) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            key: const Key('completed-header'),
            child: Text(
              'COMPLETED',
              style: TextStyle(
                color: Colors.orange[300],
                fontSize: 12,
              ),
            ),
          ),
          ..._completedTasks
              .map((task) => _buildCompletedTaskItem(task, key: Key(task.id))),
        ],
      ],
    );
  }

  Widget _buildTaskItem(Task task, {required Key key}) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onChanged: (bool? value) {
            setState(() {
              task.isCompleted = value ?? false;
            });
          },
        ),
        title: Text(task.title),
        trailing: IconButton(
          icon: const Icon(Icons.more_horiz, color: Colors.grey),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildCompletedTaskItem(Task task, {required Key key}) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white),
        ),
        title: Text(
          task.title,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildAddTaskBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                hintText: 'Write a task...',
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                setState(() {
                  _tasks.add(Task(
                    title: _taskController.text,
                    index: _tasks.length,
                  ));
                  _taskController.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Task added successfully.')));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF333333),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
