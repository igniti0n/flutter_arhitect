import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/presentation/common/app_button.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/common/app_text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PannelPully extends ConsumerWidget {
  const PannelPully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        bool? confirmed = true;
        if (ref
            .read(didChangeCurrentlySelectedArhitectureElementStateProvider)) {
          confirmed = await showConfirmDialog(context);
        }
        if (confirmed == true) {
          Scaffold.of(context).closeEndDrawer();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background2,
          backgroundBlendMode: BlendMode.src,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        height: 58,
        width: 64,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.close_rounded,
            color: AppColors.icon4,
            size: 48,
          ),
        ),
      ),
    );
  }

  Future<bool?> showConfirmDialog(BuildContext context) => showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.background4,
          title: Text(
            'Discard changes?',
            style: AppTextStyles.medium,
          ),
          content: Text(
            'Are you sure you want to exit drawer before saving?',
            style: AppTextStyles.base.copyWith(
              color: AppColors.text4,
            ),
          ),
          actions: [
            IntrinsicWidth(
              child: AppButton.secondary(
                onPressed: () => Navigator.of(context).pop(false),
                text: 'No',
              ),
            ),
            IntrinsicWidth(
              child: AppButton.primary(
                onPressed: () => Navigator.of(context).pop(true),
                text: 'Yes',
              ),
            ),
          ],
        ),
      );
}
