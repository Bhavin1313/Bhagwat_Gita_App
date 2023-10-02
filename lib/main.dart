import 'package:departure/Views/ch1.dart';
import 'package:departure/Views/homepage.dart';
import 'package:departure/Views/versedetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Views/dhome.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => HomePage(),
        'dhome': (context) => Dhome(),
        'c1': (context) => CH1(),
        'vd': (context) => VDetail(),
      },
    ),
  );
}
