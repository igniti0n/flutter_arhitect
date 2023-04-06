import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AllArhitectureElements = List<BaseArhitectureElement>;

final allArhitectureElementsNotifier = StateNotifierProvider<
    AllArhitectureElementsNotifier, AllArhitectureElements>(
  (ref) => AllArhitectureElementsNotifier(
    ref.watch(architectureElementMapperProvider),
  ),
);

class AllArhitectureElementsNotifier
    extends StateNotifier<AllArhitectureElements> {
  final ArchitectureElementMapper<BaseArhitectureElement>
      _architectureElementMapper;

  AllArhitectureElementsNotifier(this._architectureElementMapper) : super([]);

  void addArhitectureElementFromTemplate(Template template) {
    log('Adding arhitecture element from template: ${template.name}');
    final arhitectureElement = template.generateArhitectureElement();

    final randomNumber = math.Random().nextInt(100);
    arhitectureElement.copyWith(name: randomNumber.toString());

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
    state = state.map(
      (element) {
        if (element.id != arhitectureElement.id) {
          return element;
        }
        if (element.dependencies.contains(dependency)) {
          return element;
        }
        return element.copyWith(
          dependencies: [...element.dependencies, dependency],
        );
      },
    ).toList();
  }

  void removeDependencyFromArhitectureElement({
    required BaseArhitectureElement arhitectureElement,
    required BaseArhitectureElement dependency,
  }) {
    log('Removing dependency from arhitecture element: ${arhitectureElement.name} -> ${dependency.name}');
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? element.copyWith(
                  dependencies: element.dependencies
                    ..removeWhere(
                      (element) => element.id == dependency.id,
                    ),
                )
              : element,
        )
        .toList();
  }

  void updateArhitectureElementCanvasPosition(
    BaseArhitectureElement arhitectureElement,
  ) {
    log('Updating arhitecture element: ${arhitectureElement.name}');
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? arhitectureElement
              : element,
        )
        .toList();
  }

  void onFormSubmitted({
    required BaseArhitectureElement arhitectureElement,
    required Map<String, dynamic> formMap,
  }) {
    final updatedArchitectureElement =
        _architectureElementMapper(arhitectureElement, formMap);
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? updatedArchitectureElement
              : element,
        )
        .toList();
  }

  void reset() => state = [];
}
