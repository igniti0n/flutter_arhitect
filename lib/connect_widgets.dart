import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/element_pair.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/all_templates_notifier.dart';
import 'package:flutter_arhitect/domain/arhitecture_element_pairs_provider.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/domain/files_generation_notifier.dart';
import 'package:flutter_arhitect/presentation/painters/elements_connections_painter.dart';
import 'package:flutter_arhitect/presentation/pannel/element_info_pannel.dart';
import 'package:flutter_arhitect/presentation/widgets/arhitecture_element_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectWidgets extends ConsumerStatefulWidget {
  const ConnectWidgets({super.key});

  @override
  ConsumerState createState() => _ConnectWidgetsState();
}

class _ConnectWidgetsState extends ConsumerState<ConnectWidgets> {
  @override
  Widget build(BuildContext context) {
    final pairs = ref.watch(arhitectureElementPairsProvider);

    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      endDrawer: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [ElementInfoPannel()],
        ),
      ),
      onEndDrawerChanged: (isOpened) {
        if (!isOpened) {
          ref.invalidate(currentlySelectedArhitectureElementStateProvider);
          ref.invalidate(currentMethodsAndParametersStateProvider);
          ref.invalidate(
            didChangeCurrentlySelectedArhitectureElementStateProvider,
          );
        }
      },
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          GestureDetector(
            onTapDown: (details) {
              checkIfRemoveConnectionButtonIsTapped(details, pairs);
            },
            child: CustomPaint(
              painter: ElementsConnectionsPainter(
                pairs: pairs,
              ),
              child: const _Elements(),
            ),
          ),
          Column(
            children: const [
              SizedBox(height: 60),
              _DummyControls(),
            ],
          ),
        ],
      ),
    );
  }

  void checkIfRemoveConnectionButtonIsTapped(
    TapDownDetails details,
    List<ElementPair> pairs,
  ) {
    for (final pair in pairs) {
      var first = pair.first;
      var second = pair.second;
      if (second.position.dy < first.position.dy) {
        final temp = first;
        first = second;
        second = temp;
      }
      final midpoint = Offset(
        (first.position.dx +
                first.size.width / 2 +
                second.position.dx +
                second.size.width / 2) /
            2,
        (first.position.dy +
                (first.size.height / 2) +
                second.position.dy +
                (second.size.height / 2)) /
            2,
      );
      final tapPosition = (context.findRenderObject() as RenderBox)
          .globalToLocal(details.globalPosition);
      if ((tapPosition - midpoint).distance <= 10) {
        ref
            .read(allArhitectureElementsNotifier.notifier)
            .removeDependencyFromArhitectureElement(
              arhitectureElement: second.element,
              dependency: first.element,
            );
        break;
      }
    }
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
        const SizedBox(width: 100),
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
              arhitectureElement: arhitectureElement,
            ),
          )
          .toList(),
    );
  }
}
