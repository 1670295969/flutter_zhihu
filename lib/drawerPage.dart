import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_zhihu_flutter/bean.dart';
import 'package:learn_zhihu_flutter/callback.dart';

//void main() {
////  runApp(MaterialApp(
////    home: DrawPage(),
////  ));
//
////  ThemeItem
//}

class DrawPage extends StatefulWidget {
  final OnThemItem themeCallBack;

  DrawPage(this.themeCallBack);

  @override
  State<StatefulWidget> createState() {
    return _DrawPageStatus();
  }
}

class _DrawPageStatus extends State<DrawPage> {
  List<ThemeItem> themeList;

  _reqData() {
//    https://news-at.zhihu.com/api/4/
    http.get("https://news-at.zhihu.com/api/4/themes").then((resp) {
      Map<String, dynamic> map = json.decode(resp.body);
      themeList = ThemeItem.json2List(map['others']);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _reqData();
  }

  Widget _headIconWithName() {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text("L"),
          ),
          Text(
            "Liu",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _headType() {
    return Expanded(
        flex: 2,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Text(
                    "我的收藏",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  Text(
                    "离线下载",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _head() {
    return Container(
      color: Colors.blue,
      height: 150.0,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, top: 30.0),
        child: Column(
          children: <Widget>[
            _headIconWithName(),
            _headType(),
          ],
        ),
      ),
    );
  }

  Widget _homeItem() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          widget.themeCallBack(-1, "首页");
        },
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "首页",
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _typeItem(ThemeItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        widget.themeCallBack(item.id, item.name);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Text(
                item.name,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.add,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildThemeList() {
    if (themeList == null || themeList.length == 0) {
      return Center(
        child: Text("暂无数据"),
      );
    } else {
      return Expanded(
        child: ListView.builder(
            itemCount: themeList == null ? 0 : themeList.length,
            itemBuilder: (context, index) {
              return _typeItem(themeList[index]);
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _head(),
          _homeItem(),
          _buildThemeList(),
        ],
      ),
    );
  }
}
