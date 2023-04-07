import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form/parameter_form_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MethodFormRow extends ConsumerWidget {
  final ValueKey methodKey;
  final Method? method;

  const MethodFormRow({required this.methodKey, this.method})
      : super(key: methodKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: IconButton(
                onPressed: () => removeMethod(ref),
                icon: const Icon(
                  Icons.remove_circle_outline_rounded,
                ),
              ),
            ),
            Expanded(
              child: CustomTextField.normal(
                name: ArchitectureElementForm.methodReturnValueForKey(
                  methodKey: methodKey.value,
                ),
                text: 'Return value',
                initialValue: method?.returnValue,
                isRequired: true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: CustomTextField.normal(
                name: ArchitectureElementForm.methodNameForKey(
                  methodKey: methodKey.value,
                ),
                text: 'Method name',
                initialValue: method?.methodName,
                isRequired: true,
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: const Icon(Icons.arrow_drop_down),
          title: const Text(
            'Parameters',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          children: [
            ParameterFormWidget(methodKey: methodKey),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void removeMethod(WidgetRef ref) {
    ArchitectureElementForm.removeMethodFromForm(
      methodKey: methodKey.value,
      ref: ref,
    );
    ref
        .read(currentMethodsAndParametersStateProvider.notifier)
        .update((state) => [...state]..removeWhere(
            (element) {
              if (element.value1.key == methodKey) {
                for (final parameterWidget in element.value2) {
                  final String? key = (parameterWidget.key as ValueKey).value;
                  if (key != null) {
                    ArchitectureElementForm.removeParameterFromForm(
                      methodKey: methodKey.value,
                      parameterKey: key,
                      ref: ref,
                    );
                  }
                }
                return true;
              }
              return false;
            },
          ));
  }
}
