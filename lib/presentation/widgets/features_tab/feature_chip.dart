import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeatureChip extends ConsumerWidget {
  final String name;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Function(WidgetRef ref)? onTap;

  const FeatureChip({
    super.key,
    required this.name,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  });

  factory FeatureChip.enabeld(
    String name,
  ) {
    return FeatureChip(
      name: name,
      textColor: AppColors.appTextSecondary,
      backgroundColor: AppColors.appBodyPrimaryBg,
      borderColor: AppColors.inputDisabledBorder,
      onTap: (ref) {
        ref.read(selectedFeatureTabProviderProvider.notifier).state = name;
      },
    );
  }

  factory FeatureChip.disabeld(
    String name,
  ) {
    return FeatureChip(
      name: name,
      textColor: AppColors.appTextTertiary,
      backgroundColor: AppColors.appBodySecondaryBg,
      borderColor: Colors.transparent,
      onTap: null,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFeature = ref.watch(selectedFeatureTabProviderProvider);
    final isSelected = name == selectedFeature;

    return GestureDetector(
      onTap: () => onTap?.call(ref),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: isSelected ? AppColors.brandPrimaryDefault : borderColor,
            width: 1.5,
          ),
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: isSelected ? AppColors.brandPrimaryDefault : textColor,
              ),
        ),
      ),
    );
  }
}
