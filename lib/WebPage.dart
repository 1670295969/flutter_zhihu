import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

//void main() {
//  runApp(MaterialApp(
//    home: WebPage(title: "title", id: 12),
//  ));
//}

class WebPage extends StatefulWidget {
  final String title;
  final int id;

  WebPage({this.title, this.id});

  @override
  State<StatefulWidget> createState() {
    return WebPageStatus();
  }

  static jump2Web(context, String title, int id) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, _) {
          return WebPage(
            title: title,
            id: id,
          );
        }));
  }
}

class WebPageStatus extends State<WebPage> {
  String _url = "";
  bool hasUrl = false;

  @override
  void initState() {
    super.initState();
    print("https://news-at.zhihu.com/api/4/news/${widget.id}");
    http.get("https://news-at.zhihu.com/api/4/news/${widget.id}").then((resp) {
      Map<String, dynamic> map = json.decode(resp.body);

      _url = map["share_url"];
      print(_url);
      hasUrl = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return hasUrl
        ? WebviewScaffold(
            url: _url,
            appBar: AppBar(
              title: Text(widget.title),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
