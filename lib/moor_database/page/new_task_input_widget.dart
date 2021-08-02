import 'package:flutter/material.dart';
import 'package:futter_coder/moor_database/data/moor_database.dart';
import 'package:provider/provider.dart';

class NewTaskInput extends StatefulWidget {
  const NewTaskInput({
    Key? key,
  }) : super(key: key);

  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  late DateTime newTaskDate;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTextField(context),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Task Name'),
        onSubmitted: (inputName) {
          final database = Provider.of<AppDatabase>(context);
          final task = TaskData(
            name: inputName,
            date: newTaskDate,
            completed: false,
          );
          database.taskDao.inserting.insertItem(task);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  IconButton _buildDateButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () async {
        newTaskDate = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050),
        ))!;
      },
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      newTaskDate = DateTime.now();
      controller.clear();
    });
  }
}
