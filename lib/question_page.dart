import 'dart:async';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:mathapp/main.dart';
import 'package:mathapp/provider.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  final int questionNumber;
  final int studentNumber;
  const QuestionPage(
      {super.key, required this.questionNumber, required this.studentNumber});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  void navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }

  Color timerColor = Colors.white;
  Color fillColor = Colors.white;
  Color appBarColor = Colors.blue.shade900;
  int time = 10;
  Timer? timer;
  final CountDownController timeController = CountDownController();

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 20), () {
      setState(() {
        timerColor = Colors.red;
        fillColor = Colors.red;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    Future<void> showMyDialog() async {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            Timer(const Duration(seconds: 1), navigateToHome);

            return AlertDialog(
                title: provider.myQuestionList[widget.questionNumber]
                            ['selectedOption'] ==
                        provider.myQuestionList[widget.questionNumber]
                            ['correctOption']
                    ? const Text(
                        'Correct',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )
                    : const Text('Wrong',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                content: provider.myQuestionList[widget.questionNumber]
                            ['selectedOption'] ==
                        provider.myQuestionList[widget.questionNumber]
                            ['correctOption']
                    ? Icon(
                        Icons.check_circle,
                        size:
                            MediaQuery.of(context).size.width > 600 ? 350 : 200,
                        color: Colors.green.shade900,
                      )
                    : Icon(
                        Icons.cancel_rounded,
                        size:
                            MediaQuery.of(context).size.width > 600 ? 350 : 200,
                        color: Colors.red.shade900,
                      ));
          });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width >= 900
                    ? MediaQuery.of(context).size.width * 0.10
                    : 30),
            child: CircularCountDownTimer(
              width: 60,
              height: 40,
              duration: 30,
              isReverse: true,
              fillColor: fillColor,
              ringColor: Colors.transparent,
              strokeWidth: 10,
              textStyle: TextStyle(
                  fontSize: 30, color: timerColor, fontWeight: FontWeight.bold),
              onComplete: () {
                timer!.cancel;
                showMyDialog();
              },
              controller: timeController,
            ),
          )
        ],
        toolbarHeight: 100,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(
          'Question ${widget.questionNumber + 1}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width >= 900
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width,
          height: double.infinity,
          padding: MediaQuery.of(context).size.width >= 900
              ? EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.10,
                  20, MediaQuery.of(context).size.width * 0.10, 0)
              : const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  provider.myQuestionList[widget.questionNumber]['question']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height >= 800 ? 30 : 20),
                ListTile(
                  minVerticalPadding:
                      MediaQuery.of(context).size.height >= 800 ? 25 : 10,
                  tileColor: provider.myQuestionList[widget.questionNumber]
                              ['selectedOption'] ==
                          'A'
                      ? Colors.yellow.shade900
                      : Colors.blue.shade100,
                  onTap: () {
                    provider.selectOption(widget.questionNumber, 'A');
                  },
                  title: Text(
                    provider.myQuestionList[widget.questionNumber]['optionA']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height >= 800 ? 30 : 20),
                ListTile(
                  minVerticalPadding:
                      MediaQuery.of(context).size.height >= 800 ? 25 : 10,
                  tileColor: provider.myQuestionList[widget.questionNumber]
                              ['selectedOption'] ==
                          'B'
                      ? Colors.yellow.shade900
                      : Colors.blue.shade100,
                  onTap: () {
                    provider.selectOption(widget.questionNumber, 'B');
                  },
                  title: Text(
                    provider.myQuestionList[widget.questionNumber]['optionB']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height >= 800 ? 30 : 20),
                ListTile(
                  minVerticalPadding:
                      MediaQuery.of(context).size.height >= 800 ? 25 : 10,
                  tileColor: provider.myQuestionList[widget.questionNumber]
                              ['selectedOption'] ==
                          'C'
                      ? Colors.yellow.shade900
                      : Colors.blue.shade100,
                  onTap: () {
                    provider.selectOption(widget.questionNumber, 'C');
                  },
                  title: Text(
                    provider.myQuestionList[widget.questionNumber]['optionC']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height >= 800 ? 30 : 20),
                ListTile(
                  minVerticalPadding:
                      MediaQuery.of(context).size.height >= 800 ? 25 : 10,
                  tileColor: provider.myQuestionList[widget.questionNumber]
                              ['selectedOption'] ==
                          'D'
                      ? Colors.yellow.shade900
                      : Colors.blue.shade100,
                  onTap: () {
                    provider.selectOption(widget.questionNumber, 'D');
                  },
                  title: Text(
                    provider.myQuestionList[widget.questionNumber]['optionD']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height >= 800 ? 40 : 30),
                ListTile(
                  minVerticalPadding:
                      MediaQuery.of(context).size.height >= 800 ? 25 : 10,
                  tileColor: Colors.purple.shade900,
                  onTap: () {
                    timer!.cancel();

                    //function to set that question number has been selected
                    provider.questionIsSelected(widget.questionNumber);

                    //function to set the next group that will answer after the current one
                    provider.changeGroupToAnswer();

                    timeController.pause();

                    //function to set the question the student answered to the student data
                    provider.myGroupData[widget.studentNumber]
                        ['questionAnswered'] = '${widget.questionNumber}';

                    //function to set the option the student chose to the student data
                    provider.myGroupData[widget.studentNumber]
                            ['selectedOption'] =
                        '${provider.myQuestionList[widget.questionNumber]['selectedOption']}';

                    //function to set the correct option to the question number the student chose
                    provider.myGroupData[widget.studentNumber]
                            ['correctOption'] =
                        '${provider.myQuestionList[widget.questionNumber]['correctOption']}';

                    //function to assign score to the question number that was answered
                    if (provider.myGroupData[widget.studentNumber]
                            ['selectedOption'] ==
                        provider.myGroupData[widget.studentNumber]
                            ['correctOption']) {
                      provider.myGroupData[widget.studentNumber]['score'] = '1';
                    } else {
                      provider.myGroupData[widget.studentNumber]['score'] = '0';
                    }

                    showMyDialog();
                  },
                  title: const Text(
                    'Submit Answer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
