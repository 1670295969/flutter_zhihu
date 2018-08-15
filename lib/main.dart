import 'package:flutter/material.dart';
import 'package:learn_zhihu_flutter/news_list.dart';
import 'package:learn_zhihu_flutter/theme/theme.dart';

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
//      theme: ThemeData(primaryColor: ThemeColor.appBarColor()),
      theme: ThemeColor.theme(),
      title: "haha",
      home: NewsListWidget(() {
        ThemeColor.changeTheme();
        setState(() {});
      }),
    );
  }
}
