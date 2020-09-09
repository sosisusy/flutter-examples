import 'package:design_1/models/banner_item.dart';
import 'package:design_1/models/blog.dart';
import 'package:design_1/models/product.dart';
import 'package:design_1/widgets/blog_pageview.dart';
import 'package:design_1/widgets/main_banner_pageview.dart';
import 'package:design_1/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BannerItem> bannerItems = [
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
      background: "#efe2d9",
    ),
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
      background: "#efe2c9",
    ),
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
      background: "#ffe2d9",
    ),
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
      background: "#cfe2d9",
    ),
  ];

  List<ProductItem> productItems = [
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick",
      name: "Lip stick",
      price: 20.00,
    ),
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick2",
      name: "Lip stick",
      price: 25.00,
    ),
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick3",
      name: "Lip stick",
      price: 26.00,
    ),
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick4",
      name: "Lip stick",
      price: 23.00,
    ),
  ];

  List<ProductItem> lipItems = [
    ProductItem(
      image: "images/lip1.jpg",
      description: "Lip stick",
      name: "Lip stick",
      price: 20.00,
    ),
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick2",
      name: "Lip stick",
      price: 25.00,
    ),
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick3",
      name: "Lip stick",
      price: 26.00,
    ),
    ProductItem(
      image: "images/shirt1.jpg",
      description: "Lip stick4",
      name: "Lip stick",
      price: 23.00,
    ),
  ];

  List<Blog> blogItems = [
    Blog(
      title: "My go-to new nude\npalette look",
      date: "1 day ago",
      writer: "Dany",
      favorite: 680,
      view: 984,
      image: "images/animal1.jpg",
    ),
    Blog(
      title: "My go-to new nude\npalette look",
      date: "2 day ago",
      writer: "Dany",
      favorite: 152,
      view: 501,
      image: "images/dog1.png",
    ),
    Blog(
      title: "My go-to new nude\npalette look",
      date: "3 day ago",
      writer: "Dany",
      favorite: 44,
      view: 485,
      image: "images/food1.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 메인 배너
                MainBannerPageView(
                  items: bannerItems,
                ),
                ProductList(
                  title: "New Arrivals",
                  items: productItems,
                  backgroundColor: Color(0xfffcf7f1),
                ),
                ProductList(
                  title: "Lip Collection",
                  items: lipItems,
                  backgroundColor: Color(0xfff5eee8),
                ),
                BlogPageview(
                  title: "Beautty Blog",
                  items: blogItems,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
