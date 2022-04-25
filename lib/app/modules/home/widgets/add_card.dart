import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/modules/home/controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:todo_app/app/modules/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squaredWidth = Get.width - 16.0;

    return Container(
      width: squaredWidth / 2,
      height: squaredWidth / 2,
      margin: EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0),
              radius: 5,
              title: 'Tipo de tarea',
              content: Form(
                  key: homeController.formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: homeController.editCtrl,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Título',
                              fillColor: Colors.green),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor ingresa un título a tu tarea';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Wrap(
                          spacing: 2.0,
                          children: icons
                              .map((e) => Obx(() {
                                    final index = icons.indexOf(e);
                                    return ChoiceChip(
                                      selectedColor: Colors.grey[200],
                                      pressElevation: 0,
                                      backgroundColor: Colors.white,
                                      label: e,
                                      selected:
                                          homeController.chipIndex.value ==
                                              index,
                                      onSelected: (bool selected) {
                                        homeController.chipIndex.value =
                                            selected ? index : 0;
                                      },
                                    );
                                  }))
                              .toList(),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: const Size(150, 40)),
                          onPressed: () {
                            if (homeController.formkey.currentState!
                                .validate()) {
                              int icon = icons[homeController.chipIndex.value]
                                  .icon!
                                  .codePoint;

                              String color =
                                  icons[homeController.chipIndex.value]
                                      .color!
                                      .toString();

                              var task = Task(
                                  title: homeController.editCtrl.text,
                                  icon: icon,
                                  color: color,
                                  todos: []);

                              Get.back();
                              homeController.AddTask(task)
                                  ? EasyLoading.showSuccess('Creado!')
                                  : EasyLoading.showError('Tarea duplicada!');
                            }
                          },
                          child: const Text('Guardar'))
                    ],
                  )));

          homeController.editCtrl.clear();
          homeController.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: [8, 4],
          child: Center(
            child: Icon(Icons.add, size: 40, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
