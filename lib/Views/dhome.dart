import 'package:flutter/material.dart';

import '../Model/all_chapter_moddel.dart';

class Dhome extends StatefulWidget {
  const Dhome({super.key});

  @override
  State<Dhome> createState() => _DhomeState();
}

class _DhomeState extends State<Dhome> {
  @override
  Widget build(BuildContext context) {
    AllChapterModel data =
        ModalRoute.of(context)!.settings.arguments as AllChapterModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.nameHindi}"),
      ),
    );
  }
}
