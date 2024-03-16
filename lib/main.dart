import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/count_provider.dart';
import 'package:provider_counter_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomeScreen(),
      ),
    );
  }
}
