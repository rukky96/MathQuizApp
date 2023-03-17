import 'package:flutter/material.dart';
import 'package:mathapp/main.dart';
import 'package:mathapp/provider.dart';
import 'package:provider/provider.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  TextEditingController groupOptionController = TextEditingController();
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
            'Add Student',
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
              controller: firstNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('First Name')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: surnameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Surname')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLength: 1,
              controller: groupOptionController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Group')),
            ),
            const SizedBox(height: 20),
            ListTile(
              minVerticalPadding: 15,
              onTap: () {
                provider.addStudent(firstNameController.text,
                    surnameController.text, groupOptionController.text);
                firstNameController.clear();
                surnameController.clear();
                groupOptionController.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              title: const Text(
                'Add To Group Data',
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
