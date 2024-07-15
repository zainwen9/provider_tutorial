import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/themeProvider.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Theme Changer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          RadioListTile(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          RadioListTile(
              title: Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
        ],
      ),
    );
  }
}
