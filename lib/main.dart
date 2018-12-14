// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

Widget myCustomComponent() {
  return Container(color: Colors.yellow);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Rectangle yeah',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Rectangle man'),
        ),
        body: HelloRectangle(),
      ),
    ),
  );
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return container;
  }
}

var container = Container(
  color: Colors.purple,
  width: 500,
  height: 400,
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(30),
  child: Column(
    children: <Widget>[
      Text('First'),
      Text('Second'),
      Text('etc'),
    ],
  )
);
