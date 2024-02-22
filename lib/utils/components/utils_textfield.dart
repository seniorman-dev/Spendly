import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';







class UtilsTextField extends StatefulWidget {
  const UtilsTextField({super.key,required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.textController, this.onFocusChanged,});
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;

  @override
  State<UtilsTextField> createState() => _UtilsTextFieldState();
}

class _UtilsTextFieldState extends State<UtilsTextField> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: SizedBox(
        height: 50.h,
        child: TextFormField(
          onChanged: widget.onChanged,
          controller: widget.textController,
          keyboardType: widget.keyboardType,
          maxLines: 10,
          minLines: 1,
          autocorrect: true,
          inputFormatters: const [],
          enableSuggestions: true,
          enableInteractiveSelection: true,
          cursorColor: AppColor.blackColor,
          //style: GoogleFonts.inter(color: AppColor.blackColor),
          style: GoogleFonts.inter(color: AppColor.blackColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
          textCapitalization: TextCapitalization.sentences,
          textInputAction: widget.textInputAction,          
          scrollPhysics: const BouncingScrollPhysics(),
          decoration: InputDecoration(        
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // Remove the border
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor), // Set the color you prefer
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor), // Set the color you prefer
            ),
            fillColor: AppColor.bgColor,     
            labelText: widget.hintText,
            //labelStyle: GoogleFonts.inter(color: AppColor.textGreyColor, fontSize: 16.sp),
            labelStyle: GoogleFonts.inter(color: AppColor.textGreyColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
          ),
        ),
      ),
    );
  }
}


//this one has initial value
class UtilsTextField2 extends StatefulWidget {
  const UtilsTextField2({super.key,required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.initialValue, this.onFocusChanged,});
  final String initialValue;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;

  @override
  State<UtilsTextField2> createState() => _UtilsTextField2State();
}

class _UtilsTextField2State extends State<UtilsTextField2> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
        keyboardType: widget.keyboardType,
        maxLines: 10,
        minLines: 1,
        autocorrect: true,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.blackColor,
        //style: GoogleFonts.inter(color: AppColor.blackColor),
        style: GoogleFonts.inter(color: AppColor.blackColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        decoration: InputDecoration(        
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Remove the border
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.textGreyColor), // Set the color you prefer
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.blackColor), // Set the color you prefer
          ),     
          hintText: widget.hintText,
          //labelStyle: GoogleFonts.inter(color: AppColor.textGreyColor, fontSize: 16.sp),
          hintStyle: GoogleFonts.inter(color: AppColor.textGreyColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
        ),
      ),
    );
  }
}