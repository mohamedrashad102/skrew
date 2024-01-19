import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skrew/common/utils/coloors.dart';

class OptionsItem extends StatelessWidget {
  const OptionsItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.purple.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Icon(
                isSelected ? Icons.circle_rounded : Icons.circle_outlined,
                color: isSelected ? Coloors.appBarBgColor : Colors.purple,
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
