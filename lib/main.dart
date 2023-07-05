import 'package:answerslecture10/question.dart';
import 'package:answerslecture10/quizBrain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const QuizPage());
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> keep = [];
  List<String> questions = [];
  void checkAnswers(bool uerChoice) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (correctAnswer == uerChoice) {
        keep.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        keep.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      setState(() {
        quizBrain.nextQuestion();
      });
    });
    if (quizBrain.isFinished()) {
      print("finished");
      keep.clear();
      quizBrain.reset();
      Alert(context: context, title: "Finished", desc: "you are done").show();
    } else {
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  //false true true
                  flex: 5,
                  child: Center(
                    child: Text(
                      quizBrain.getQuestions(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswers(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text("True",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        checkAnswers(false);
                      },
                      child: const Text(
                        "false",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: keep,
                )
              ],
            )));
  }
}
