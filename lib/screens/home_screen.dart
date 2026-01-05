import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Taskify',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      // ADD TASK BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.text.trim().isEmpty) return;

          context.read<TaskProvider>().addTask(controller.text.trim());
          controller.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task added successfully'),
              duration: Duration(milliseconds: 800),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Column(
        children: [
          // INPUT FIELD WITH ANIMATION
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a new task',
                border: InputBorder.none,
              ),
            ),
          ),

          // TASK LIST
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, provider, child) {
                if (provider.tasks.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.task_alt,
                        size: 90,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No tasks yet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Tap + to add your first task',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 90),
                  itemCount: provider.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskTile(index: index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
