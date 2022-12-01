import 'package:flutter/material.dart';
import 'package:vascomm_test/widget/color_palette.dart';
import 'package:vascomm_test/widget/font_style.dart';

class FormFieldCustom extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool isObscure;
  final bool isShowForgotPassword;
  final TextEditingController? controller;
  const FormFieldCustom({
    Key? key,
    this.label,
    this.hintText,
    this.isObscure = false,
    this.isShowForgotPassword = false,
    this.controller,
  }) : super(key: key);

  @override
  State<FormFieldCustom> createState() => _FormFieldCustomState();
}

class _FormFieldCustomState extends State<FormFieldCustom> {
  bool _isHidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label ?? '-',
                  style: FontCustomStyle.fontGilroyDarkBlueSemiBold16,
                ),
                widget.isShowForgotPassword == true
                    ? Text(
                        'Lupa Password anda ?',
                        style: FontCustomStyle.fontGilroyLightBlueSemiBold14,
                      )
                    : Container(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 16.0,
            shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: TextFormField(
                controller: widget.controller,
                obscureText: _isHidePassword,
                cursorColor: const Color(0xFFBEBEBE),
                style: FontCustomStyle.fontProximaNovaBlackRegular12,
                decoration: InputDecoration(
                    hintText: widget.hintText ?? '-',
                    hintStyle: FontCustomStyle.fontProximaNovaDarkGreyRegular12,
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(
                      24.0,
                      13.0,
                      20.0,
                      13.0,
                    ),
                    border: InputBorder.none,
                    suffixIcon:
                        widget.isObscure == true ? passwordField() : null),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return GestureDetector(
      onTap: () {
        _togglePasswordVisibility();
      },
      child: Icon(
        _isHidePassword ? Icons.visibility_off : Icons.visibility,
        color: Palette.darkGrey,
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
}
