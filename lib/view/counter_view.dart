import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/view_model/counter_view_model.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late CounterViewModel counterProvider;

  @override
  void initState() {
    super.initState();
    counterProvider = Provider.of<CounterViewModel>(context, listen: false);
  }
  // read

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${context.watch<CounterViewModel>().counter}',
          style: TextStyle(fontSize: 45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<CounterViewModel>().increment();
          counterProvider.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


// context.read() // action - Value Static => context.read<CounterViewModel>()
// context.watch() // watch() - dynamic => context.watch<CounterViewModel>(), Consumer



// Token - accessToken - 5 min 