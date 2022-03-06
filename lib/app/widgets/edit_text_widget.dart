import 'package:drinks_everywhere/app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Input field with dynamic state
class EditTextWidget extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? errorMessage;
  final bool? obscureText;
  final bool? showValidated;
  final Widget? icon;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? isEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  const EditTextWidget(
      {Key? key,
      this.controller,
      this.onChanged,
      this.errorMessage,
      this.obscureText,
      this.icon,
      this.labelText,
      this.keyboardType,
      this.maxLength,
      this.isEnabled,
      this.backgroundColor,
      this.textStyle,
      this.labelTextStyle,
      this.hintTextStyle,
      this.inputFormatters,
      this.textInputAction,
      this.onSubmitted,
      this.showValidated})
      : super(key: key);

  @override
  _EditTextWidgetState createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText == true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: isObscure,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        onSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        style: widget.textStyle ?? textRegularMedium,
        decoration: InputDecoration(
          suffixIcon: _getSuffixIcon(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: lineBorderColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: const Color(0xff7ed321), width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: const Color(0xff7ed321), width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: errorColor, width: 2),
          ),
          labelText: widget.labelText,
          labelStyle: widget.labelTextStyle ?? textRegularMedium,
          hintStyle: widget.hintTextStyle ?? textRegularMedium,
          prefixIcon: widget.icon,
          errorText: (widget.errorMessage?.isEmpty == true)
              ? null
              : widget.errorMessage,
        ),
      ),
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.obscureText != null) {
      return IconButton(
          icon: Icon(
              isObscure == false ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isObscure = !(isObscure == true);
            });
          });
    } else {
      if (widget.showValidated == true) {
        return Icon(
          FontAwesomeIcons.check,
          color: const Color(0xff7ed321),
          size: 16,
        );
      }
    }
  }
}
