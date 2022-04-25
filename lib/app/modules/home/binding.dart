import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:todo_app/app/data/providers/task/providers.dart';
import 'package:todo_app/app/data/services/storage/repository.dart';
import 'package:todo_app/app/modules/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController(
          taskRepository: TaskRepository(
            taskProvider: TaskProvider(),
          ),
        ));
  }
}
