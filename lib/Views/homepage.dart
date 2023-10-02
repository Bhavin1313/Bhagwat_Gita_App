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
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List DecodeData = jsonDecode(snapshot.data!);
            List<AllChapterModel> allData =
                DecodeData.map((e) => AllChapterModel.fromMap(data: e))
                    .toList();
            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (ctx, i) => Card(
                child: ListTile(
                  title: Text(
                    "${allData[i].nameHindi}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text("Verses : ${allData[i].versesCount}"),
                  leading: Text("${allData[i].chapterNo}"),
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        AllChapterModel a = AllChapterModel(
                            chapterNo: allData[i].chapterNo,
                            chapterSummaryEnglish:
                                allData[i].chapterSummaryEnglish,
                            chapterSummaryHindi: allData[i].chapterSummaryHindi,
                            id: allData[i].id,
                            imageName: allData[i].imageName,
                            jsonPath: allData[i].jsonPath,
                            nameHindi: allData[i].nameHindi,
                            nameMeaning: allData[i].nameMeaning,
                            nameTranslationEnglish:
                                allData[i].nameTranslationEnglish,
                            versesCount: allData[i].versesCount);
                        Navigator.pushNamed(context, 'dhome', arguments: a);
                      }),
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
