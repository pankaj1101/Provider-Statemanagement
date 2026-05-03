import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/view/recipes_view.dart';
import 'package:sample/view_model/counter_view_model.dart';
import 'package:sample/view_model/receipe_view_model.dart';
import 'package:sample/view_model/slider_view_model.dart';
import 'package:sample/view_model/task_view_model.dart';
import 'package:sample/view_model/todo_list_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterViewModel>(
          create: (_) => CounterViewModel(),
        ),
        ChangeNotifierProvider<SliderViewModel>(
          create: (_) => SliderViewModel(),
        ),
        ChangeNotifierProvider<TodoListViewModel>(
          create: (_) => TodoListViewModel(),
        ),
        ChangeNotifierProvider<TaskViewModel>(create: (_) => TaskViewModel()),
        ChangeNotifierProvider<ReceipeViewModel>(
          create: (_) => ReceipeViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RecipesView(),
      ),
    );
  }
}
