import 'package:answerslecture10/question.dart';

class QuizBrain {
  int _qusetionNumber = 0;

  final List<Question> _questionBrain = [
    Question(
        questions: 'You can lead a cow down stairs but not up stairs',
        QuestionAnswer: false),
    Question(
        questions: 'Approximatly one quarter of human bones are in the feet',
        QuestionAnswer: true),
    Question(questions: 'A slug\'s blood s green', QuestionAnswer: true)
  ];
  String getQuestions() {
    return _questionBrain[_qusetionNumber].questions!;
  }

  bool getQuestionAnswer() {
    return _questionBrain[_qusetionNumber].QuestionAnswer!;
  }

  void nextQuestion() {
    if (_qusetionNumber < _questionBrain.length - 1) _qusetionNumber++; //2 <2
  }

  bool? isFinished() {
    if (_qusetionNumber == _questionBrain.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qusetionNumber = 0;
  }
}
