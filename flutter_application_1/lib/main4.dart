import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main4(),
    ),
  );
}

class Main4 extends StatefulWidget {
  const Main4({Key? key}) : super(key: key);

  @override
  State<Main4> createState() => _Main4State();
}

class _Main4State extends State<Main4> {
  DateTime d1 = DateTime.now();
  TimeOfDay t1 = TimeOfDay.now();

  TextEditingController i1 = TextEditingController();
  TextEditingController d1c1 = TextEditingController();
  bool? n1 = false;
  List<String> w1 = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _getSharedPreferences();
  }

  @override
  void dispose() {
    _saveSharedPreferences(); // Ma'lumotlarni saqlash
    super.dispose();
  }

  Future<void> _getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final f1 = prefs.getStringList("workTasks");

    if (f1 != null) {
      setState(() {
        w1 = f1;
        isDataVisible = w1.isNotEmpty;
      });
    }
  }

  Future<void> _saveSharedPreferences() async {
    prefs.setStringList("workTasks", w1);
  }

  Widget _buildTaskWidget(String t) {
    return Dismissible(
      key: Key(t),
      onDismissed: (direction) {
        setState(() {
          w1.remove(t);
          isDataVisible = w1.isNotEmpty;
        });
        _saveSharedPreferences();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$t Dismissed",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                setState(() {
                  w1.add(t);
                  isDataVisible = true;
                });
                _getSharedPreferences();
              },
            ),
          ),
        );
      },
      background: Container(
        color: Colors.black,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Main6(
                task: t,
                date: d1,
                time: t1,
              ),
            ),
          ).then((result) {
            if (result != null && result == false) {
              setState(() {
                w1.remove(t);
                isDataVisible = w1.isNotEmpty;
              });
              _saveSharedPreferences();
            }
          });
        },
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$t",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${d1.day} -${d1.month} -${d1.year}",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${t1.hour}:${t1.minute}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: n1,
                activeColor: Colors.green,
                checkColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    n1 = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isDataVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: w1.length,
              itemBuilder: (context, index) {
                return _buildTaskWidget(
                  w1[index],
                );
              },
            ),
          ),
          Expanded(
            child: Visibility(
              visible: !isDataVisible,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.5339e7d9e2e13ab19795f3993402edc6?rik=yy9CU7USxGRgfA&riu=http%3a%2f%2fwww.pngplay.com%2fwp-content%2fuploads%2f2%2fTropical-Palm-Tree-PNG-Background.png&ehk=%2fV4IjzKWcQIpwhh7cK43gYxysc1NBncPNJ34lo7C7tk%3d&risl=&pid=ImgRaw&r=0"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              content: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: i1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: "Task",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: d1c1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Date",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _showDatePicker,
                          child: Text(
                            "Pick Date",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TextButton(
                          onPressed: _showTimePicker,
                          child: Text(
                            "Pick Time",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Close",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.purple,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            String task = i1.text;
                            if (task.isNotEmpty) {
                              setState(() {
                                w1.add(task);
                                isDataVisible = false;
                              });
                              Navigator.pop(context);
                              _saveSharedPreferences();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Task must be filled",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.purple,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              title: Text(
                "Adding Study Default",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add, size: 25, color: Colors.black),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: d1,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      setState(() {
        d1 = newDate;
      });
    }
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: t1,
    );

    if (newTime != null) {
      setState(() {
        t1 = newTime;
      });
    }
  }
}

class Main6 extends StatefulWidget {
  final String task;
  final DateTime date;
  final TimeOfDay time;

  Main6({required this.task, required this.date, required this.time, Key? key})
      : super(key: key);

  @override
  State<Main6> createState() => _Main6State();
}

class _Main6State extends State<Main6> {
  final _final =
      TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Personal Details",
          style: TextStyle(
              fontSize: 20, color: Colors.green, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Task", style: _final),
          Text(widget.task, style: _final),
          Text("Description", style: _final),
          Text(widget.task, style: _final),
          Text("Date:", style: _final),
          Text(
              "${widget.date.day} - ${widget.date.month} - ${widget.date.year} ${widget.time.hour}:${widget.time.minute}",
              style: _final),
        ],
      ),
    );
  }
}
