import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  List<Map<String, String>> questionList = [
    {
      'question': 'How many states are in Nigeria?',
      'optionA': '28',
      'optionB': '30',
      'optionC': '36',
      'optionD': '32',
      'selectedOption': '',
      'correctOption': 'C',
      'questionSelected': 'no'
    },
    {
      'question': 'How many days are in a week?',
      'optionA': '7',
      'optionB': '8',
      'optionC': '9',
      'optionD': '10',
      'correctOption': 'A',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'What is the first day of the week?',
      'optionA': 'Monday',
      'optionB': 'Tuesday',
      'optionC': 'Wednesday',
      'optionD': 'Sunday',
      'correctOption': 'D',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'Who is the president of Nigeria?',
      'optionA': 'Lai Mohammed',
      'optionB': 'Muhammadu Buhari',
      'optionC': 'Goodluck Jonathan',
      'optionD': 'Olusegun Obasanjo',
      'correctOption': 'B',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'The Federal Capital Territory of Nigeria is',
      'optionA': 'Abuja',
      'optionB': 'Asaba',
      'optionC': 'Lagos',
      'optionD': 'Calabar',
      'correctOption': 'A',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'Which of the following is not a planet?',
      'optionA': 'Pluto',
      'optionB': 'Moon',
      'optionC': 'Saturn',
      'optionD': 'Earth',
      'correctOption': 'B',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'How many months are in a calendar year?',
      'optionA': '10',
      'optionB': '11',
      'optionC': '12',
      'optionD': '13',
      'correctOption': 'C',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'Who is the President of the United States of America?',
      'optionA': 'Joe Biden',
      'optionB': 'George Bush',
      'optionC': 'Bill Clinton',
      'optionD': 'Barrack Obama',
      'correctOption': 'A',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'How many states are in the United States?',
      'optionA': '25',
      'optionB': '30',
      'optionC': '45',
      'optionD': '50',
      'correctOption': 'D',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'The biggest planet is ____',
      'optionA': 'Mars',
      'optionB': 'Jupiter',
      'optionC': 'Venus',
      'optionD': 'Mercury',
      'correctOption': 'B',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'What is the sum of five and eight?',
      'optionA': 'twenty-two',
      'optionB': 'thirty',
      'optionC': 'eleven',
      'optionD': 'thirteen',
      'correctOption': 'D',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'Spain is a country in',
      'optionA': 'Africa',
      'optionB': 'Australia',
      'optionC': 'Europe',
      'optionD': 'North America',
      'correctOption': 'C',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'Which of the following is not a vowel?',
      'optionA': 'l',
      'optionB': 'a',
      'optionC': 'o',
      'optionD': 'u',
      'correctOption': 'A',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'Which of the following is a consonant?',
      'optionA': 'l',
      'optionB': 'a',
      'optionC': 'o',
      'optionD': 'u',
      'correctOption': 'A',
      'selectedOption': '',
      'questionSelected': 'no'
    },
    {
      'question': 'What is the gender of a boy?',
      'optionA': 'male',
      'optionB': 'female',
      'optionC': 'shemale',
      'optionD': 'bisexual',
      'correctOption': 'A',
      'selectedOption': '',
      'questionSelected': 'no'
    }
  ];
  List<Map<String, String>> get myQuestionList => questionList;
  int count = 0;
  int get myCount => count;

  addQuestion(String question, String optionA, String optionB, String optionC,
      String optionD, String correctOption) {
    Map<String, String> questionToAdd = {
      'question': question,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correctOption': correctOption,
      'selectedOption': '',
      'questionSelected': 'no'
    };
    myQuestionList.add(questionToAdd);
    notifyListeners();
  }

  questionIsSelected(int index) {
    myQuestionList[index]['questionSelected'] = 'yes';
    notifyListeners();
  }

  selectOption(int index, String option) {
    myQuestionList[index]['selectedOption'] = option;
    notifyListeners();
  }

  List<Map<String, String>> groupData = [
    {
      'firstName': 'Kelvin',
      'surname': 'Akproko',
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'groupA'
    },
    {
      'firstName': 'Kenneth',
      'surname': 'Akproko',
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'groupB'
    },
    {
      'firstName': 'Ibrahim',
      'surname': 'Ahmed',
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'groupA'
    },
    {
      'firstName': 'Kelvin',
      'surname': 'Emamoke',
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'groupA'
    },
    {
      'firstName': 'Rukky',
      'surname': 'Brilliant',
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'groupB'
    },
    {
      'firstName': 'Cherish',
      'surname': 'Anthony',
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'groupB'
    }
  ];
  List<Map<String, String>> get myGroupData => groupData;
  List<TableRow> tableRow = [
    const TableRow(children: [
      Text(
        'S/NO',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text('FIRST NAME', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('SURNAME', style: TextStyle(fontWeight: FontWeight.bold))
    ])
  ];

  List<TableRow> get myTableRow => tableRow;
  List<TableRow> setTableRow() {
    for (Map<String, String> element in myGroupData) {
      int elementIndex = myGroupData.indexOf(element);
      if (elementIndex + 1 == myTableRow.length) {
        myTableRow.add(TableRow(children: [
          Text('${elementIndex + 1}'),
          Text('${myGroupData[elementIndex]['firstName']}'),
          Text('${myGroupData[elementIndex]['surname']}'),
        ]));
      }
    }
    return myTableRow;
  }

  addStudent(String firstName, String surname, String group) {
    Map<String, String> studentToAdd = {
      'firstName': firstName,
      'surname': surname,
      'questionAnswered': '',
      'selectedOption': '',
      'correctOption': '',
      'score': '',
      'group': 'group$group'
    };
    myGroupData.add(studentToAdd);
    notifyListeners();
  }

  int groupToAnswer = 1;
  int get myGroupToAnswer => groupToAnswer;

  changeGroupToAnswer() {
    if (myGroupToAnswer == 0) {
      groupToAnswer = 1;
    } else {
      groupToAnswer = 0;
    }

    notifyListeners();
  }
}
