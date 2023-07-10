import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_arhitect/positioned_draggable.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/common/app_text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArhitectureElementWidget extends ConsumerStatefulWidget {
  final BaseArhitectureElement arhitectureElement;
  const ArhitectureElementWidget({super.key, required this.arhitectureElement});

  @override
  ConsumerState<ArhitectureElementWidget> createState() =>
      _ArhitectureElementWidgetState();
}

class _ArhitectureElementWidgetState
    extends ConsumerState<ArhitectureElementWidget> {
  @override
  Widget build(BuildContext context) {
    return PositionedDraggable(
      key: widget.arhitectureElement.positionedDraggableKey,
      top: widget.arhitectureElement.canvasPosition.dy,
      left: widget.arhitectureElement.canvasPosition.dx,
      onChange: (newOffset) {
        ref
            .read(allArhitectureElementsNotifier.notifier)
            .updateArhitectureElementCanvasPosition(
              widget.arhitectureElement.copyWith(
                canvasPosition: newOffset - const Offset(0, 165),
                size: widget.arhitectureElement.size,
              ),
            );
      },
      child: GestureDetector(
        key: widget.arhitectureElement.widgetsGlobalKey,
        onTap: () => ref
            .read(selectedWidgetsNotifier.notifier)
            .selectWidget(widget.arhitectureElement),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 26),
              child: MouseRegion(
                cursor: SystemMouseCursors.precise,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.arhitectureElement.layer.color,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MouseRegion(
                      cursor: SystemMouseCursors
                          .click, // Change the cursor when entering the region
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(
                                currentlySelectedArhitectureElementStateProvider
                                    .notifier,
                              )
                              .state = widget.arhitectureElement;
                          ref
                              .read(currentMethodsAndParametersStateProvider
                                  .notifier)
                              .update((state) => widget.arhitectureElement
                                  .methodsAndParametersWidgetList);
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Text(
                          widget.arhitectureElement.name,
                          style: AppTextStyles.small.copyWith(
                              color: AppColors.background1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => ref
                  .read(allArhitectureElementsNotifier.notifier)
                  .removeArhitectureElement(widget.arhitectureElement),
              child: Container(
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
