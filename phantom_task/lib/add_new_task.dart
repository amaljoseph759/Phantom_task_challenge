import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phantom_task/controller.dart';
import 'package:phantom_task/taskview.dart';

class NewTask extends StatelessWidget {
  NewTask({super.key});
  Todocontroller todocontroller = Get.put(Todocontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset("assets/images/new.jpg",
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.close),
                          )),
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: ElevatedButton(
                    //       onPressed: () {
                    //         Get.back();
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //           shape: const CircleBorder(),
                    //           backgroundColor: Colors.white,
                    //           fixedSize: const Size(10, 40)),
                    //       child: const Center(child: Icon(Icons.close))),
                    // ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add New Task",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Task title"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Task Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Add Image"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      onTap: () => null,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Add Image',
                        suffixIcon: const Icon(
                          Icons.camera,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5.0),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Date"),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Date',
                                suffixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 5.0),
                              ),
                              onTap: () => todocontroller.selectDate,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Time"),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Time',
                                suffixIcon: const Icon(
                                  Icons.timer_outlined,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 5.0),
                              ),
                              onTap: () => todocontroller.selectDate,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Notes"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Notes',
                      suffixIcon: const Icon(
                        Icons.notes_outlined,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                    ),
                    minLines: 3,
                    maxLines: 3,
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            todocontroller.addNewTask(
              title: "amal",
              date: DateTime(2022),
              image: "rfgg",
              note: "hgffh",
            );
            Get.to(() => TaskView());
          },
          child: const Text('Save'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
