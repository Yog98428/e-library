// import 'package:academy/constants.dart';
import 'package:e_library/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final Color color;
  final TextEditingController controller;
  final String initialValue;
  final bool readOnly;
  final TextAlign textAlign;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final String label;
  final int maxLines;
  final Function onTap;
  final IconData suffix;
  final bool password;

  EntryField({
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.onTap,
    this.suffix,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) SizedBox(height: 20),
        if (label != null)
          Text(
            label,
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                color: kTextColorDark,
                letterSpacing: .5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    color: kTextColorDark,
                    letterSpacing: .25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                controller: controller,
                obscureText: password ?? false,
                initialValue: initialValue,
                readOnly: readOnly ?? false,
                maxLines: maxLines ?? 1,
                minLines: 1,
                textAlign: textAlign ?? TextAlign.left,
                keyboardType: textInputType,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(prefixIcon, color: Theme.of(context).primaryColor),
                  suffixIcon: Icon(suffixIcon),
                  hintText: hint,
                  filled: true,
                  fillColor: color ?? Theme.of(context).backgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                ),
                onTap: onTap,
              ),
            ),
            if (suffix != null)
              GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 8),
                  padding: EdgeInsets.symmetric(vertical: 13.2),
                  width: 56,
                  decoration: BoxDecoration(
                    color: kSecondaryExtraLight.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    suffix,
                    color: kPrimaryLight,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class EntryFieldUC extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final Color color;
  final TextEditingController controller;
  final String initialValue;
  final bool readOnly;
  final TextAlign textAlign;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final String label;
  final int maxLines;
  final Function onTap;
  final IconData suffix;
  final bool password;

  EntryFieldUC({
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.onTap,
    this.suffix,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) SizedBox(height: 20),
        if (label != null)
          Text(
            label,
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                color: kTextColorDark,
                letterSpacing: .5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(
                      color: kTextColorDark,
                      letterSpacing: .25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  controller: controller,
                  obscureText: password ?? false,
                  initialValue: initialValue,
                  readOnly: readOnly ?? false,
                  maxLines: maxLines ?? 1,
                  minLines: 1,
                  textAlign: textAlign ?? TextAlign.left,
                  cursorColor: Colors.black,
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(prefixIcon, color: Theme.of(context).primaryColor),
                    suffixIcon: Icon(suffixIcon),
                    hintText: hint,
                    filled: false,
                    // fillColor: color ?? Theme.of(context).backgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                  ),
                  onTap: onTap,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ]),
            ),
            if (suffix != null)
              GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 8),
                  padding: EdgeInsets.symmetric(vertical: 13.2),
                  width: 56,
                  decoration: BoxDecoration(
                    color: kSecondaryExtraLight.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    suffix,
                    color: kPrimaryLight,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
