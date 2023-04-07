import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form/method_form_row.dart';
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
        for (final tuple in methodsAndParameters) tuple.value1,
        const _AddMethodButton(),
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
                  MethodFormRow(methodKey: ValueKey(const Uuid().v4())),
                  [],
                ),
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
