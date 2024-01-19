import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.data,
    this.enable = true,
  });
  final void Function() onTap;
  final String data;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enable ? onTap : null,
      splashFactory: NoSplash.splashFactory,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: enable ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            data,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
