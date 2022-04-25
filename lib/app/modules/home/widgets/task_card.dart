import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/modules/home/controller.dart';

class TaskCard extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final squareWidth = Get.width - 14;
    final color = Color(0xFF2B60E6);
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
          blurRadius: 7,
          offset: const Offset(0, 7),
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            // TODO change
            totalSteps: 100, currentStep: 80, size: 5, padding: 0,
            selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [color.withOpacity(0.5), color]),
            unselectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.white]),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconData(task.icon, fontFamily: 'MaterialIcons'),
                color: color),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0),
                Text(
                  '${task.todos.length} Task',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
