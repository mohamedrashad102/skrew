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
    const double height = 20;
    return Align(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Coloors.scoreItemColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: height,
                    width: height,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Coloors.scoreItemColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSelected,
                    child: Container(
                      height: height - 10,
                      width: height - 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
