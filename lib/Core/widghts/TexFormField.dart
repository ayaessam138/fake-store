
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uitraning/Core/Appcolors.dart';

class TextformFieldWidght extends StatelessWidget {
  TextformFieldWidght(
      {super.key,
      this.HintText,
      // required this.icon,
      required this.controller,
      required this.onSaved,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1});
  final String? HintText;
  // final Widget icon;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      // textDirection: SharedPreferenceValue.GetLocal()=='en'?TextDirection.ltr:TextDirection.rtl ,
      // onTap:  () => focusNode?.unfocus(),
      onEditingComplete: () => focusNode?.unfocus(),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
          isDense: true,
          filled: true,

          fillColor: AppColors.lightGrey,
          hintText: HintText ?? '',
          // prefixIcon: icon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3C8DBC))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB7B7B7))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFBF9F4))
              //
              )),
    );
  }
}

class TextformFieldWidghtWithSuffixicon extends StatelessWidget {
  TextformFieldWidghtWithSuffixicon(
      {super.key,
        this.HintText,
        // required this.icon,
        required this.controller,
        required this.onSaved,
        this.validator,
        this.focusNode,
        this.keyboardType,
        this.suffix,
        this.prefix,
        this.maxLines = 1});
  final String? HintText;
  // final Widget icon;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textDirection: SharedPreferenceValue.GetLocal()=='en'?TextDirection.ltr:TextDirection.rtl ,
      // onTap:  () => focusNode?.unfocus(),
      onEditingComplete: () => focusNode?.unfocus(),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
         suffixIcon:suffix??SizedBox() ,
         prefixIcon:prefix??SizedBox() ,
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
          isDense: true,
          filled: true,

          fillColor: AppColors.lightGrey,
          hintText: HintText ?? '',
          // prefixIcon: icon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3C8DBC))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB7B7B7))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFBF9F4))
            //
          )),
    );
  }
}
class TextformFieldWidghtwithCounter extends StatelessWidget {
  TextformFieldWidghtwithCounter(
      {Key? key,
      this.HintText,
      required this.controller,
      required this.onSaved,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1,
      required this.onPressedIncrement,
      required this.onPressedDecrement})
      : super(key: key);

  final String? HintText;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final void Function()? onPressedIncrement;
  final void Function()? onPressedDecrement;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: HintText ?? '',
        suffixIcon: Column(
          children: [
            GestureDetector(
                onTap: onPressedIncrement,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container( color: Color(0xffE9E9ED),
                      // decoration: ShapeDecoration(
                      //     color: Colors.red,
                      //     shape: CircleBorder(),),
                      child: const Icon(Icons.arrow_drop_up,)),
                )),
            GestureDetector(
                onTap: onPressedDecrement,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(color: Color(0xffE9E9ED),child: const Icon(Icons.arrow_drop_down)),
                )),

            // IconButton(
            //     icon:
            //     onPressed:onPressedIncrement
            // ),
            // IconButton(
            //   icon:
            //   onPressed: () {
            //
            //   },
            // ),
          ],
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3C8DBC)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB7B7B7)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFBF9F4)),
        ),
      ),
    );
  }
}
