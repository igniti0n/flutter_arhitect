import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecutre_element_state_provider.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                // Expanded(child: _Body()),
                // AnimationTimeDelaySlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body();

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

/// Tittle
/// dependencies
/// methods + parameters
/// description

class _BodyState extends ConsumerState<_Body> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final initialValue = ref.read(
          currentlySelectedArhitectureElementStateProvider,
        ) ??
        BaseArhitectureElement.empty();
    final arhitectureElement =
        ref.watch(arhitectureElementProvider(initialValue.id));

    log('Initial value: $initialValue, architecture element: $arhitectureElement');

    return FormBuilder(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CustomTextField.normal(
                name: 'name',
                text: 'Name',
                onChanged: (newText) {
                  ref
                      .read(allArhitectureElementsNotifier.notifier)
                      .updateArhitectureElementName(
                        arhitectureElement.id,
                        newText ?? '',
                      );
                },
                // textEditingController: TextEditingController(
                //   text: initialValue.name,
                // ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                isRequired: true,

                // isRequiredValidatorErrorText: 'Name is required',
              ),
              const SizedBox(height: 16),
              const MethodsAndParametersFormWidget(),
              const SizedBox(height: 16),
              CustomTextField.multilineDescription(
                name: 'description',
                text: 'Description',
                textInputType: TextInputType.multiline,
                isRequired: false,

                // isRequiredValidatorErrorText: 'Name is required',
              ),
              const SizedBox(height: 16),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() == true) {
                    log('form: ${_formKey.currentState?.value}, fields: ${_formKey.currentState?.fields}');
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
