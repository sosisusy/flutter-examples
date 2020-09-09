import 'package:design_1/models/banner_item.dart';
import 'package:design_1/models/blog.dart';
import 'package:design_1/models/product.dart';
import 'package:design_1/screens/home_screen.dart';
import 'package:design_1/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController;
  int _currentScreen = 0;

  // 배너 아이템
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

  // 제품1
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

  // 립스틱 컬렉션
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

  // 블로그
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

    _pageController = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(
            bannerItems: bannerItems,
            blogItems: blogItems,
            lipItems: lipItems,
            productItems: productItems,
          ),
          SearchScreen(
            productItems: productItems,
          ),
          Text("test123123"),
          Text("test12333333333"),
          Text("test555555555555555555"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 23,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: _currentScreen,
        onTap: (value) {
          setState(() {
            _pageController.animateToPage(
              value,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            );
            _currentScreen = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
