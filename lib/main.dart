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
                  num: 1.96,
                ),
              ),
              // Second Image List
              Expanded(
                flex: 3,
                child: ImageList(
                  startIndex: 20,
                  duration: 30,
                  num: 1.96,
                ),
              ),
              // Center Container with fixed height
              SizedBox(
                height: 200,
                child: CenterContainer(),
              ),
              // Third Image List
              Expanded(
                flex: 3,
                child: ImageList(
                  startIndex: 20,
                  duration: 35,
                  num: 1.96,
                ),
              ),
              // Fourth Image List
              Expanded(
                flex: 3,
                child: ImageList(
                  startIndex: 20,
                  duration: 25,
                  num: 1.96,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
