import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/utils/coloors.dart';

class CustomTableItem extends StatelessWidget {
  const CustomTableItem({
    super.key,
    required this.color,
    this.onlyNumbers = false,
    this.enable = true,
    this.initialValue,
    this.isRight = false,
    this.isLast = false,
    this.fontSize,
    this.child,
    this.onChange,
    this.controller,
  });
  final Color color;
  final bool enable;
  final bool onlyNumbers;
  final bool isRight;
  final bool isLast;
  final double? fontSize;
  final String? initialValue;
  final Widget? child;
  final TextEditingController? controller;

  final Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    final BorderSide border = BorderSide(
      color: Coloors.darkOrange,
      width: 2.5,
    );
    return Container(
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
            enabled: enable,
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
              color: Colors.white,
              fontSize: fontSize ?? 17,
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
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../../../common/utils/coloors.dart';

// class CustomTableItem extends StatelessWidget {
//   const CustomTableItem({
//     super.key,
//     this.color,
//     this.onlyNumbers = false,
//     this.enable = true,
//     this.initialValue,
//     this.isLeft = false,
//     this.isLast = false,
//     this.fontSize,
//     this.controller,
//     this.onChange,
//   });
//   final Color? color;
//   final bool enable;
//   final bool onlyNumbers;
//   final bool isLeft;
//   final bool isLast;
//   final double? fontSize;
//   final String? initialValue;
//   final TextEditingController? controller;
//   final Function(String value)? onChange;

//   @override
//   Widget build(BuildContext context) {
//     final BorderSide border = BorderSide(
//       color: Coloors.darkOrange,
//       width: 2.5,
//     );
//     return Container(
//       width: onlyNumbers ? 70 : 150,
//       decoration: BoxDecoration(
//         color: color ?? Coloors.scoreItemColor,
//         border: Border(
//           top: border,
//           right: border,
//           left: isLeft ? border : BorderSide.none,
//           bottom: isLast ? border : BorderSide.none,
//         ),
//       ),
//       child: TextFormField(
//         controller: controller,
//         enabled: enable,
//         initialValue: initialValue,
//         keyboardType: onlyNumbers
//             ? const TextInputType.numberWithOptions(
//                 decimal: false,
//                 signed: false,
//               )
//             : TextInputType.text,
//         inputFormatters: onlyNumbers
//             ? [
//                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//               ]
//             : null,
//         maxLines: 1,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: fontSize ?? 17,
//           fontWeight: FontWeight.bold,
//         ),
//         textDirection: TextDirection.rtl,
//         textAlign: TextAlign.center,
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 1,
//             vertical: 2,
//           ),
//         ),
//         onChanged: onChange,
//       ),
//     );
//   }
// }
