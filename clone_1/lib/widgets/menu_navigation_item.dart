import 'package:flutter/material.dart';

class MenuNavigationItem extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> children;
  final Widget title;
  final bool isFocus;
  final VoidCallback onTap;
  final double height;
  final double statusPadding;
  final Widget topPanel;

  MenuNavigationItem({
    Key key,
    this.height,
    @required this.title,
    @required this.children,
    this.isFocus,
    this.topPanel,
    this.statusPadding,
    this.backgroundColor = Colors.transparent,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: statusPadding ?? 0,
        ),
        topPanel ?? Container(),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: height,
          width: MediaQuery.of(context).size.width,
          child: title,
        )
      ],
    );
  }
}
