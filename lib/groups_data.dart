import 'package:flutter/material.dart';
import 'package:mathapp/provider.dart';
import 'package:provider/provider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class GroupDataPage extends StatefulWidget {
  const GroupDataPage({super.key});

  @override
  State<GroupDataPage> createState() => _GroupDataPageState();
}

class _GroupDataPageState extends State<GroupDataPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    provider.setTableRow();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Group Performance',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
        body: MediaQuery.of(context).size.width >= 900
            ? Row(
                children: [
                  Container(
                      clipBehavior: Clip.none,
                      width: MediaQuery.of(context).size.width * 0.48,
                      child: Table(children: provider.myTableRow)),
                  Container(
                      clipBehavior: Clip.none,
                      width: MediaQuery.of(context).size.width * 0.48,
                      child: Table(children: provider.myTableRow)),
                ],
              )
            : ContainedTabBarView(tabs: const [
                Text('GROUP A'),
                Text('GROUP B')
              ], views: [
                Container(
                    clipBehavior: Clip.none,
                    child: Table(children: provider.myTableRow)),
                Container(
                    clipBehavior: Clip.none,
                    child: Table(children: provider.myTableRow)),
              ]));
  }
}
