// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/example_one_Provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0.0,
                max: 1.0,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
