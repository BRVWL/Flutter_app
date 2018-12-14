// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class myCustomComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 800,
      height: 400,
      child: Center(
        child: Text(
        'Yeeeaaaah',
        style: TextStyle(fontSize: 26, fontFamily: 'Arial'),
      )
      ),
    );   
  }
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
        body: myCustomComponent(),
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
