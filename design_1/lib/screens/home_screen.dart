import 'package:design_1/models/banner_item.dart';
import 'package:design_1/models/blog.dart';
import 'package:design_1/models/product.dart';
import 'package:design_1/widgets/blog_pageview.dart';
import 'package:design_1/widgets/main_banner_pageview.dart';
import 'package:design_1/widgets/product_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
    @required this.bannerItems,
    @required this.productItems,
    @required this.lipItems,
    @required this.blogItems,
  }) : super(key: key);

  final List<BannerItem> bannerItems;
  final List<ProductItem> productItems;
  final List<ProductItem> lipItems;
  final List<Blog> blogItems;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontFamily: "NanumMyeongjo"),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 메인 배너
                MainBannerPageView(
                  items: widget.bannerItems,
                ),
                ProductList(
                  title: "New Arrivals",
                  items: widget.productItems,
                  backgroundColor: Color(0xfffcf7f1),
                ),
                ProductList(
                  title: "Lip Collection",
                  items: widget.lipItems,
                  backgroundColor: Color(0xfff5eee8),
                ),
                BlogPageview(
                  title: "Beautty Blog",
                  items: widget.blogItems,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
