import 'package:design_1/models/product.dart';
import 'package:design_1/widgets/product_list.dart';
import 'package:design_1/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key key,
    @required this.productItems,
  }) : super(key: key);

  final List<ProductItem> productItems;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
          child: ListView(
            children: [
              SearchTextField(
                margin: EdgeInsets.all(20),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: Offset(0, 5),
                      color: Colors.grey[300],
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/banner1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ProductList(
                title: "New Arrivals",
                items: widget.productItems,
              )
            ],
          ),
        ),
      ],
    );
  }
}
