import 'package:flutter/material.dart';
import 'package:skrew/common/utils/coloors.dart';

class PlayerNameTextForm extends StatelessWidget {
  const PlayerNameTextForm({
    super.key,
    this.onChange,
    this.hintText,
    this.labelText,
    this.validator,
     this.onEditingComplete,
     this.focusNode,
     this.autofocus,
  });
  final Function(String value)? onChange;
  final Function()? onEditingComplete;
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final String? Function(String? value)? validator;
  final bool? autofocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        onChanged: onChange,
        autofocus: autofocus ?? false,
        onEditingComplete: onEditingComplete,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: TextAlign.center,
        focusNode: focusNode,
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
            borderSide: BorderSide(
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
