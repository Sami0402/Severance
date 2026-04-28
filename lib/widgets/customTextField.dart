import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:e_commerce_app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class customTextField extends StatelessWidget {
  customTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.isObsecure = false,
    this.suffixIcon,
    this.showSufixIcon = false,
    this.controller,
    this.svgPicture,
    this.borderColor,
    this.validator,
    this.errorText,
    this.hintStyle,
    this.prefixIconSize,
  });
  final String hintText;
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;
  final IconData? prefixIcon;
  final double? prefixIconSize;
  final String? svgPicture;
  final bool isObsecure;
  final bool showSufixIcon;
  final IconData? suffixIcon;
  final toggle = RxBool(false);
  Color? borderColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Obx(
      () => TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        obscureText: toggle.value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          errorText: errorText,
          errorStyle: TextStyle(fontFamily: AppTheme.POPPINS),
          hintStyle: hintStyle == null
              ? TypographyPoppins.Bold.copyWith(color: Colors.grey[600])
              : hintStyle!,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: borderColor == null
                  ? Colors.grey.shade700.withValues(alpha: 0.2)
                  : borderColor!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: prefixIconSize == null
                ? SizeConfig.screenHeight * 0.032
                : prefixIconSize!,
            color: Colors.grey,
          ),

          // prefixIcon: prefixIcon == null
          //     ? Container(
          //         height: 15,
          //         width: 15,
          //         alignment: Alignment.center,
          //         child: prefixIcon == null
          //             ? SizedBox()
          //             : SvgPicture.asset(
          //                 svgPicture!,
          //                 height: 20.0,
          //                 width: 15.0,
          //                 color: Colors.grey[600],
          //               ),
          //       )
          //     : Icon(prefixIcon, color: Colors.grey),
          suffixIcon: showSufixIcon
              ? (suffixIcon != null
                    ? IconButton(
                        onPressed: () {
                          toggle.value = !toggle.value;
                        },
                        icon: toggle.value
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                      )
                    : IconButton(onPressed: () {}, icon: Icon(suffixIcon)))
              : null,

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor == null ? Appcolor.BLACK : borderColor!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor == null ? Appcolor.BLACK : borderColor!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor == null ? Appcolor.BLACK : borderColor!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
