import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate dynamic padding and font sizes based on screen size
    final textSize = screenWidth * 0.06; // Font size relative to screen width
    final buttonPadding =
        screenWidth * 0.03; // Padding relative to screen width
    final buttonWidth =
        screenWidth * 0.4; // Button width relative to screen width

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.08, top: screenHeight * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi!\nIt's Anshumaan Khare",
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Dynamic spacing
              InkWell(
                onTap: () {
                  print("Going to my Website!");
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: buttonWidth,
                  padding: EdgeInsets.all(buttonPadding),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "MY WEBSITE",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
