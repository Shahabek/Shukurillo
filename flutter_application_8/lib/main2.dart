import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Rows',
      home: Scaffold(
        body: DynamicRows(),
      ),
    );
  }
}

class DynamicRows extends StatefulWidget {
  @override
  _DynamicRowsState createState() => _DynamicRowsState();
}

class _DynamicRowsState extends State<DynamicRows> {
  List<String> Rows = [];

  @override
  void initState() {
    super.initState();
    generateRows();
  }

  void generateRows() {
    String currentRow = "X";
    Rows.add(currentRow);
    for (int i = 0; i < 25; i++) {
      currentRow = currentRow + "X" * 2;
      Rows.add(currentRow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Rows.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              Rows[index],
            ),
          );
        },
      ),
    );
  }
}
