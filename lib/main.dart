import 'package:flutter/material.dart';
import 'screens/pose_detector_view.dart';

void main() => runApp(const PushUpCounterApp());

class PushUpCounterApp extends StatelessWidget {
  const PushUpCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Push-Up Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PoseDetectorView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
