import 'package:flutter/material.dart';
import './component/img_list.dart';
import './component/center_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              // First Image List
              Expanded(
                flex: 3, // Adjusted flex for better space management
                child: ImageList(
                  startIndex: 20,
                  duration: 20,
                  num: 1.98,
                ),
              ),
              // Second Image List
              Expanded(
                flex: 3,
                child: ImageList(
                  startIndex: 20,
                  duration: 30,
                  num: 1.98,
                ),
              ),
              // Center Container with fixed height

              // Third Image List
              Expanded(
                flex: 3,
                child: ImageList(
                  startIndex: 20,
                  duration: 35,
                  num: 1.98,
                ),
              ),
              // Fourth Image List
              SizedBox(
                height: 300,
                child: CenterContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
