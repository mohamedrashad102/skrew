import 'package:flutter/material.dart';

class TableItemModel {
  final Color? color;
  final bool enable;
  final bool onlyNumbers;
  final double? fontSize;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String value)? onChange;

  const TableItemModel({
    this.color,
    this.fontSize,
    this.enable = true,
    this.onlyNumbers = true,
    this.initialValue,
    this.controller,
    this.onChange,
  });
}
