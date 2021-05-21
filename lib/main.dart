import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Color(0xffe3f2fd),
        appBar: AppBar(
          backgroundColor: Color(0xff26c6da),
          title: Center(
            child: Text(
              'Ask Me Anything',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: MagicBalls(),
        ),
      ),
    ),
  );
}

class MagicBalls extends StatefulWidget {
  const MagicBalls({Key key}) : super(key: key);

  @override
  _MagicBallsState createState() => _MagicBallsState();
}

class _MagicBallsState extends State<MagicBalls> {
  int magic = 0;
  TextEditingController userNameController = TextEditingController();
  bool userNameValidate = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        userNameValidate = true;
      });
      return false;
    }
    setState(() {
      userNameValidate = false;
    });
    return true;
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              autofocus: true,
              controller: userNameController,
              cursorColor: Colors.pink,
              textAlign: TextAlign.center,
              autocorrect: true,
              toolbarOptions: ToolbarOptions(
                cut: true,
                copy: false,
                selectAll: true,
                paste: false,
              ),
              decoration: new InputDecoration(
                labelText: "Ask your difficult life question",
                fillColor: Colors.cyan.shade100,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 80),
            color: Colors.cyan[50],
            shadowColor: Colors.cyan[100],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Touch Magic Ball',
                style: TextStyle(
                  color: Colors.cyan.shade500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                if(validateTextField(userNameController.text) == true)
                setState(() {
                  magic = Random().nextInt(5) + 1;
                  userNameController.clear();
                });
                else
                  magic = 0;
              },
              child: Image(image: AssetImage('assets/images/ball$magic.png')))
        ],
      ),
    );
  }
}
