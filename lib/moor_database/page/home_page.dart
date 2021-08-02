import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:futter_coder/moor_database/data/moor_database.dart';
import 'package:provider/provider.dart';

import 'new_task_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
            const NewTaskInput(),
          ],
        ));
  }

  StreamBuilder<List<TaskData>> _buildTaskList(BuildContext context) {
    final AppDatabase database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.taskDao.getting.watchAll(),
      builder: (context, AsyncSnapshot<List<TaskData>> snapshot) {
        final tasks = snapshot.data ?? [];

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(TaskData itemTask, AppDatabase database) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => database.taskDao.deleting.deleteItem(itemTask),
        )
      ],
      child: CheckboxListTile(
        title: Text(itemTask.name),
        subtitle: Text(itemTask.date?.toString() ?? 'No date'),
        value: itemTask.completed,
        onChanged: (newValue) {
          database.taskDao.updating.updateItem(itemTask.copyWith(completed: newValue));
        },
      ),
    );
  }
}
