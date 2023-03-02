import 'package:flutter/material.dart';
import 'package:usmart/models/constants.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({super.key, required this.result, required this.questionLength});

  final int result;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 5, 41, 69),
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(
                color: neutral,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              radius: 70.0,
              backgroundColor: result == questionLength/2 ?
               Colors.yellow: result <
              questionLength/2 ? incorrect : correct,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(result == questionLength/2 
            ? 'Almost There'
            : result < questionLength/2 
              ? 'Try Again ?' 
              : 'Great!',
              style: const TextStyle(
                color: neutral,
              ),
              ),
          ],
        ),
      ),
    );
  }
}
