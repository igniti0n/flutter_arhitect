import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecutre_element_state_provider.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formKeyProvider = Provider<GlobalKey<FormBuilderState>>((ref) {
  return GlobalKey<FormBuilderState>();
});

class PannelBody extends ConsumerWidget {
  const PannelBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPannelWidth = MediaQuery.of(context).size.width * 0.4;

    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: maxPannelWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(child: _Body()),
                SizedBox(width: 120),
                SizedBox(width: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = ref.read(
          currentlySelectedArhitectureElementStateProvider,
        ) ??
        BaseArhitectureElement.empty();
    final arhitectureElement =
        ref.watch(arhitectureElementProvider(initialValue.id));

    log('Initial value: $initialValue, architecture element: $arhitectureElement');

    final formKey = ref.watch(formKeyProvider);
    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CustomTextField.normal(
                name: ArchitectureElementForm.nameKey,
                text: 'Name',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                isRequired: true,
                // isRequiredValidatorErrorText: 'Name is required',
              ),
              const SizedBox(height: 16),
              const MethodsAndParametersFormWidget(),
              const SizedBox(height: 16),
              CustomTextField.multilineDescription(
                name: ArchitectureElementForm.descriptionKey,
                text: 'Description',
                textInputType: TextInputType.multiline,
                isRequired: false,
              ),
              const SizedBox(height: 16),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() == true) {
                    ref
                        .read(allArhitectureElementsNotifier.notifier)
                        .onFormSubmitted(
                          arhitectureElement: arhitectureElement,
                          formMap: formKey.currentState!.value,
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
