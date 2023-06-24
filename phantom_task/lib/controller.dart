import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class PendingTodo {
  String title = '';
  String? image = '';
  DateTime date = DateTime.now();
  String notes = '';
  bool completed = false;
  PendingTodo({
    required this.title,
    this.image,
    required this.date,
    required this.notes,
    required this.completed,
  });
}

class Todocontroller extends GetxController {
  RxList<PendingTodo> todo = <PendingTodo>[
    PendingTodo(
        title: 'asaf', date: DateTime.now(), completed: false, notes: 'sfas'),
    PendingTodo(
        title: 'asaf', date: DateTime.now(), completed: false, notes: 'sfas'),
    PendingTodo(
        title: 'asaf', date: DateTime.now(), completed: false, notes: 'sfas')
  ].obs;
  // RxBool isTodoItemChecked = false.obs;
  addNewTask({required title, required image, required date, required note}) {
    todo.add(
      PendingTodo(
          title: "this.ti", date: DateTime.now(), completed: false, notes: 's'),
    );
  }

  void updateStatus(bool status, int index) {
    todo[index].completed = status;
    refresh();
  }

  // get List<PendingTodo> pending=todo.map((element) => element.)
  late DateTime _selectedDate;

  get completedTodo => todo.where((element) => element.completed).toList();
  List<PendingTodo> get pendingTodo =>
      todo.where((element) => element.completed == false).toList();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
    }
  }
}
