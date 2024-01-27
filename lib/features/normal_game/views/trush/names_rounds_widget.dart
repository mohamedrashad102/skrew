// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class NamesRoundsWidget extends StatelessWidget {
//   const NamesRoundsWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140, // Adjusted width
//       height: 70,
//       decoration: BoxDecoration(
//         border: Border.all(),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 10,
//             left: 5,
//             child: _buildRotatedText('الجولات'),
//           ),
//           Positioned(
//             bottom: 26,
//             left: -35,
//             child: _buildDiagonalLine(),
//           ),
//           Positioned(
//             bottom: 15,
//             right: 5,
//             child: _buildRotatedText('الاسماء'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRotatedText(String text) {
//     return Transform.rotate(
//       angle: -math.pi / 6,
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _buildDiagonalLine() {
//     return Transform.rotate(
//       angle: -math.pi / 6.7,
//       child: Container(
//         height: 1,
//         width: 180, // Adjusted width
//         color: Colors.red,
//       ),
//     );
//   }
// }
