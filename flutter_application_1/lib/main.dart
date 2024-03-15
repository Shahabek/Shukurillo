import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main1.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main0(),
    ),
  );
}

class Main0 extends StatefulWidget {
  const Main0({Key? key}) : super(key: key);

  @override
  State<Main0> createState() => _Main0State();
}

class _Main0State extends State<Main0> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) => Main1(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              "https://th.bing.com/th/id/R.5339e7d9e2e13ab19795f3993402edc6?rik=yy9CU7USxGRgfA&riu=http%3a%2f%2fwww.pngplay.com%2fwp-content%2fuploads%2f2%2fTropical-Palm-Tree-PNG-Background.png&ehk=%2fV4IjzKWcQIpwhh7cK43gYxysc1NBncPNJ34lo7C7tk%3d&risl=&pid=ImgRaw&r=0",
              height: 150,
              width: 150,
            ),
          ),
          Center(
            child: Text(
              "Tropicool",
              style: TextStyle(
                fontSize: 50,
                color: Colors.green,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
