import 'package:flutter/material.dart';
import 'package:usmart/models/question_model.dart';
import 'package:usmart/widgets/question_widget.dart';
import '../models/constants.dart';
import 'package:usmart/widgets/next_button.dart';
import 'package:usmart/widgets/options_card.dart';
import 'package:usmart/widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '10',
      title: 'What is 20 + 2?',
      options: {'10': false, '22': true, '30': false, '13': false},
    ),
    Question(
      id: '11',
      title: 'What is 21 + 2?',
      options: {'10': false, '22': false, '30': false, '23': true},
    ),
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (ctx) => ResultsBox(
        result: score,
        questionLength: _questions.length,
        ),
        );
    } else {
      if(isPressed) {
         setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      }); 
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
          content: Text('Please, select an Option'), 
          behavior: SnackBarBehavior.floating, margin: EdgeInsets.symmetric(
            vertical: 20.0),
          )
        );

      }
     
    }
  }

void checkAnswerAndUpdate(bool value) {
if(isAlreadySelected) {
  return;
}else{
if(value == true) {
    score++;
    setState(() {
    isPressed = true;
    isAlreadySelected = true;
  });
}
  
  }
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('U-Smart'),
        backgroundColor: Colors.purpleAccent,
        actions: [
          Padding(padding: const EdgeInsets.all(18.0),
          child: Text('Score: $score',
          style: const TextStyle(
            fontSize: 18.0,
          ),
          ), 
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/category.png'),
            fit: BoxFit.fill,
          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,
              totalQuestions: _questions.length,
            ),
            const Divider(
              color: neutral,
              thickness: 2.0,
              height: 30.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                  _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                color:isPressed ? _questions[index].options.values.toList()[i] == true 
                ? correct
                : incorrect
                : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


