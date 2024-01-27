import 'package:flutter/material.dart';

class CustomTableRow extends StatelessWidget {
  const CustomTableRow({
    super.key,
    this.width,
    required this.children,
  });
  final double? width;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 600,
      child: Row(
        children: children,
      ),
    );
  }
}
