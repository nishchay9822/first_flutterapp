import 'package:flutter/material.dart';

import 'quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questiontext': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'blue', 'score': 4},
      ],
    },
    {
      'questiontext': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questiontext': 'Who\'s your favorite dish?',
      'answers': [
        {'text': 'aloo paratha', 'score': 10},
        {'text': 'pav bhaji', 'score': 15},
        {'text': 'egg curry', 'score': 20},
        {'text': 'chole bhature', 'score': 10},
      ],
    },
  ];
  var _index = 0;
  var _totalscore = 0;
   void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalscore = 0;
    });
   }

  void _answerquestion(int score) {
   _totalscore  += score;
    setState(() {
      _index = _index + 1;
    });
    print(_index);
    if (_index < _questions.length)
      print('we have more questions!');
    else
      print('no more questions');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'QUIZ APP',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _index < _questions.length
          ? Quiz(
              answerquestion: _answerquestion,
              questions: _questions,
              index: _index,
            )
          : Result(_totalscore,_resetQuiz),
    ));
  }
}
