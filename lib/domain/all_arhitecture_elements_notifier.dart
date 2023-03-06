import 'dart:developer';

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef AllArhitectureElements = List<BaseArhitectureElement>;

final allArhitectureElementsNotifier = StateNotifierProvider<
    AllArhitectureElementsNotifier, AllArhitectureElements>((ref) {
  return AllArhitectureElementsNotifier();
});

class AllArhitectureElementsNotifier
    extends StateNotifier<AllArhitectureElements> {
  AllArhitectureElementsNotifier() : super([]);

  void addArhitectureElement(BaseArhitectureElement arhitectureElement) {
    log('Adding arhitecture element: ${arhitectureElement.name}');
    state = [...state, arhitectureElement];
  }

  void removeArhitectureElement(BaseArhitectureElement arhitectureElement) {
    log('Removing arhitecture element: ${arhitectureElement.name}');

    state = [...state]..removeWhere(
        (element) => element.id == arhitectureElement.id,
      );
  }

  void addDependencyToArhitectureElement({
    required BaseArhitectureElement arhitectureElement,
    required BaseArhitectureElement dependency,
  }) {
    log('Updating dependency to arhitecture element: ${arhitectureElement.name} -> ${dependency.name}');
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? element
                  .copyWith(dependencies: [...element.dependencies, dependency])
              : element,
        )
        .toList();
  }

  void updateArhitectureElementCanvasPosition(
      BaseArhitectureElement arhitectureElement) {
    log('Updating arhitecture element: ${arhitectureElement.name}');
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? arhitectureElement
              : element,
        )
        .toList();
  }

  void reset() => state = [];
}
