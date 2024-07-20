import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  TextEditingController playlistCountController = TextEditingController();
  TextEditingController playlistReachController = TextEditingController();
  TextEditingController shazamCountsController = TextEditingController();
  String predictionResult = '';

  Future<void> predict() async {
    String apiUrl = 'http://127.0.0.1:8000';
    String predictEndpoint = '/predict';

    Map<String, dynamic> requestBody = {
      'PlaylistCount': double.parse(playlistCountController.text),
      'PlaylistReach': double.parse(playlistReachController.text),
      'ShazamCounts': double.parse(shazamCountsController.text),
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl + predictEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        setState(() {
          predictionResult = 'Predicted Streams: ${jsonDecode(response.body)['predicted_streams']}';
        });
      } else {
        setState(() {
          predictionResult = 'Error: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        predictionResult = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Streams Predictor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: playlistCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Playlist Count'),
            ),
            TextField(
              controller: playlistReachController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Playlist Reach'),
            ),
            TextField(
              controller: shazamCountsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Shazam Counts'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: predict,
              child: const Text('Predict'),
            ),
            const SizedBox(height: 20.0),
            Text(
              predictionResult,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}