import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mgov/config/config.dart';

class CustomInput extends StatelessWidget {
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hint;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final Color borderColor;
  final bool obscureText;
  final int? maxlength;
  final VoidCallback? onTap;

  const CustomInput(
      {this.onChange,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.hint,
      this.keyboardType,
      this.focusNode,
      this.inputFormatters,
      this.labelText,
      this.validator,
      this.borderColor = Config.social_colorPrimary,
      this.obscureText = false,
      this.maxlength,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.hint ?? "",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            onTap: onTap,
            validator: validator,
            focusNode: this.focusNode,
            onChanged: this.onChange,
            inputFormatters: inputFormatters,
            autofocus: false,
            controller: this.controller,
            keyboardType: this.keyboardType,
            cursorColor: Colors.black,
            obscureText: this.obscureText,
            maxLength: this.maxlength,
            decoration: InputDecoration(
              //labelText: this.hint,
              //labelStyle: TextStyle(color: this.borderColor),
              // filled: true,
              // fillColor: Colors.white,
              //hintText: this.hint,
              suffixIcon: this.suffixIcon,
              prefixIcon: this.prefixIcon,
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: this.borderColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
