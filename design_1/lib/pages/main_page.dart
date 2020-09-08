import 'package:design_1/models/banner_item.dart';
import 'package:design_1/models/product.dart';
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
    ),
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
    ),
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
    ),
    BannerItem(
      subTitle: "Featured Collection",
      title: "Nude Lipstick\nCollection",
    ),
  ];

  List<ProductItem> productItems = [
    ProductItem(
      image: "",
      description: "Lip stick",
      name: "Lip stick",
      price: 20.00,
    ),
    ProductItem(
      image: "",
      description: "Lip stick2",
      name: "Lip stick",
      price: 25.00,
    ),
    ProductItem(
      image: "",
      description: "Lip stick3",
      name: "Lip stick",
      price: 26.00,
    ),
    ProductItem(
      image: "",
      description: "Lip stick4",
      name: "Lip stick",
      price: 23.00,
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
                ),
                ProductList(
                  title: "New Arrivals",
                  items: productItems,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
