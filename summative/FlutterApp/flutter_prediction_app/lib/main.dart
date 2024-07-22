import 'package:flutter/material.dart';
import 'package:flutter_prediction_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Streams Predictor',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.amber,
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black45)
        )
      ),
      home: const PredictionPage(),
    );
  }
}

