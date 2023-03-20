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
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: MediaQuery.of(context).size.width >= 900
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
              : ContainedTabBarView(
                  tabBarProperties: const TabBarProperties(
                      height: 30,
                      indicatorColor: Colors.black,
                      alignment: TabBarAlignment.start,
                      labelPadding: EdgeInsets.all(0),
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  tabs: const [
                      Text(
                        'GROUP A',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'GROUP B',
                        textAlign: TextAlign.left,
                      )
                    ],
                  views: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          clipBehavior: Clip.none,
                          child: Column(
                            children: [
                              const Text('GROUP A'),
                              Table(children: provider.myTableRow),
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.all(10),
                          clipBehavior: Clip.none,
                          child: Column(
                            children: [
                              const Text('GROUP A'),
                              Table(children: provider.myTableRow),
                            ],
                          )),
                    ]),
        ));
  }
}
