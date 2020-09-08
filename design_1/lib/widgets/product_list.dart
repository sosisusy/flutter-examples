import 'package:design_1/models/product.dart';
import 'package:design_1/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<ProductItem> items;

  const ProductList({
    Key key,
    @required this.title,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff444444),
                ),
              ),
              Spacer(),
              Text(
                "View all",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff444444),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final name = items[index].name;
              final description = items[index].description;
              final price = items[index].price;

              return ProductListItem(
                items: items,
                description: description,
                name: name,
                price: price,
                marginLeft: index == 0 ? 20 : 5,
                marginRight: index == items.length - 1 ? 20 : 5,
              );
            },
          ),
        ),
      ],
    );
  }
}
