import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key key,
    @required this.text,
    @required this.icon,
    double size,
    Color color,
  })  : this.color = color ?? Colors.grey,
        this.size = size ?? 14,
        super(key: key);

  final String text;
  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size + 4,
          color: color,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: size ?? 14,
          ),
        ),
      ],
    );
  }
}
