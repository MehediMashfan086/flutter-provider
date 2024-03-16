import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/count_provider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Provider Count",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Consumer<CountProvider>(builder: (context, value, child) {
            print("Only build this widget");
            return Text(
              countProvider.count.toString(),
              style: const TextStyle(fontSize: 50),
            );
          }))
        ],
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
