import 'package:flutter/material.dart';
import 'package:futter_coder/moor_database/data/dao/tag_dao/tag_dao.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

import '../../data/moor_database.dart';

class NewTagInput extends StatefulWidget {
  const NewTagInput({
    Key? key,
  }) : super(key: key);

  @override
  _NewTagInputState createState() => _NewTagInputState();
}

class _NewTagInputState extends State<NewTagInput> {
  static const Color kDefaultColor = Colors.red;

  Color pickedTagColor = kDefaultColor;
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
        children: <Widget>[
          _buildTextField(context),
          _buildColorPickerButton(context),
        ],
      ),
    );
  }

  Flexible _buildTextField(BuildContext context) {
    return Flexible(
      flex: 1,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Tag Name'),
        onSubmitted: (inputName) {
          final TagDao dao = Provider.of<TagDao>(context);
          final task = TagCompanion(
            name: Value(inputName),
            color: Value(pickedTagColor.value),
          );
          dao.inserting.insertItem(task);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  Widget _buildColorPickerButton(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pickedTagColor,
          ),
        ),
        onTap: () {
          // _showColorPickerDialog(context);
        },
      ),
    );
  }

  // Future _showColorPickerDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: ColorPicker(
  //           pickerColor: kDefaultColor,
  //           onColorChanged: (Color colorSwatch) {
  //             setState(() {
  //               pickedTagColor = colorSwatch;
  //             });
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  void resetValuesAfterSubmit() {
    setState(() {
      pickedTagColor = kDefaultColor;
      controller.clear();
    });
  }
}
