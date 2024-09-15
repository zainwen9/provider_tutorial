import 'package:flutter/material.dart';
import 'package:provider_app/provider/authProvider.dart';
import 'package:provider_app/provider/count_provider.dart';
import 'package:provider_app/provider/example_one_Provider.dart';
import 'package:provider_app/provider/favouriteItem%20Provider.dart';
import 'package:provider_app/provider/themeProvider.dart';
import 'package:provider_app/screens/NotifyListerScreen.dart';
import 'package:provider_app/screens/ThemeChanger.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.purple,
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
            ),
            home: Login(),
          );
        },
      ),
    );
  }
}
