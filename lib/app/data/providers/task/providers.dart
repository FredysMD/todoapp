import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/app/core/utils/keys.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/data/services/storage/service.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];

    jsonDecode(_storage.read(taskKeys).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));

    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKeys, jsonEncode(tasks));
  }
}
