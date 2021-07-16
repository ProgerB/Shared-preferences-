import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'details_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  String textname = '';
  String textage = '';
  List result = [];

  Future saveText() async {
    textname = _controllerName.text;
    textage = _controllerAge.text;
    SharedPreferences pref = await SharedPreferences.getInstance();
    log(textname + ' - ' + textage);
    // result[0] = pref.setString('name', textname).toString();
    // result[1] = pref.setString('age', textage).toString();
    pref.setString('name', textname).toString();
    pref.setString('age', textage).toString();
    // resultName;
  }

  Future showText() async {
    // textname = _controllerName.text;
    SharedPreferences pref = await SharedPreferences.getInstance();
    log(pref.getString("name").toString());
    log(pref.getString("age").toString());
    setState(() {
      textname = pref.getString("name").toString();
      textage = pref.getString('age').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref..."),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    hintText: "Name"),
              ),
            ),
            SizedBox(
              width: 500,
              child: TextField(
                controller: _controllerAge,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    hintText: "Age"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: saveText,
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: showText,
                    child: Text(
                      'Show',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  data: {'name': textname, 'age': textage},
                                ))),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ))
              ],
            ),
            Container(
              height: 80,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(textname + '   '), Text(textage)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
