import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_zhihu_flutter/banner/banner_item.dart';

class MainBanner extends StatefulWidget {
  final List<BannerItem> bannerList;

  MainBanner(this.bannerList);

  @override
  State<StatefulWidget> createState() {
    return _MainBannerStatus();
  }
}

class _MainBannerStatus extends State<MainBanner> {
  int _nowIndex = 0;

  int _getLen() {
    return widget.bannerList == null ? 0 : widget.bannerList.length;
  }

  PageController _pageController = new PageController(initialPage: 0);

  Timer _timer;
  //通过时间timer做轮询，达到自动播放的效果
  initTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_nowIndex == _getLen() - 1) {
        _nowIndex = -1;
      }
      _pageController.animateToPage(_nowIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  void initState() {
    super.initState();
    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  //创建指示器
  Widget _buildInds() {
    List<Widget> inds = List();

    for (int i = 0; i < _getLen(); i++) {
      inds.add(
        Padding(
            padding: EdgeInsets.only(left: 3.0, right: 3.0),
            child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.grey),
                    color: i == _nowIndex ? Colors.red : Colors.white))),
      );
    }

    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: inds,
      ),
    );
  }

  void _pageChanged(int index) {
    _nowIndex = index;
    setState(() {});
  }

  Widget _pageView() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _pageChanged,
      itemCount: _getLen(),
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              widget.bannerList[index].imgUrl,
              fit: BoxFit.fitWidth,
//              width: 600.0,
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  widget.bannerList[index].title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _pageView(),
          _buildInds(),
        ],
      ),
      height: 150.0,
    );
  }
}
