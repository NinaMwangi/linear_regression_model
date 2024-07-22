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
    String apiUrl = 'linear-regression-model-gzzv.onrender.com';
    String predictEndpoint = '/predict';

    Map<String, dynamic> requestBody = {
      'PlaylistCount': double.parse(playlistCountController.text),
      'PlaylistReach': double.parse(playlistReachController.text),
      'ShazamCounts': double.parse(shazamCountsController.text),
    };

    try {
      var response = await http.post(
        Uri.https(apiUrl, predictEndpoint),
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.audiotrack),
            SizedBox(width: 10,),
            Text(
              'Music Streams Predictor',
              style: TextStyle(color: Colors.white)
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: playlistCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Playlist Count',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: playlistReachController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Playlist Reach',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: shazamCountsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Shazam Counts',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: predict,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10.0),),
                backgroundColor: Theme.of(context).colorScheme.primary,
                fixedSize: Size(MediaQuery.of(context).size.width - 20, 47),
                //textStyle: const TextStyle(fontWeight: FontWeight.bold)
              ), 
              child: const Text(
                'Predict',
                style: TextStyle(color: Colors.white)),
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