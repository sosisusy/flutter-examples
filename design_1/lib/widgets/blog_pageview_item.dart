import 'package:design_1/models/blog.dart';
import 'package:design_1/widgets/icon_text.dart';
import 'package:flutter/material.dart';

class BlogPageviewItem extends StatelessWidget {
  const BlogPageviewItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Blog item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          height: 1.2,
          fontFamily: "NanumMyeongjo",
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 230,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              item.title,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                // 날짜, 작성자
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                  child: Row(
                    children: [
                      Text(item.date),
                      SizedBox(
                        width: 4,
                      ),
                      Text("|"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(item.writer),
                    ],
                  ),
                ),
                Spacer(),
                // 하트, 뷰
                Row(
                  children: [
                    IconText(
                      icon: Icons.favorite_border,
                      text: "${item.favorite}",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconText(
                      icon: Icons.visibility,
                      text: "${item.view}",
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
