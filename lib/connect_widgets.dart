import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/element_pair.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/all_templates_notifier.dart';
import 'package:flutter_arhitect/domain/arhitecture_element_pairs_provider.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/domain/files_generation_notifier.dart';
import 'package:flutter_arhitect/presentation/common/app_button.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/painters/elements_connections_painter.dart';
import 'package:flutter_arhitect/presentation/pannel/element_info_pannel.dart';
import 'package:flutter_arhitect/presentation/widgets/arhitecture_element_widget.dart';
import 'package:flutter_arhitect/presentation/widgets/features_tab/features_chips_horizontal_list.dart';
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
      backgroundColor: AppColors.background1,
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
      body: Column(
        children: [
          const _DummyControls(),
          Expanded(
            child: GestureDetector(
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
      final first = pair.first;
      final second = pair.second;
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

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            child: FeaturesChipsHorizontalList(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              AppButton.primary(
                text: 'GENERATE',
                onPressed: () =>
                    ref.read(filesGenerationNotifier.notifier).generate(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: allTemplates
                      .map(
                        (template) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: AppButton.secondary(
                            onPressed: () => ref
                                .read(allArhitectureElementsNotifier.notifier)
                                .addArhitectureElementFromTemplate(template),
                            text: template.name,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
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
