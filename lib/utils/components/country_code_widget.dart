import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';





class CountryCodeWidget extends StatefulWidget {
  const CountryCodeWidget({super.key, required this.onCountryChanged});
  final void Function(CountryCode) onCountryChanged;

  @override
  State<CountryCodeWidget> createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: (val) {
        widget.onCountryChanged(val);
      }, //_onCountryChange,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'NG',
      favorite: const ['NG'],
      // optional. Shows only country name and flag
      //showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      //showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      //alignLeft: true,
      //showDropDownButton: true,
      //showFlag: true,
    );
  }
}