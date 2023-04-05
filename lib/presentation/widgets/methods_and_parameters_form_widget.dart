import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecutre_element_state_provider.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class MethodsAndParametersFormWidget extends ConsumerWidget {
  const MethodsAndParametersFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final methodsAndParameters =
        ref.watch(currentMethodsAndParametersStateProvider);
    return Column(
      children: [
        for (var tuple in methodsAndParameters) tuple.value1,
        const _AddMethodButton(),
      ],
    );
  }
}

class _MethodFormRow extends ConsumerWidget {
  final ValueKey methodKey;
  const _MethodFormRow({required this.methodKey}) : super(key: methodKey);

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
                onPressed: () => ref
                    .read(currentMethodsAndParametersStateProvider.notifier)
                    .update((state) => [...state]..removeWhere(
                        (element) => element.value1.key == methodKey,
                      )),
                icon: const Icon(
                  Icons.remove_circle_outline_rounded,
                ),
              ),
            ),
            Expanded(
              child: CustomTextField.normal(
                name: 'method_return-value_${methodKey.value}',
                text: 'Return value',
                isRequired: true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: CustomTextField.normal(
                name: 'method_name_${methodKey.value}',
                text: 'Method name',
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
            _ParameterFormWidget(methodKey: methodKey),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _AddMethodButton extends ConsumerWidget {
  const _AddMethodButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => ref
          .read(currentMethodsAndParametersStateProvider.notifier)
          .update((state) => [
                ...state,
                Tuple2(
                    _MethodFormRow(methodKey: ValueKey(const Uuid().v4())), []),
              ]),
      child: Row(
        children: const [
          Icon(
            Icons.add_circle_outline_rounded,
          ),
          SizedBox(width: 8),
          Text('Add new method'),
        ],
      ),
    );
  }
}

class _ParameterFormWidget extends ConsumerWidget {
  final ValueKey methodKey;

  const _ParameterFormWidget({
    Key? key,
    required this.methodKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parametersAndWidgets =
        ref.watch(currentMethodsAndParametersStateProvider);
    final tuple = parametersAndWidgets
        .firstWhere((element) => element.value1.key == methodKey);
    return Column(
      children: [
        for (var parameterWidget in tuple.value2) parameterWidget,
        _AddParameterButton(methodKey: methodKey),
      ],
    );
  }
}

class _ParameterFormRow extends ConsumerWidget {
  final ValueKey methodKey;
  final ValueKey parameterKey;
  const _ParameterFormRow({
    required this.methodKey,
    required this.parameterKey,
  }) : super(key: parameterKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: IconButton(
              onPressed: () => ref
                  .read(currentMethodsAndParametersStateProvider.notifier)
                  .update((state) {
                final list = [...state];
                final index = list
                    .indexWhere((element) => element.value1.key == methodKey);
                list[index]
                    .value2
                    .removeWhere((element) => element.key == parameterKey);
                return list;
              }),
              icon: const Icon(
                Icons.remove_circle_outline_rounded,
              ),
            ),
          ),
          Expanded(
            child: CustomTextField.normal(
              name: 'parameter_type_${methodKey.value}_${parameterKey.value}',
              text: 'Type',
              isRequired: true,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: CustomTextField.normal(
              name: 'parameter_name_${methodKey.value}_${parameterKey.value}',
              text: 'Parameter name',
              isRequired: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddParameterButton extends ConsumerWidget {
  final ValueKey methodKey;

  const _AddParameterButton({
    required this.methodKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => ref
          .read(currentMethodsAndParametersStateProvider.notifier)
          .update((state) {
        final list = [...state];
        final index =
            list.indexWhere((element) => element.value1.key == methodKey);
        list[index].value2.add(_ParameterFormRow(
              methodKey: methodKey,
              parameterKey: ValueKey(
                const Uuid().v4(),
              ),
            ));
        return list;
      }),
      child: Row(
        children: const [
          Icon(
            Icons.add_circle_outline_rounded,
          ),
          SizedBox(width: 8),
          Text('Add new parameter'),
        ],
      ),
    );
  }
}
