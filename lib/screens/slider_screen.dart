import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/slider_multi_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Multi Provider Example One",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Consumer<SliderMultiProvider>(
                  builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value),
                        ),
                        child: const Center(
                          child: Text("Container One"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value),
                        ),
                        child: const Center(
                          child: Text("Container Two"),
                        ),
                      ),
                    ),
                  ],
                );
              })),
          Consumer<SliderMultiProvider>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                value.setValue(val);
              },
            );
          })
        ],
      ),
    );
  }
}
