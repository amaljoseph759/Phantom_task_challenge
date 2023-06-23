import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedTodo {
  final dynamic title;
  final String? image;
  final DateTime date;
  final String notes;
  CompletedTodo(
      {required this.title,
      this.image,
      required this.date,
      required this.notes});
}

class PendingTodo {
  final title;
  final String? image;
  DateTime date;
  final String notes;
  PendingTodo(
      {required this.title,
      this.image,
      required this.date,
      required this.notes});
}

class Todocontroller extends GetxController {
  addNewTask({required title, required image, required date, required note}) {
    RxList<PendingTodo> todo = <PendingTodo>[].obs;
    todo.add(PendingTodo(date: date, notes: '', title: null));
  }

  late DateTime _selectedDate;

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
