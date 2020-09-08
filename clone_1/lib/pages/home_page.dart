import 'package:clone_1/widgets/bottom_sliding_pannel.dart';
import 'package:clone_1/widgets/menu_navigation_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {
      "title": "menu1",
      "color": Colors.blue[50],
      "children": [
        {
          "title": "test",
          "callback": () {
            print("test");
          },
        },
        {
          "title": "test2",
          "callback": () {
            print("test2");
          },
        },
        {
          "title": "test3",
          "callback": () {
            print("test3");
          },
        },
      ],
    },
    {
      "title": "menu2",
      "color": Colors.green[50],
      "children": [
        {
          "title": "test",
          "callback": () {
            print("test");
          },
        },
        {
          "title": "test2",
          "callback": () {
            print("test2");
          },
        },
        {
          "title": "test3",
          "callback": () {
            print("test3");
          },
        },
      ],
    },
    {
      "title": "menu3",
      "color": Colors.grey[200],
      "children": [
        {
          "title": "test",
          "callback": () {
            print("test");
          },
        },
        {
          "title": "test2",
          "callback": () {
            print("test2");
          },
        },
        {
          "title": "test3",
          "callback": () {
            print("test3");
          },
        },
      ],
    },
    {
      "title": "menu4",
      "color": Colors.purple[200],
      "children": [
        {
          "title": "test",
          "callback": () {
            print("test");
          },
        },
        {
          "title": "test2",
          "callback": () {
            print("test2");
          },
        },
        {
          "title": "test3",
          "callback": () {
            print("test3");
          },
        },
      ],
    },
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget closeWidget;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Widget _closeWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.close),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int childCount = widget.items.length;
    double statusHeight = MediaQuery.of(context).padding.top;
    double closePanelHeight = 20;
    double childHeight =
        (MediaQuery.of(context).size.height - statusHeight - closePanelHeight) /
            childCount;

    if (closeWidget == null) {
      closeWidget = _closeWidget();
    }

    var nav = widget.items.map((e) {
      Widget close;
      double statusPadding;
      var children = (e["children"] as List).map((ee) {
        return Text(ee["title"]);
      }).toList();

      if (e == widget.items.first) {
        close = closeWidget;
        statusPadding = statusHeight;
      }

      return MenuNavigationItem(
        title: Text(
          e["title"],
          style: TextStyle(fontSize: 30),
        ),
        topPanel: close,
        height: childHeight,
        statusPadding: statusPadding,
        backgroundColor: e["color"],
        children: children,
      );
    }).toList();

    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        title: Text("test"),
        actions: [
          IconButton(
            onPressed: () => _drawerKey.currentState.openEndDrawer(),
            icon: Icon(Icons.menu),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        children: nav,
      ),
      endDrawer: Drawer(
        child: Text("test"),
      ),
    );
  }
}
