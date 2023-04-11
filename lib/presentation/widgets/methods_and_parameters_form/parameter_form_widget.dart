import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form/parameter_form_row.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class ParameterFormWidget extends ConsumerWidget {
  final ValueKey methodKey;

  const ParameterFormWidget({
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
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: _AddParameterButton(methodKey: methodKey),
        ),
      ],
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
        list[index].value2.add(ParameterFormRow(
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
