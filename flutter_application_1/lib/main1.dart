import 'package:flutter/material.dart';
import 'main2.dart';
import 'main3.dart';
import 'main4.dart';
import 'main5.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main1(),
    ),
  );
}

class Main1 extends StatefulWidget {
  const Main1({Key? key}) : super(key: key);

  @override
  State<Main1> createState() => _Main1State();
}

class _Main1State extends State<Main1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.grey[900],
          title: Text(
            "Today's Tasks",
            style: TextStyle(
              fontSize: 25,
              color: Colors.green,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            dividerColor: Colors.black,
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.green,
            tabs: [
              Tab(text: "Personal"),
              Tab(text: "Default"),
              Tab(text: "Study"),
              Tab(text: "Work"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Main2(),
            Main3(),
            Main4(),
            Main5(),
          ],
        ),
      ),
    );
  }
}
