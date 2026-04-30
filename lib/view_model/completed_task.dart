import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/view_model/todo_list_view_model.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Consumer<TodoListViewModel>(
          builder: (_, controller, __) {
            return controller.isEmptyselectedTodosCount
                ? Center(child: Text('No todos'))
                : ListView.builder(
                    itemCount: controller.getSelectedTodoList.length,
                    itemBuilder: (_, index) {
                      final taskItem = controller.getSelectedTodoList[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 8,
                          ),
                          leading: Checkbox(
                            value: controller.isChecked(taskItem),
                            onChanged: (bool? value) {
                              if (value ?? false) {
                                controller.setSelectTodoTask(taskItem);
                              } else {
                                controller.removeSelectedTodo(taskItem);
                              }
                            },
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                          tileColor: Colors.blue.shade100,
                          title: Text(taskItem),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
