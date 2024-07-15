import 'package:flutter/material.dart';

class NotifyListnersScreen extends StatelessWidget {
  NotifyListnersScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toogle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STL as STF',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _toogle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: _toogle.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: InkWell(
                    onTap: () {
                      _toogle.value = !_toogle.value;
                    },
                    child: Icon(_toogle.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                  ),
                ),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(
            _counter.value.toStringAsExponential(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
