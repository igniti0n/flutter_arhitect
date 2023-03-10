import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/manager_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/page_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/repository_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/riverpod/notifier_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/riverpod/provider_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/riverpod/state_provider_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/service_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/arhitecture_element_pairs_provider.dart';
import 'package:flutter_arhitect/domain/files_generation_notifier.dart';
import 'package:flutter_arhitect/presentation/painters/elements_connections_painter.dart';
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
        ],
      ),
    );
  }
}

class _DummyControls extends ConsumerWidget {
  const _DummyControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                ServiceArhitectureElement.empty(),
              ),
          child: const Text('Service'),
        ),
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                ManagerArhitectureElement.empty(),
              ),
          child: const Text('Manager'),
        ),
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                RepositoryArhitectureElement.empty(),
              ),
          child: const Text('Repository'),
        ),
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                ProviderArhitectureElement.empty(),
              ),
          child: const Text('Provider'),
        ),
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                StateProviderArhitectureElement.empty(),
              ),
          child: const Text('StateProvider'),
        ),
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                NotifiereArhitectureElement.empty(),
              ),
          child: const Text('Notifier'),
        ),
        TextButton(
          onPressed: () => ref
              .read(allArhitectureElementsNotifier.notifier)
              .addArhitectureElement(
                PageArhitectureElement.empty(),
              ),
          child: const Text('Page'),
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
