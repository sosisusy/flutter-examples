import 'package:flutter/material.dart';

class CameraCaptureButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const CameraCaptureButton({
    Key key,
    this.size,
    @required this.onPressed,
  }) : super(key: key);

  void _handleTap() {
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        height: size,
        width: size,
      ),
    );
  }
}
