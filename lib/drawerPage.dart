import 'package:flutter/material.dart';

//void main() {
//  runApp(MaterialApp(
//    home: DrawPage(),
//  ));
//}

class DrawPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawPageStatus();
  }
}

class _DrawPageStatus extends State<DrawPage> {
  _reqData() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _reqData();
  }

  Widget _head() {
    return Container(
      color: Colors.blue,
      height: 150.0,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 30.0),
        child: Column(
          children: <Widget>[
            Expanded(
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
            ),
            Expanded(
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          )
                        ],
                      ),
                    )

//
                  ],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[_head()],
      ),
    );
  }
}
