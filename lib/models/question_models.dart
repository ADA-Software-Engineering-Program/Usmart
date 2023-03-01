import 'dart:convert';
class Question {
  final String number;
  final String text;
  final List<String> options;
  Question({
    required this.number,
    required this.text,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'text': text,
      'options': options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      number: map['number'] as String,
      text: map['text'] as String,
      options: List<String>.from(
        (map['options'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}