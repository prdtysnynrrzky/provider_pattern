import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/home_screen.dart';
import 'providers/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
