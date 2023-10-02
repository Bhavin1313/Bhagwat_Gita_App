import 'package:flutter/material.dart';

import '../Model/all_chapter_moddel.dart';

class CH1 extends StatefulWidget {
  const CH1({super.key});

  @override
  State<CH1> createState() => _CH1State();
}

class _CH1State extends State<CH1> {
  @override
  Widget build(BuildContext context) {
    AllChapterModel data1 =
        ModalRoute.of(context)!.settings.arguments as AllChapterModel;
    return Scaffold();
  }
}
