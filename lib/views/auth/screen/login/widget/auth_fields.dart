import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class AuthCustomTextField extends StatefulWidget {
  const AuthCustomTextField({super.key,required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.textController, this.onFocusChanged, required this.prefixIcon, this.validator,});
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;
  final String? Function(String?)? validator;
  final Icon prefixIcon;

  @override
  State<AuthCustomTextField> createState() => _AuthCustomTextFieldState();
}

class _AuthCustomTextFieldState extends State<AuthCustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        maxLines: 2,
        minLines: 1,
        autocorrect: true,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.blackColor,
        style: GoogleFonts.inter(color: AppColor.blackColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w), // Adjust padding as needed        
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor,),
            borderRadius: BorderRadius.circular(20.r),
            // Remove the border
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor,), // Set the color you prefer
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor,), // Set the color you prefer
            borderRadius: BorderRadius.circular(20.r),
          ),
          /*errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.redColor),
            borderRadius: BorderRadius.circular(15.r),
          ),
          errorStyle: GoogleFonts.inter(color: AppColor.redColor, fontSize: 14.sp, fontWeight: FontWeight.w400),*/
          filled: true,
          fillColor: AppColor.greyColor, //.withOpacity(0.9),         
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(color: AppColor.textGreyColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
          prefixIcon: widget.prefixIcon,
        ),
        validator: widget.validator,
      ),
    );
  }
}


//password textfiel
class AuthPasswordTextField extends StatefulWidget {
  AuthPasswordTextField({super.key,required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.textController, this.onFocusChanged, required this.isObscured, this.validator, required this.prefixIcon,});
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;
  final String? Function(String?)? validator;
  final Icon prefixIcon;
  bool isObscured;
  
  

  @override
  State<AuthPasswordTextField> createState() => _AuthPasswordTextFieldState();
}

class _AuthPasswordTextFieldState extends State<AuthPasswordTextField> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        obscureText: widget.isObscured,
        obscuringCharacter: '*',
        onChanged: widget.onChanged,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        //maxLines: 2,
        minLines: 1,
        autocorrect: true,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.blackColor,
        style: GoogleFonts.inter(color: AppColor.blackColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        decoration: InputDecoration(  
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w), // Adjust padding as needed              
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor,), // Remove the border
            borderRadius: BorderRadius.circular(20.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor,), // Set the color you prefer
            borderRadius: BorderRadius.circular(20.r),
          ),
          filled: true,
          fillColor: AppColor.greyColor, //.withOpacity(0.9),     
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(color: AppColor.textGreyColor, fontSize: 14.sp, fontWeight: FontWeight.w400),             
          prefixIcon: widget.prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor), // Set the color you prefer
            borderRadius: BorderRadius.circular(15.r),
          ),
          /*errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.redColor),
            borderRadius: BorderRadius.circular(15.r),
          ),
          errorStyle: GoogleFonts.inter(color: AppColor.redColor, fontSize: 14.sp, fontWeight: FontWeight.w400),*/
          
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                widget.isObscured = !widget.isObscured;
              });
              debugPrint("${widget.isObscured}");
            },
            child: widget.isObscured 
            ? Icon(Icons.visibility_off_rounded, color: AppColor.textGreyColor, size: 24.r,) 
            : Icon(Icons.visibility_rounded, color: AppColor.textGreyColor, size: 24.r,) 
          )
        ),
        validator: widget.validator,
      ),
    );
  }
}