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
              gradient: LinearGradient(
                begin: Alignment(-0.89, -0.69),
                end: Alignment(0.75, 0.88),
                colors: [
                  Color(0xffE3D4F6),
                  Color(0xff7A4CB6),
                  Color(0xffA148B0),
                  Color(0xffCA44A9),
                  Color(0xffE3D4F6),
                  Color.fromRGBO(255, 170, 234, 0.37161),
                  Color.fromRGBO(255, 170, 234, 0.26),
                ],
                stops: [
                  0.1575,
                  0.4552,
                  0.6245,
                  0.8032,
                  0.9321,
                  1,
                  1,
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 48,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: 100),
                Text(
                  '❤️',
                  style: TextStyle(fontSize: 24),
                ),
              ],
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
