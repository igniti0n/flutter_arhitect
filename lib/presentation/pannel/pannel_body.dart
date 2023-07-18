import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:flutter_arhitect/presentation/common/app_button.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form/methods_and_parameters_form_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          color: AppColors.background2,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: maxPannelWidth,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 32),
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
    );
    if (initialValue == null) {
      return const SizedBox();
    }
    final arhitectureElement =
        ref.watch(arhitectureElementProvider(initialValue.id));

    final formKey = ref.watch(formKeyProvider);
    return FormBuilder(
      key: formKey,
      onChanged: () => ref
          .read(didChangeCurrentlySelectedArhitectureElementStateProvider
              .notifier)
          .update((state) => true),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField.normal(
                      name: ArchitectureElementForm.nameKey,
                      text: 'Name',
                      initialValue: initialValue.name,
                      autoValidateMode: AutovalidateMode.disabled,
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        if (value.contains(' ')) {
                          return 'Name can\'t contain spaces';
                        }

                        return null;
                      },
                    ),
                  ),
                  if (arhitectureElement.hasOutputValue)
                    const SizedBox(
                      width: 16,
                    ),
                  if (arhitectureElement.hasOutputValue)
                    Expanded(
                      child: CustomTextField.normal(
                        name: ArchitectureElementForm.outputValueKey,
                        text: 'Output value',
                        initialValue: initialValue.outputValue,
                        autoValidateMode: AutovalidateMode.disabled,
                        isRequired: true,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              if (arhitectureElement.hasMethods)
                const MethodsAndParametersFormWidget(),
              const SizedBox(height: 16),
              CustomTextField.multilineDescription(
                name: ArchitectureElementForm.descriptionKey,
                text: 'Description',
                initialValue: initialValue.description,
                textInputType: TextInputType.multiline,
                isRequired: false,
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: AppButton.primary(
                  text: 'Save',
                  onPressed: () {
                    if (formKey.currentState?.saveAndValidate() == true) {
                      ref
                          .read(allArhitectureElementsNotifier.notifier)
                          .onFormSubmitted(
                            arhitectureElement: arhitectureElement,
                            formMap: formKey.currentState!.value,
                          );
                      Scaffold.of(context).closeEndDrawer();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
