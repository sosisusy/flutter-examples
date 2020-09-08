import 'package:flutter/material.dart';

class BottomSlidingPannel extends StatefulWidget {
  BottomSlidingPannel({Key key}) : super(key: key);

  @override
  _BottomSlidingPannelState createState() => _BottomSlidingPannelState();
}

class _BottomSlidingPannelState extends State<BottomSlidingPannel> {
  double _listHeight = 0;
  bool onAnimation = true;

  final double listHeightMax = 400;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;

    // drag start listener
    void _handleVerticalDragStart(details) {
      setState(() {
        onAnimation = false;
      });
    }

    // drag update listener
    void _handleVerticalDrag(details) {
      setState(() {
        _listHeight -= details.delta.dy;

        if (_listHeight >= listHeightMax) {
          _listHeight = listHeightMax;
        } else if (_listHeight < 0) {
          _listHeight = 0;
        }
      });
    }

    // drag end listener
    void _handleVerticalDragEnd(details) {
      setState(() {
        onAnimation = true;

        if (_listHeight > listHeightMax / 2) {
          _listHeight = listHeightMax;
        } else {
          _listHeight = 0;
        }
      });
    }

    // 타이틀
    Widget _buildTitleBar() {
      return Row(
        children: [
          Icon(Icons.menu),
          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text("Menu"),
              ),
            ),
          ),
        ],
      );
    }

    return Stack(
      children: [
        Opacity(
          opacity: _listHeight / (listHeightMax * 3),
          child: Container(
            color: Colors.black,
          ),
        ),
        Positioned(
          bottom: 0,
          child: GestureDetector(
            onVerticalDragStart: _handleVerticalDragStart,
            onVerticalDragUpdate: _handleVerticalDrag,
            onVerticalDragEnd: _handleVerticalDragEnd,
            child: Container(
              width: width,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildTitleBar(),
                  AnimatedContainer(
                    duration: Duration(milliseconds: onAnimation ? 200 : 0),
                    height: _listHeight,
                    child: ListView(
                      children: [
                        Text("test"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
