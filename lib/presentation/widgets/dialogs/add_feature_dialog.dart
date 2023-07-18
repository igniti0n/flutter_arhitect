import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/features_selection/features_notifier.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/presentation/common/app_button.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/common/app_text_styles.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formAddFeatureKeyProvider = Provider<GlobalKey<FormBuilderState>>((ref) {
  return GlobalKey<FormBuilderState>();
});

class AddFeatureDialog extends ConsumerWidget {
  const AddFeatureDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formAddFeatureKeyProvider);

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 2,
      backgroundColor: AppColors.background3,
      child: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'What\'s your feature name?',
                style: AppTextStyles.medium.copyWith(
                  color: AppColors.text5,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 28,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: CustomTextField.normal(
                  name: 'featureName',
                  isRequired: true,
                  hint: 'Feature name',
                  style: AppTextStyles.base.copyWith(
                    color: AppColors.text4,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              IntrinsicWidth(
                child: AppButton.primary(
                  text: 'Add feature',
                  onPressed: () {
                    if (formKey.currentState?.saveAndValidate() == true) {
                      final featureName =
                          formKey.currentState?.value['featureName'] as String;
                      ref.read(featuresProvider.notifier).addFeature(
                            featureName: featureName,
                          );
                      ref
                          .read(selectedFeatureTabProviderProvider.notifier)
                          .state = featureName;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
