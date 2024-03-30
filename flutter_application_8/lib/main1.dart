import 'dart:ui';
import 'package:flutter/material.dart';
import 'main2.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String usernameText = '';
  String passwordText = '';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Imagess/white.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Icon(Icons.check, size: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 15),
                  child: Text(
                    'Bato',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Welcome!',
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(height: 80),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: usernameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    labelText: 'Username',
                  ),
                  onSubmitted: (String value) {
                    setState(() {
                      usernameText = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center, // Matn markaziga qaratilgan
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    labelText: 'Password',
                  ),
                  onSubmitted: (String value) {
                    setState(() {
                      passwordText = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String correctUsername = 'Shukurillo08';
                  String correctPassword = '1111qq++';

                  if (usernameController.text == correctUsername &&
                      passwordController.text == correctPassword) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DynamicRows(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text('Xatolik'),
                          content: Text(
                              'Noto\'g\'ri foydalanuvchi nomi yoki parol!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: Size(200, 50),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text('Username: $usernameText'),
            ),
            Center(
              child: Text('Password: $passwordText'),
            ),
            SizedBox(height: 20),
            Center(
              child: Text('Usename: Shukurillo08'),
            ),
            Center(
              child: Text('Password: 1111qq++'),
            ),
          ],
        ),
      ),
    );
  }
}
