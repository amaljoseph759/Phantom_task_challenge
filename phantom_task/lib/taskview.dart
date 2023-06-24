import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phantom_task/controller.dart';
// import 'package:intl/intl.dart';

import 'add_new_task.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});
  Todocontroller todocontroller = Get.put(Todocontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height / 2.9,
                  child: Image.asset(
                    "assets/images/new.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.arrow_back_ios),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "october 22,2020",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "My Todo List",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 50),
                          height: MediaQuery.of(context).size.height / 2.8,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GetBuilder<Todocontroller>(
                            builder: (controller) => ListView.separated(
                                itemBuilder: (context, index) {
                                  return Obx(() => CheckboxListTile(
                                        title: Text(todocontroller
                                            .pendingTodo[index].title),
                                        subtitle: Text(todocontroller
                                            .pendingTodo[index].date
                                            .toString()),
                                        tileColor: Colors.white,
                                        value: todocontroller
                                            .pendingTodo[index].completed,
                                        onChanged: (value) {
                                          todocontroller.pendingTodo[index]
                                              .completed = value!;

                                          todocontroller.updateStatus(
                                              value, index);

                                          print(value);
                                        },
                                      ));
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: todocontroller.pendingTodo.length),
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Compleated")),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 0),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange),
                          child: GetBuilder<Todocontroller>(
                            builder: (controller) => ListView.separated(
                                itemBuilder: (context, index) {
                                  return Obx(() => CheckboxListTile(
                                        title: Text(todocontroller
                                            .completedTodo[index].title),
                                        subtitle: Text(todocontroller
                                            .completedTodo[index].date
                                            .toString()),
                                        tileColor: Colors.white,
                                        value: todocontroller
                                            .completedTodo[index].completed,
                                        onChanged: (value) {
                                          todocontroller.completedTodo[index]
                                              .completed = value!;

                                          todocontroller.updateStatus(
                                              value, index);

                                          print(value);
                                        },
                                      ));
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: todocontroller.completedTodo.length),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Get.to(NewTask());
          },
          child: const Text('Button Texxt'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
