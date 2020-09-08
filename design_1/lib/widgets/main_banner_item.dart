import 'package:flutter/material.dart';

// 메인 배너 아이템
class MainBannerItem extends StatelessWidget {
  final String subTitle, title;

  const MainBannerItem({
    Key key,
    this.subTitle,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeee2d6),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 서브타이틀
            Text(
              subTitle ?? "",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff444444),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // 메인 타이틀
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Color(0xff444444),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
