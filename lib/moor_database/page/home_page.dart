import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:futter_coder/moor_database/data/moor_database.dart';
import 'package:provider/provider.dart';

import '../data/dao/task_dao/task_dao.dart';
import 'new_task_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
          actions: <Widget>[
            _buildCompletedOnlySwitch(),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
            const NewTaskInput(),
          ],
        ));
  }

  Row _buildCompletedOnlySwitch() {
    return Row(
      children: <Widget>[
        const Text('Completed only'),
        Switch(
          value: showCompleted,
          activeColor: Colors.white,
          onChanged: (newValue) {
            setState(() {
              showCompleted = newValue;
            });
          },
        ),
      ],
    );
  }

  StreamBuilder<List<TaskData>> _buildTaskList(BuildContext context) {
    final TaskDao dao = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: showCompleted ? dao.getting.watchAllCompleted() : dao.getting.watchAll(),
      builder: (context, AsyncSnapshot<List<TaskData>> snapshot) {
        final tasks = snapshot.data ?? [];

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, dao);
          },
        );
      },
    );
  }

  Widget _buildListItem(TaskData itemTask, TaskDao dao) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => dao.deleting.deleteItem(itemTask),
        )
      ],
      child: CheckboxListTile(
        title: Text(itemTask.name),
        subtitle: Text(itemTask.date?.toString() ?? 'No date'),
        value: itemTask.completed,
        onChanged: (newValue) {
          dao.updating.updateItem(itemTask.copyWith(completed: newValue));
        },
      ),
    );
  }
}
