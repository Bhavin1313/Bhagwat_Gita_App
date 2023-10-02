import 'package:departure/Views/homepage.dart';
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
      },
    ),
  );
}
