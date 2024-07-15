import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_app/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  // @override
  // void initState() {
  //   final countProvider = Provider.of<CountProvider>(context, listen: false);
  //   Timer.periodic(Duration(seconds: 0), (timer) {
  //     countProvider.setCount();
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print('build');
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count_Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
