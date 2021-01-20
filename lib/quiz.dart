import 'package:flutter/material.dart';
import './answer.dart';
import './questin.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final Function answerquestion;
  Quiz(
      {
      @required this.questions,
      @required this.answerquestion,
      @required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[index]['questiontext'],
        ),
        ...(questions[index]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(() =>answerquestion(answer['score']),answer['text']);
        }).toList()
      ],
    );
  }
}
