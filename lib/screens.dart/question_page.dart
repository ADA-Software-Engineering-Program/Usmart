import 'package:flutter/material.dart';


class QuestionPage extends StatefulWidget {
  final Question question;

  QuestionPage({this.question});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
   String selectedOption;
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question ${widget.question.number}"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question.text,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Column(
              children: widget.question.options
                  .map(
                    (option) => RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                setState(() {
                  showResult = true;
                });
              },
            ),
            SizedBox(height: 16.0),
            showResult
                ? Text(
                    selectedOption == widget.question.answer
                        ? "Correct!"
                        : "Incorrect.",
                    style: TextStyle(
                      color: selectedOption == widget.question.answer
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

