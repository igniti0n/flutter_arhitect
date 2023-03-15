import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/all_templates_notifier.dart';
import 'package:flutter_arhitect/domain/arhitecture_element_pairs_provider.dart';
import 'package:flutter_arhitect/domain/files_generation_notifier.dart';
import 'package:flutter_arhitect/presentation/painters/elements_connections_painter.dart';
import 'package:flutter_arhitect/presentation/pannel/element_info_pannel.dart';
import 'package:flutter_arhitect/presentation/widgets/arhitecture_element_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectWidgets extends ConsumerStatefulWidget {
  const ConnectWidgets({super.key});

  @override
  ConsumerState createState() => _ConnectWidgetsState();
}

class _ConnectWidgetsState extends ConsumerState<ConnectWidgets> {
  @override
  Widget build(BuildContext context) {
    final pairs = ref.watch(arhitectureElementPairsProvider);

    log('Pairs $pairs');

    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          CustomPaint(
            painter: ElementsConnectionsPainter(
              pairs: pairs,
            ),
            child: const _Elements(),
          ),
          Column(
            children: const [
              SizedBox(
                height: 60,
              ),
              _DummyControls(),
            ],
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: ElementInfoPannel(),
          )
        ],
      ),
    );
  }
}

class _DummyControls extends ConsumerWidget {
  const _DummyControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTemplates = ref.watch(allTemplatesNotifier).maybeWhen(
          orElse: () => <Template>[],
          success: (result) => result,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...allTemplates.map(
          (template) => TextButton(
            onPressed: () => ref
                .read(allArhitectureElementsNotifier.notifier)
                .addArhitectureElementFromTemplate(template),
            child: Text(template.name),
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        TextButton(
          onPressed: () =>
              ref.read(filesGenerationNotifier.notifier).generate(),
          child: const Text('GENERATE'),
        ),
      ],
    );
  }
}

class _Elements extends ConsumerWidget {
  const _Elements();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allArhitectureElements = ref.watch(allArhitectureElementsNotifier);

    return Stack(
      children: allArhitectureElements
          .map(
            (arhitectureElement) => ArhitectureElementWidget(
                arhitectureElement: arhitectureElement),
          )
          .toList(),
    );
  }
}
