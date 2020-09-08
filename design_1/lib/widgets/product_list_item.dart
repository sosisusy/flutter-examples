import 'package:design_1/models/product.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    Key key,
    @required this.items,
    @required this.description,
    @required this.name,
    @required this.price,
    double marginLeft,
    double marginRight,
  })  : this.marginLeft = marginLeft ?? 0,
        this.marginRight = marginRight ?? 0,
        super(key: key);

  final List<ProductItem> items;
  final String description;
  final String name;
  final double price;
  final double marginLeft, marginRight;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
        ),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              description ?? "",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(name ?? ""),
            Row(
              children: [
                Text(price != null ? "\$$price" : ""),
                Spacer(),
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey[400],
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
