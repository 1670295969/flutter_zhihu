import 'package:flutter/material.dart';
import 'package:learn_zhihu_flutter/news_list.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppStatus();
  }
}

class MainAppStatus extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "haha",
      home: NewsListWidget(),
    );
  }
}
