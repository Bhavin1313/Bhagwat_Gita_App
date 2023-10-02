import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/all_chapter_moddel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "श्रीमद् भगवद्गीता",
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("gita_all_chapter.json"),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List DecodeData = jsonDecode(snapshot.data!);
            List<AllChapterModel> allData =
                DecodeData.map((e) => AllChapterModel.fromMap(data: e))
                    .toList();
            return ListView.builder(
                itemCount: allData.length,
                itemBuilder: (ctx, i) {
                  Card(
                    child: ListTile(
                      title: Text(
                        "${allData[i].nameHindi}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text("${allData.length}"),
                      leading: Text("${allData[i].chapterNo}"),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
