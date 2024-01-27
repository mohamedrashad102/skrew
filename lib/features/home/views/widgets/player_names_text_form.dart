import 'package:flutter/material.dart';
import 'package:skrew/common/utils/coloors.dart';

class PlayerNameTextForm extends StatelessWidget {
  const PlayerNameTextForm({
    super.key,
    this.onChange,
    this.hintText,
    this.labelText,
    this.validator,
  });
  final Function(String value)? onChange;
  final String? hintText;
  final String? labelText;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        onChanged: onChange,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              width: 2,
              color: Coloors.darkOrange,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide:  BorderSide(
              width: 2,
              color: Coloors.nameItemColor,
            ),
          ),
          errorStyle: TextStyle(
            color: Coloors.nameItemColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          hintText: hintText,
          labelText: labelText,
          alignLabelWithHint: false,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.8),
          ),
          hintTextDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
