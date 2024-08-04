import 'package:citilink_app/utils/utils.dart';
import 'package:flutter/material.dart';

class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
  });
  final String text;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: Colors.white,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}