import 'package:flutter/material.dart';
import 'package:mathapp/main.dart';
import 'package:mathapp/provider.dart';
import 'package:provider/provider.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController optionAController = TextEditingController();
  TextEditingController optionBController = TextEditingController();
  TextEditingController optionCController = TextEditingController();
  TextEditingController optionDController = TextEditingController();
  TextEditingController correctOptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    String? errorText;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Add Question',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
          )),
      body: Container(
        padding: MediaQuery.of(context).size.width >= 900
            ? EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.10, 20,
                MediaQuery.of(context).size.width * 0.10, 0)
            : const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                if (value == '') {
                  errorText = 'Value cannot be empty';
                }
              },
              maxLines: 5,
              controller: questionController,
              decoration: InputDecoration(
                  errorText: errorText,
                  border: const OutlineInputBorder(),
                  label: const Text('Question')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: optionAController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Option A')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: optionBController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Option B')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: optionCController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Option C')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: optionDController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Option D')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLength: 1,
              controller: correctOptionController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Correct Option')),
            ),
            const SizedBox(height: 20),
            ListTile(
              minVerticalPadding: 15,
              onTap: () {
                provider.addQuestion(
                    questionController.text,
                    optionAController.text,
                    optionBController.text,
                    optionCController.text,
                    optionDController.text,
                    correctOptionController.text);
                questionController.clear();
                optionAController.clear();
                optionBController.clear();
                optionCController.clear();
                optionDController.clear();
                correctOptionController.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              title: const Text(
                'Add To Questions',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              tileColor: Colors.purple.shade900,
            )
          ],
        ),
      ),
    );
  }
}
