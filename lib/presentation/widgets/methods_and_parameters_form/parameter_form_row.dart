import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/parameter.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ParameterFormRow extends ConsumerWidget {
  final ValueKey methodKey;
  final ValueKey parameterKey;
  final Parameter? parameter;

  const ParameterFormRow({
    required this.methodKey,
    required this.parameterKey,
    this.parameter,
  }) : super(key: parameterKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: IconButton(
              onPressed: () => removeParameter(ref),
              icon: const Icon(
                Icons.remove_circle_outline_rounded,
                color: AppColors.red,
              ),
            ),
          ),
          Expanded(
            child: CustomTextField.normal(
              name: ArchitectureElementForm.parameterTypeForKey(
                methodKey: methodKey.value,
                parameterKey: parameterKey.value,
              ),
              text: 'Type',
              initialValue: parameter?.type,
              isRequired: true,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: CustomTextField.normal(
              name: ArchitectureElementForm.parameterNameForKey(
                methodKey: methodKey.value,
                parameterKey: parameterKey.value,
              ),
              text: 'Parameter name',
              initialValue: parameter?.parameterName,
              isRequired: true,
            ),
          ),
        ],
      ),
    );
  }

  void removeParameter(WidgetRef ref) {
    ref.read(currentMethodsAndParametersStateProvider.notifier).update((state) {
      ArchitectureElementForm.removeParameterFromForm(
        methodKey: methodKey.value,
        parameterKey: parameterKey.value,
        ref: ref,
      );
      final list = [...state];
      final index =
          list.indexWhere((element) => element.value1.key == methodKey);
      list[index].value2.removeWhere((element) => element.key == parameterKey);
      return list;
    });
  }
}
