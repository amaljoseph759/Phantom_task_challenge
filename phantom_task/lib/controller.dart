import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

import 'dart:io';

// import 'package:build_runner/build_runner.dart';

@HiveType(typeId: 1)
class PendingTodo {
  String? title;
  String? image;
  DateTime date;
  TimeOfDay? time;
  String? notes;

  bool completed = false;
  PendingTodo({
    required this.title,
    this.image,
    required this.date,
    required this.notes,
    required this.time,
    required this.completed,
  });
}

class Todocontroller extends GetxController {
  RxList<PendingTodo> todo = <PendingTodo>[].obs;

  // RxBool isTodoItemChecked = false.obs;
  // final _myhive = Hive.box("'todo_list'");
  addNewTask(PendingTodo task) {
    todo.add(task);
  }

  updateTask(PendingTodo task, int index, BuildContext context) {
    todo[index] = task;

    Navigator.of(context).pop();
  }

  void updateStatus(bool status, int index) {
    todo[index].completed = status;
    refresh();
  }

  String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('MMMM d, yyyy');
    return formatter.format(now);
  }

  // get List<PendingTodo> pending=todo.map((element) => element.)

  get completedTodo => todo.where((element) => element.completed).toList();
  List<PendingTodo> get pendingTodo =>
      todo.where((element) => element.completed == false).toList();

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      return pickedDate;
    }
    return DateTime.now();
  }

  Future<TimeOfDay> selectTime(BuildContext context) async {
    final TimeOfDay? pickTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickTime != null) {
      return pickTime;
    }
    return TimeOfDay.now();
  }

  Future<XFile?> showUploadSelectionTab(context) async {
    final completer = Completer<XFile?>();
    showModalBottomSheet(
        context: context,
        builder: (ctx) => Container(
              color: Colors.red,
              width: double.infinity,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(ctx);
                        // upload from camera
                        XFile? image = await getImage(ImageSource.camera);
                        return completer.complete(image);
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.camera_alt_outlined, color: Colors.red),
                          Text(
                            'Open camera',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        // upload from gallery
                        Navigator.pop(ctx);
                        XFile? image = await getImage(ImageSource.gallery);
                        return completer.complete(image);
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.filter_rounded, color: Colors.blue),
                          Text('Upload from files',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
    return completer.future;
  }

  Future<XFile?> getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    try {
      final pickedImage = await _picker.pickImage(source: source);

      if (pickedImage != null) {
        return pickedImage;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<File> saveAndRetrieveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final dirLocation = base64Decode(imagePath);
    final image = File('${directory.path}/$dirLocation');
    return File(imagePath).copy(image.path);
  }
}
