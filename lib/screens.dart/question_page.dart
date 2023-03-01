import 'package:flutter/material.dart';

import '../models/question_models.dart';


class QuestionPage extends StatefulWidget {
   final Question? question;

  const QuestionPage({super.key, this.question});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
   String? selectedOption;
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question ${widget.question?.number}"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question?.text??'',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: (widget.question?.options??<Widget>[])
                  .map(
                    (option) => RadioListTile(
                      title: Text(option.toString()),
                      value: option,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: () {
                setState(() {
                  showResult = true;
                });
              },
            ),
            const SizedBox(height: 16.0),
            showResult
                ? Text(
                    selectedOption == widget.question!.text
                        ? "Correct!"
                        : "Incorrect.",
                    style: TextStyle(
                      color: selectedOption == widget.question!.text
                          ? Colors.green
                          : Colors.red,
                      fontSize: 20.0,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

