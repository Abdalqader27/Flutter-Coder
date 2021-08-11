import 'package:flutter/material.dart';
import 'package:futter_coder/moor_database/data/moor_database.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

import '../../data/dao/tag_dao/tag_dao.dart';
import '../../data/dao/task_dao/task_dao.dart';

class NewTaskInput extends StatefulWidget {
  const NewTaskInput({
    Key? key,
  }) : super(key: key);

  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime? newTaskDate;
  TagData? selectedTag;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextField(context),
          _buildTagSelector(context),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Task Name'),
        onSubmitted: (inputName) {
          final TaskDao dao = Provider.of<TaskDao>(context);
          final task = TaskCompanion(
            name: Value(inputName),
            date: Value(newTaskDate),
            tagName: Value(selectedTag!.name),
          );
          dao.inserting.insertItem(task);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  StreamBuilder<List<TagData>> _buildTagSelector(BuildContext context) {
    return StreamBuilder<List<TagData>>(
      stream: Provider.of<TagDao>(context).getting.watchAll(),
      builder: (context, snapshot) {
        final tags = snapshot.data ?? [];

        DropdownMenuItem<TagData> dropdownFromTag(TagData tag) {
          return DropdownMenuItem(
            value: tag,
            child: Row(
              children: <Widget>[
                Text(tag.name),
                const SizedBox(width: 5),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(tag.color),
                  ),
                ),
              ],
            ),
          );
        }

        final dropdownMenuItems = tags.map((tag) => dropdownFromTag(tag)).toList()
          // Add a "no tag" item as the first element of the list
          ..insert(
            0,
            const DropdownMenuItem(
              value: null,
              child: Text('No Tag'),
            ),
          );

        return Expanded(
          child: DropdownButton(
            onChanged: (TagData? tag) {
              setState(() {
                selectedTag = tag!;
              });
            },
            isExpanded: true,
            value: selectedTag,
            items: dropdownMenuItems,
          ),
        );
      },
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
      newTaskDate = null;
      selectedTag = null;
      controller.clear();
    });
  }
}
