import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mathapp/add_question_page.dart';
import 'package:mathapp/groups_data.dart';
import 'package:mathapp/provider.dart';
import 'package:mathapp/question_page.dart';
import 'package:provider/provider.dart';

import 'add_student_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    int getDeviceWidth() {
      int crossAxisCount = 0;
      if (deviceWidth <= 400) {
        crossAxisCount = 2;
      } else if (deviceWidth > 400 && deviceWidth <= 800) {
        crossAxisCount = 4;
      } else if (deviceWidth > 800 && deviceWidth <= 1000) {
        crossAxisCount = 6;
      } else if (deviceWidth > 1000) {
        crossAxisCount = 8;
      }
      return crossAxisCount;
    }

    final provider = Provider.of<MyProvider>(context);

    Future<void> showMyDialog(int questionSelected) async {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: provider.myGroupToAnswer == 0
                    ? const Text(
                        'GROUP A',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    : const Text('GROUP B',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                content: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width >= 700
                      ? MediaQuery.of(context).size.width * 0.6
                      : MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height >= 700
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: provider.myGroupToAnswer == 0
                        ? Column(
                            children: List.generate(provider.myGroupData.length,
                                (index) {
                            Widget groupA = Container();
                            if (provider.myGroupData[index]['group'] ==
                                'groupA') {
                              groupA = (Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ListTile(
                                  onTap: provider.myGroupData[index]
                                              ['questionAnswered'] ==
                                          ''
                                      ? () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    QuestionPage(
                                                        studentNumber: index,
                                                        questionNumber:
                                                            questionSelected),
                                              ));
                                        }
                                      : () {},
                                  tileColor: provider.myGroupData[index]
                                              ['questionAnswered'] ==
                                          ''
                                      ? Colors.blue.shade100
                                      : Colors.red.shade200,
                                  title: Text(
                                      '${provider.myGroupData[index]['surname']} ${provider.myGroupData[index]['firstName']}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ));
                            }
                            return groupA;
                          }))
                        : Column(
                            children: List.generate(provider.myGroupData.length,
                                (index) {
                            Widget groupB = Container();
                            if (provider.myGroupData[index]['group'] ==
                                'groupB') {
                              groupB = (Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ListTile(
                                  onTap: provider.myGroupData[index]
                                              ['questionAnswered'] ==
                                          ''
                                      ? () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    QuestionPage(
                                                        studentNumber: index,
                                                        questionNumber:
                                                            questionSelected),
                                              ));
                                        }
                                      : () {},
                                  tileColor: provider.myGroupData[index]
                                              ['questionAnswered'] ==
                                          ''
                                      ? Colors.blue.shade100
                                      : Colors.red.shade200,
                                  title: Text(
                                      '${provider.myGroupData[index]['surname']} ${provider.myGroupData[index]['firstName']}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ));
                            }
                            return groupB;
                          })),
                  ),
                ));
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddQuestionPage()));
              },
              icon: const Icon(Icons.add, size: 30)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddStudentPage()));
              },
              icon: const Icon(Icons.add_task, size: 30)),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width >= 900
                    ? MediaQuery.of(context).size.width * 0.10
                    : 20),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GroupDataPage()));
                },
                icon: const Icon(Icons.edit_note_sharp, size: 30)),
          )
        ],
        toolbarHeight: 100,
        backgroundColor: Colors.blue.shade900,
        centerTitle: MediaQuery.of(context).size.width >= 500 ? true : false,
        title: const Text(
          'MATH Questions',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getDeviceWidth(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          children: List.generate(
              provider.myQuestionList.length,
              (index) => ElevatedButton(
                  onPressed:
                      provider.myQuestionList[index]['questionSelected'] == 'no'
                          ? () {
                              showMyDialog(index);
                            }
                          : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: provider.myQuestionList[index]
                                ['questionSelected'] ==
                            'no'
                        ? Colors.blue.shade900
                        : Colors.red.shade900,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ))),
        ),
      ),
    );
  }
}
