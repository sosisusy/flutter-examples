import 'package:design_1/models/blog.dart';
import 'package:design_1/widgets/blog_pageview_item.dart';
import 'package:design_1/widgets/product_header.dart';
import 'package:flutter/material.dart';

class BlogPageview extends StatelessWidget {
  const BlogPageview({
    Key key,
    @required this.items,
    this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final Color color;
  final List<Blog> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      color: color ?? Colors.transparent,
      child: Column(
        children: [
          ProductHeader(title: title),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return BlogPageviewItem(
                  item: items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
