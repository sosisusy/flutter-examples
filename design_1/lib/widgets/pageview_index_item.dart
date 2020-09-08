import 'package:flutter/material.dart';

class PageViewIndexItem extends StatelessWidget {
  final bool focus;

  const PageViewIndexItem({
    Key key,
    bool focus,
  })  : this.focus = focus ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.symmetric(horizontal: 3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: focus ? Colors.black : Colors.transparent,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
