import 'package:design_1/models/product.dart';
import 'package:design_1/widgets/product_header.dart';
import 'package:design_1/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<ProductItem> items;
  final Color backgroundColor;

  const ProductList({
    Key key,
    @required this.title,
    @required this.items,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: "NanumMyeongjo",
      ),
      child: Container(
        height: 340,
        color: backgroundColor ?? Colors.transparent,
        child: Column(
          children: [
            ProductHeader(title: title),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final name = items[index].name;
                  final description = items[index].description;
                  final price = items[index].price;
                  final image = items[index].image;

                  return ProductListItem(
                    description: description,
                    name: name,
                    price: price,
                    image: image,
                    marginLeft: index == 0 ? 20 : 5,
                    marginRight: index == items.length - 1 ? 20 : 5,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
