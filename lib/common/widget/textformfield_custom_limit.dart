import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFormFieldCustomLimit extends StatelessWidget {
  final String hintText, text;
  final bool obscureText, enabled;
  final Function onChanged;
  final TextInputType textInputType;

  final int maxlines;
  final int limit;
  final TextInputAction textInputAction;
  final Color textColor;
  final Color borderColor;
  final Color fillColor;
  final String? error;
  final VoidCallback onEditComplete;
  final ValueChanged<String>? textChanged;

  final TextEditingController controller;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Widget suffix;


  final FormFieldValidator<String> validator;
  final FocusNode focusNode;
  final double radius;

  const TextFormFieldCustomLimit(
      {required this.onEditComplete,
        required this.error,
        required this.textColor,
        required this.borderColor,
        required this.fillColor,
        required this.textInputAction,
        required this.maxlines,
        required this.text,
        required this.hintText,
        required this.obscureText,
        required this.onChanged,
        required this.enabled,
        required this.limit,
        required this.textInputType,
        required this.controller,
        required this.hintStyle,
        required this.textStyle,
        required this.validator,
        required this.textChanged,
        required this.focusNode,
        required this.radius,
        required this.suffix,

      });

  @override
  Widget build(BuildContext context) {
    TextEditingController? _controller = TextEditingController(text: text);

    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: 5.0,right: 5.0,left: 5.0,top: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: borderColor,width: 1.0)
        ),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          maxLines: maxlines,
          autocorrect: true,
          enabled: enabled,
          style: textStyle,
          maxLength: limit,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          onChanged: textChanged,
          onEditingComplete: onEditComplete,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 12, right: 0, top: 10, bottom:0),
            hintText: hintText,
            hintStyle: hintStyle,
            suffixIcon: suffix,
            isDense: true,
            filled: true,
            fillColor: fillColor,
            border: InputBorder.none,
            disabledBorder:  InputBorder.none,
            enabledBorder:  InputBorder.none,
            focusedBorder:  InputBorder.none,
            errorBorder: InputBorder.none,
          ),
          validator: validator,
        ),
      )



    );
  }
}
