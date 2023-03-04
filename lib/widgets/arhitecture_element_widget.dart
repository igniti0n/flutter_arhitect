import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_arhitect/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/positioned_draggable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArhitectureElementWidget extends ConsumerWidget {
  final BaseArhitectureElement arhitectureElement;
  const ArhitectureElementWidget({super.key, required this.arhitectureElement});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: Container(
          key: arhitectureElement.widgetsGlobalKey,
          margin: const EdgeInsets.all(40),
          height: 50,
          width: 100,
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(arhitectureElement.name),
        ),
      ),
    );
  }
}
