import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/src/core/infra/application/app_settings.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';
import 'package:task/src/core/presenter/theme/size_outlet.dart';

import '../theme/color_outlet.dart';

class CommonTextFormField extends StatefulWidget {
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  final String label;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CommonTextFormField(
      {Key? key,
      required this.label,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.obscureText = false,
      this.inputFormatters,
      this.onFieldSubmitted,
      this.focusNode,
      this.controller})
      : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      initialValue: widget.initialValue?.toString(),
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: TextStyle(
        fontSize: ResponsiveOutlet.textMedium(context),
        color: ColorOutlet.secondary,
      ),
      cursorColor: ColorOutlet.secondary,
      obscureText: _obscureText,
      obscuringCharacter: AppSettings.obscuringCharacter,
      decoration: _inputDecoration(context),
      controller: widget.controller,
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIcon: widget.obscureText
          ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: ColorOutlet.secondary,
              ),
              onPressed: () {
                if (mounted && widget.obscureText) {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }
              },
            )
          : null,
      labelText: widget.label,
      focusedErrorBorder: _outlineInputBorderError(),
      errorStyle: TextStyle(color: ColorOutlet.accent, fontSize: ResponsiveOutlet.textDefault(context)),
      errorBorder: _outlineInputBorderError(),
      labelStyle: TextStyle(color: ColorOutlet.secondary, fontSize: ResponsiveOutlet.textMedium(context)),
      focusedBorder: _outlineInputBorderSecondary(),
      hintStyle: TextStyle(color: ColorOutlet.secondary, fontSize: ResponsiveOutlet.textMedium(context)),
      border: _outlineInputBorderSecondary(),
    );
  }

  OutlineInputBorder _outlineInputBorderSecondary() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: ColorOutlet.secondary),
      borderRadius: BorderRadius.all(Radius.circular(SizeOutlet.cornerRadiusDefault)),
    );
  }

  OutlineInputBorder _outlineInputBorderError() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: ColorOutlet.accent),
      borderRadius: BorderRadius.all(Radius.circular(SizeOutlet.cornerRadiusDefault)),
    );
  }
}
