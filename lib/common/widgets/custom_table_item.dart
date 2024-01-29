import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skrew/common/constants/random.dart';

import '../utils/coloors.dart';

class CustomTableItem extends StatelessWidget {
  const CustomTableItem({
    super.key,
    required this.color,
    this.onlyNumbers = false,
    this.enable = true,
    this.readOnly,
    this.initialValue,
    this.isRight = false,
    this.isLast = false,
    this.fontSize,
    this.child,
    this.onChange,
    this.controller,
    this.textColor,
    this.focusNode,
    this.onTap,
    this.onEditingComplete,
  });
  final Color color;
  final Color? textColor;
  final bool enable;
  final bool? readOnly;
  final bool onlyNumbers;
  final bool isRight;
  final bool isLast;
  final double? fontSize;
  final String? initialValue;
  final Widget? child;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  final Function(String value)? onChange;
  final Function()? onEditingComplete;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final BorderSide border = BorderSide(
      color: Coloors.darkOrange,
      width: 2,
    );
    return GestureDetector(
      onTap: !enable ? onTap : null,
      child: Container(
        width: tableItemWidth,
        decoration: BoxDecoration(
          color: color,
          border: Border(
            top: border,
            right: isRight ? border : BorderSide.none,
            left: border,
            bottom: isLast ? border : BorderSide.none,
          ),
        ),
        child: child ??
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              onTap: onTap,
              enabled: enable,
              readOnly: readOnly ?? false,
              initialValue: initialValue,
              keyboardType: onlyNumbers
                  ? const TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false,
                    )
                  : TextInputType.text,
              inputFormatters: onlyNumbers
                  ? [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ]
                  : null,
              maxLines: 1,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? 18,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 1,
                  vertical: 2,
                ),
              ),
              onChanged: onChange,
            ),
      ),
    );
  }
}
