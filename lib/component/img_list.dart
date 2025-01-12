import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  const ImageList({
    super.key,
    required this.startIndex,
    required this.duration,
    required this.num,
  });

  final int startIndex; // Total number of images
  final int duration; // Scrolling duration in seconds
  final double num; // Rotation multiplier

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      // Detect if the scroll position is at the end
      if (_controller.position.atEdge) {
        _autoScroll();
      }
    });

    // Trigger auto-scroll after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  void _autoScroll() {
    final currentScrollPosition = _controller.offset;
    final maxScrollExtent = _controller.position.maxScrollExtent;

    scheduleMicrotask(() {
      _controller.animateTo(
        currentScrollPosition == maxScrollExtent ? 0 : maxScrollExtent,
        duration: Duration(seconds: widget.duration),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust list and image sizes dynamically
    final listHeight = screenHeight * 0.2; // 20% of the screen height
    final imageWidth = screenWidth * 0.25; // 25% of the screen width

    return Scaffold(
      backgroundColor: Colors.black,
      body: Transform.rotate(
        angle: widget.num * pi, // Rotates the list for the desired effect
        child: SizedBox(
          height: listHeight, // Dynamic height
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.startIndex, // Number of images
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.01), // 1% horizontal padding
                child: Image.asset(
                  'assets/image/${index + 1}.png',
                  fit: BoxFit.cover,
                  width: imageWidth, // Dynamic width
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
