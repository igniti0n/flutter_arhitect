import 'package:flutter/material.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/common/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? icon;

  const AppButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    required this.text,
    this.icon,
  });

  factory AppButton.primary({
    Key? key,
    void Function()? onPressed,
    required String text,
    Widget? icon,
  }) {
    return AppButton(
      key: key,
      onPressed: onPressed,
      text: text,
      backgroundColor: AppColors.primary,
      textColor: AppColors.text1,
      icon: icon,
    );
  }

  factory AppButton.secondary({
    Key? key,
    void Function()? onPressed,
    required String text,
    Color? backgroundColor,
    Widget? icon,
  }) {
    return AppButton(
      key: key,
      onPressed: onPressed,
      text: text,
      backgroundColor: backgroundColor ?? AppColors.background2,
      textColor: AppColors.text5,
      icon: icon,
    );
  }

  factory AppButton.delete({
    Key? key,
    void Function()? onPressed,
    required String text,
    Widget? icon,
  }) {
    return AppButton(
      key: key,
      onPressed: onPressed,
      text: text,
      backgroundColor: AppColors.error,
      textColor: AppColors.white,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return backgroundColor?.withOpacity(0.8);
          } else if (states.contains(MaterialState.pressed)) {
            return backgroundColor?.withOpacity(0.3);
          } else {
            return backgroundColor;
          }
        }),

        //  MaterialStateProperty.all(backgroundColor),
        side: MaterialStateProperty.all(
          BorderSide(color: borderColor ?? Colors.transparent),
        ),
        textStyle: MaterialStateProperty.all(
          /* TextStyle(fontSize: 16, color: textColor), */
          AppTextStyles.button.copyWith(color: textColor),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(double.infinity, 44), // 48
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox.shrink(),
          if (icon != null) const SizedBox(width: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.1,
            ),
          ),
        ],
      ),
    );
  }
}
