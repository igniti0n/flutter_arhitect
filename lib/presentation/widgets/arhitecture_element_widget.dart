import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecutre_element_state_provider.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_arhitect/positioned_draggable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArhitectureElementWidget extends HookConsumerWidget {
  final BaseArhitectureElement arhitectureElement;
  const ArhitectureElementWidget({super.key, required this.arhitectureElement});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        useTextEditingController(text: arhitectureElement.name);

    return PositionedDraggable(
      top: arhitectureElement.canvasPosition.dy,
      left: arhitectureElement.canvasPosition.dx,
      onChange: (newOffset) => ref
          .read(allArhitectureElementsNotifier.notifier)
          .updateArhitectureElementCanvasPosition(
            arhitectureElement.copyWith(
              canvasPosition: newOffset,
            ),
          ),
      child: GestureDetector(
        onTap: () => ref
            .read(selectedWidgetsNotifier.notifier)
            .selectWidget(arhitectureElement),
        child: MouseRegion(
          cursor: SystemMouseCursors.precise,
          child: Container(
            key: arhitectureElement.widgetsGlobalKey,
            // margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green[600],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1,
                  spreadRadius: 0.5,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MouseRegion(
                cursor: SystemMouseCursors
                    .click, // Change the cursor when entering the region
                child: GestureDetector(
                  onTap: () => ref
                      .read(currentlySelectedArhitectureElementStateProvider
                          .notifier)
                      .state = arhitectureElement,
                  child: Text(
                    arhitectureElement.name,
                  ),
                ),
              ),
              //  TextField(
              //   textAlign: TextAlign.center,
              //   decoration: const InputDecoration(
              //     focusColor: Colors.red,
              //     border: InputBorder.none,
              //     focusedBorder: OutlineInputBorder(),
              //   ),
              //   controller: textController,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
