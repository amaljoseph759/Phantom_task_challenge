import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:phantom_task/add_new_task.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

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
                          Align(
                            alignment: Alignment.topLeft,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(10, 40)),
                                child: const Center(
                                    child: Icon(Icons.arrow_back_ios))),
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
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 50),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Compleated")),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 0),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange),
                      ),
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
