import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/parameter.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecutre_element_state_provider.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
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

    log('Initial value: $initialValue');

    return FormBuilder(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CustomTextField.normal(
                name: '', //AuthForm.emailKey,
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
              const SizedBox(height: 8),
              TextButton(
                child: const Text('Add dependency'),
                onPressed: () {
                  // ref.read(authNotifierProvider.notifier).submitLoginForm(
                  //       formMap: _formKey.currentState!.value,
                  //     );
                },
              ),
              const _AddMethodFormRow(),
              for (var method in arhitectureElement.methods)
                _MethodFormRow(method),
              const SizedBox(height: 16),
              CustomTextField.multilineDescription(
                name: '', //AuthForm.emailKey,
                text: 'Descirption',
                textInputType: TextInputType.multiline,
                isRequired: false,

                // isRequiredValidatorErrorText: 'Name is required',
              ),
              const SizedBox(height: 16),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  _formKey.currentState?.saveAndValidate();
                  if (_formKey.currentState?.isValid == true) {
                    // ref.read(authNotifierProvider.notifier).submitLoginForm(
                    //       formMap: _formKey.currentState!.value,
                    //     );
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

class _MethodFormRow extends ConsumerWidget {
  final Method method;
  const _MethodFormRow(this.method);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => ref
                  .read(allArhitectureElementsNotifier.notifier)
                  .removeArhitectureElementMethod(
                    ref
                            .read(
                                currentlySelectedArhitectureElementStateProvider)
                            ?.id ??
                        '',
                    method.id,
                  ),
              icon: const Icon(
                Icons.remove_circle_outline_rounded,
              ),
            ),
            Expanded(
              child: CustomTextField.normal(
                name: '', //AuthForm.passwordKey,
                text: 'Return value',
                isRequired: true,
                onChanged: (newValue) {
                  ref
                      .read(allArhitectureElementsNotifier.notifier)
                      .updateArhitectureElementMethod(
                        ref
                                .read(
                                    currentlySelectedArhitectureElementStateProvider)
                                ?.id ??
                            '',
                        method.copyWith(type: newValue ?? ''),
                      );
                },
                // textEditingController:
                //     TextEditingController(text: method.returnValue),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: CustomTextField.normal(
                name: '', //AuthForm.passwordKey,
                text: 'Method name',
                isRequired: true,
                onChanged: (newValue) {
                  ref
                      .read(allArhitectureElementsNotifier.notifier)
                      .updateArhitectureElementMethod(
                        ref
                                .read(
                                    currentlySelectedArhitectureElementStateProvider)
                                ?.id ??
                            '',
                        method.copyWith(methodName: newValue ?? ''),
                      );
                },
                // textEditingController:
                //     TextEditingController(text: method.methodName),
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
            _ParameterFormRow(
              method: method,
              parameter: Parameter.defaultParameter(),
            ),
            _ParameterFormRow(
              method: method,
              parameter: Parameter.defaultParameter(),
            ),
            _ParameterFormRow(
              method: method,
              parameter: Parameter.defaultParameter(),
            ),
            _ParameterFormRow(
              method: method,
              parameter: Parameter.defaultParameter(),
            ),
          ],
        ),
      ],
    );
  }
}

class _AddMethodFormRow extends ConsumerWidget {
  const _AddMethodFormRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => ref
                  .read(allArhitectureElementsNotifier.notifier)
                  .addArhitectureElementMethod(ref
                          .read(
                              currentlySelectedArhitectureElementStateProvider)
                          ?.id ??
                      ''),
              icon: const Icon(
                Icons.add_circle_outline_rounded,
              ),
            ),
            Expanded(
              child: CustomTextField.normal(
                name: '', //AuthForm.passwordKey,
                isRequired: false,
                textInputType: TextInputType.none,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: CustomTextField.normal(
                name: '', //AuthForm.passwordKey,
                isRequired: false,
                textInputType: TextInputType.none,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ParameterFormRow extends ConsumerWidget {
  final Method method;
  final Parameter parameter;
  const _ParameterFormRow({
    Key? key,
    required this.method,
    required this.parameter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 60,
        ),
        Expanded(
          child: CustomTextField.normal(
            name: '', //AuthForm.passwordKey,
            text: 'Type',
            isRequired: true,
            onChanged: (newValue) {
              ref
                  .read(allArhitectureElementsNotifier.notifier)
                  .updateArhitectureElementParameter(
                    ref
                            .read(
                                currentlySelectedArhitectureElementStateProvider)
                            ?.id ??
                        '',
                    method,
                    parameter.copyWith(type: newValue ?? ''),
                  );
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: CustomTextField.normal(
            name: '', //AuthForm.passwordKey,
            text: 'Parameter name',
            isRequired: true,
            onChanged: (newValue) {
              ref
                  .read(allArhitectureElementsNotifier.notifier)
                  .updateArhitectureElementParameter(
                    ref
                            .read(
                                currentlySelectedArhitectureElementStateProvider)
                            ?.id ??
                        '',
                    method,
                    parameter.copyWith(parameterName: newValue ?? ''),
                  );
            },
          ),
        ),
      ],
    );
  }
}
