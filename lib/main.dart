import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  markTrue() {
    setState(() {
      if (questionNumber < questions.length - 1) {
        if (answers[questionNumber] == true) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          questionNumber++;
          rightScore++;
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          questionNumber++;
          wrongScore++;
        }
      } else if (questionNumber == questions.length - 1) {
        if (answers[questionNumber] == true) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          questionNumber = 0;
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          questionNumber = 0;
        }
        rightScore = 0;
        wrongScore = 0;
      }
    });
  }

  markFalse() {
    setState(() {
      if (questionNumber < questions.length - 1) {
        if (answers[questionNumber] == false) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          questionNumber++;
          rightScore++;
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          questionNumber++;
          wrongScore++;
        }
      } else if (questionNumber == questions.length - 1) {
        if (answers[questionNumber] == false) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          questionNumber = 0;
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          questionNumber = 0;
        }
        rightScore = 0;
        wrongScore = 0;
      }
    });
  }

  List<Icon> scorekeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers = [false, true, true];
  int questionNumber = 0;
  int rightScore = 0;
  int wrongScore = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                markTrue();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                markFalse();
//                setState(() {
//                  scorekeeper.add(Icon(
//                    Icons.check,
//                    color: Colors.red,
//                  ));
//                  if (questionNumber < 2) {
//                    questionNumber = questionNumber + 1;
//                  } else
//                    questionNumber = 0;
//                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'Score: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  markTrue();
                },
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
            Text(
              '$rightScore',
              style: TextStyle(
                color: Colors.green,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Icon(
              Icons.close,
              color: Colors.red,
            ),
            Text(
              '$wrongScore',
              style: TextStyle(
                color: Colors.red,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scorekeeper,
        ),
        Text(
          'That\'s all! You scored $rightScore out of ${questions.length} Questions',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
