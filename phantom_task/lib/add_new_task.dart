import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phantom_task/controller.dart';
import 'package:phantom_task/taskview.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key, required this.isNewTask, this.todo, this.index});

  bool isNewTask;
  PendingTodo? todo;
  int? index;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  Todocontroller todocontroller = Get.put(Todocontroller());

  TextEditingController title = TextEditingController();

  TextEditingController date = TextEditingController();

  TextEditingController time = TextEditingController();

  TextEditingController note = TextEditingController();

  TextEditingController image = TextEditingController();

  DateTime? selDate;
  TimeOfDay? selTime;
  XFile? selImage;

  dynamic argument = Get.arguments;

  @override
  void initState() {
    if (!widget.isNewTask && widget.todo != null) {
      title.text = widget.todo!.title!;
      note.text = widget.todo!.notes!;

      date.text =
          '${widget.todo!.date.day}/${widget.todo!.date.month}/${widget.todo!.date.year}';
      image.text = widget.todo!.image!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isNewTask) {
      time.text = widget.todo!.time!.format(context);
    }

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
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.close),
                            )),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Add New Task",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
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
                  const Text("Title"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: title,
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
                      controller: image,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Add Image',
                        suffixIcon: InkWell(
                          onTap: () async {
                            XFile? selectedImage = await todocontroller
                                .showUploadSelectionTab(context);
                            selImage = selectedImage;
                            print(selectedImage);
                            image.text = selectedImage!.path.toString();
                          },
                          child: const Icon(
                            Icons.camera,
                            color: Colors.grey,
                          ),
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
                              controller: date,
                              decoration: InputDecoration(
                                hintText: 'Date',
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    var selectDate = await todocontroller
                                        .selectDate(context);
                                    selDate = selectDate;
                                    date.text =
                                        '${selectDate.day}/${selectDate.month}/${selectDate.year}';
                                  },
                                  child: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.grey,
                                  ),
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
                              // onTap: () => todocontroller.selectDate,
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
                              controller: time,
                              decoration: InputDecoration(
                                hintText: 'Time',
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    TimeOfDay selectedTime =
                                        await todocontroller
                                            .selectTime(context);
                                    selTime = selectedTime;
                                    time.text =
                                        ' ${selectedTime.format(context)}';
                                  },
                                  child: const Icon(
                                    Icons.timer_outlined,
                                    color: Colors.grey,
                                  ),
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
                    controller: note,
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
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            if (!widget.isNewTask) {
              todocontroller.updateTask(
                  PendingTodo(
                      title: title.text,
                      date: selDate!,
                      notes: note.text,
                      image: selImage!.path,
                      time: selTime,
                      completed: false),
                  widget.index!,
                  context);
            }
            todocontroller.addNewTask(PendingTodo(
                title: title.text,
                date: selDate!,
                notes: note.text,
                image: selImage!.path,
                time: selTime,
                completed: false));
            Get.to(() => TaskView());
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
