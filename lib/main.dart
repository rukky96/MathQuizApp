import 'package:flutter/material.dart';
import 'package:mathapp/groups_data.dart';
import 'package:mathapp/provider.dart';
import 'package:mathapp/question_page.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width >= 900
                    ? MediaQuery.of(context).size.width * 0.10
                    : 30),
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
        centerTitle: true,
        title: const Text(
          'MATH QUIZ Questions',
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        QuestionPage(questionNumber: index),
                                  ));
                              provider.questionIsSelected(index);
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
