import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: Padding(
          padding: const EdgeInsets.all(9),
          child: ClipOval(
            child: Container(
              child: Material(
                color: Colors.amber, // Button color
                child: InkWell(
                  splashColor: Colors.black, // Splash color
                  onTap: () {
                    Get.back();

                    print("hi");
                  },
                  child: const SizedBox(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Add New Task",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 80,
      ),
      body: Container(
        height: 100,
        color: Colors.amber,
      ),
    );
  }
}
