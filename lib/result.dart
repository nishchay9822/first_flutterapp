import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetHandler;
  Result(this.resultscore,this.resetHandler);
  String get resultPhrase {
    String resulttext;
    if (resultscore <= 20) {
      resulttext = 'you are awesome';
    } else if (resultscore <= 25) {
      resulttext = 'pretty likeable';
    } else if (resultscore <= 40) {
      resulttext = 'you are  strange';
    } else {
      resulttext = 'you are bad';
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 28),
          ),
           FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,),],
      ),
    );
  }
}
