import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/features_selection/features_notifier.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/common/app_text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveFeatureDialog extends ConsumerWidget {
  final String featureName;
  const RemoveFeatureDialog({
    super.key,
    required this.featureName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 2,
      backgroundColor: AppColors.background2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Remove feature $featureName?',
              style: AppTextStyles.medium.copyWith(
                color: AppColors.text5,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 200,
              ),
              child: Text(
                'All elements from the $featureName feature will be removed from the project.',
                style: AppTextStyles.base.copyWith(
                  color: AppColors.text4,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(featuresProvider.notifier)
                    .deleteFeature(featureName: featureName);
                ref.read(allArhitectureElementsNotifier.notifier).reset();
                final features = ref.read(featuresProvider);
                ref.read(selectedFeatureTabProviderProvider.notifier).state =
                    features.isNotEmpty ? features.first : '';
                Navigator.of(context).pop();
              },
              child: Text(
                'Remove feature',
                style: AppTextStyles.base.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
