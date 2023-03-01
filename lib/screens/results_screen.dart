import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final int score;

  ResultsScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/category.png'),
            fit: BoxFit.fill,
          ),
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.emoji_events,
                  size: 150,
                  color: Colors.yellow[700],
                ),
                SizedBox(height: 20),
                Text(
                  'You scored $score out of 10!',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
