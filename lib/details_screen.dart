import 'dart:developer';

import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final data;
  const Details({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data['name']);
    log(data['name']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        height: 100,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Name: " + data['name']),
              Text("Age: " + data['age'])
            ],
          ),
        ),
      ),
    );
  }
}
