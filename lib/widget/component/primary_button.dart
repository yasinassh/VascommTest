import 'package:flutter/material.dart';
import 'package:vascomm_test/widget/color_palette.dart';
import 'package:vascomm_test/widget/font_style.dart';

class PrimaryButton extends StatelessWidget {
  final String? label;
  final double height;
  final double? fontSize;
  final bool withArrow;
  final Function()? onTap;
  const PrimaryButton(
      {Key? key,
      this.label,
      this.onTap,
      this.height = 55,
      this.fontSize = 16,
      this.withArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 16.0,
        shadowColor: const Color(0xFFBEBEBE),
        color: Palette.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Flexible(
                flex: 1,
                child: Text(
                  label ?? '-',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                ),
              ),
              withArrow == false
                  ? Container()
                  : const Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
