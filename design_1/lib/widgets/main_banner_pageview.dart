import 'package:design_1/models/banner_item.dart';
import 'package:design_1/widgets/main_banner_item.dart';
import 'package:design_1/widgets/pageview_index_item.dart';
import 'package:flutter/material.dart';

class MainBannerPageView extends StatefulWidget {
  final List<BannerItem> items;

  const MainBannerPageView({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  _MainBannerPageViewState createState() => _MainBannerPageViewState();
}

class _MainBannerPageViewState extends State<MainBannerPageView> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    final indexItems = widget.items.map((e) {
      return PageViewIndexItem(
        focus: _pageIndex == (i++) ? true : false,
      );
    }).toList();

    return Container(
      height: 500,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return MainBannerItem(
                subTitle: widget.items[index].subTitle,
                title: widget.items[index].title,
                background: widget.items[index].background,
              );
            },
            onPageChanged: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Row(
              children: indexItems,
            ),
          ),
        ],
      ),
    );
  }
}
