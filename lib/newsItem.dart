import 'package:flutter/material.dart';
import 'package:learn_zhihu_flutter/bean.dart';

class NewsItemWidget extends StatefulWidget {
  final NewsItem item;
  NewsItemWidget(this.item);

  @override
  State<StatefulWidget> createState() {
    return NewsItemStatus(item);
  }
}

class NewsItemStatus extends State<NewsItemWidget> {
  final NewsItem item;

  NewsItemStatus(this.item);
  void _itemClick() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _itemClick,
        child: Container(
          margin: EdgeInsets.fromLTRB(6.0, 4.0, 8.0, 4.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.content,
                    style: TextStyle(color: Colors.black87, fontSize: 14.0),
                  ),
                ),
              ),
              Image.network(
                item.url,
                width: 50.0,
                height: 50.0,
              ),
              Divider(
                color: Colors.blue,
              )
            ],
          ),
        ));
  }
}
