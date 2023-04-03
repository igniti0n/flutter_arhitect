import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/parameter.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef AllArhitectureElements = List<BaseArhitectureElement>;

final allArhitectureElementsNotifier = StateNotifierProvider<
    AllArhitectureElementsNotifier, AllArhitectureElements>((ref) {
  return AllArhitectureElementsNotifier();
});

class AllArhitectureElementsNotifier
    extends StateNotifier<AllArhitectureElements> {
  AllArhitectureElementsNotifier() : super([]);

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

  void updateArhitectureElementName(String id, String name) {
    state = state
        .map(
          (element) =>
              element.id == id ? element.copyWith(name: name) : element,
        )
        .toList();
  }

  void addArhitectureElementMethod(String id) {
    state = state
        .map(
          (element) => element.id == id
              ? element.copyWith(
                  methods: [...element.methods, Method.defaultMethod()],
                )
              : element,
        )
        .toList();
  }

  void removeArhitectureElementMethod(
    String id,
    String methodId,
  ) {
    state = state
        .map(
          (element) => element.id == id
              ? element.copyWith(
                  methods: [...element.methods]..removeWhere(
                      (element) => element.id == methodId,
                    ),
                )
              : element,
        )
        .toList();
  }

  void updateArhitectureElementMethod(String id, Method method) {
    state = state
        .map(
          (element) => element.id == id
              ? element.copyWith(
                  methods: element.methods
                    ..removeWhere(
                      (element) => element.id == method.id,
                    )
                    ..add(method),
                )
              : element,
        )
        .toList();
  }

  void addArhitectureElementParameter(String id, Method method) {
    state = state
        .map(
          (element) => element.id == id
              ? element.copyWith(
                  methods: element.methods
                    ..removeWhere(
                      (element) => element.id == method.id,
                    )
                    ..add(method.copyWith(
                      parameters: [
                        ...method.parameters,
                        Parameter.defaultParameter(),
                      ],
                    )),
                )
              : element,
        )
        .toList();
  }

  void removeArhitectureElementParameter(
    String id,
    Method method,
    Parameter parameter,
  ) {
    state = state
        .map(
          (element) => element.id == id
              ? element.copyWith(
                  methods: element.methods
                    ..removeWhere(
                      (element) => element.id == method.id,
                    )
                    ..add(method.copyWith(
                      parameters: method.parameters
                        ..removeWhere(
                          (element) => element.id == parameter.id,
                        ),
                    )),
                )
              : element,
        )
        .toList();
  }

  void updateArhitectureElementParameter(
    String id,
    Method method,
    Parameter parameter,
  ) {
    state = state
        .map(
          (element) => element.id == id
              ? element.copyWith(
                  methods: element.methods
                    ..removeWhere(
                      (element) => element.id == method.id,
                    )
                    ..add(method.copyWith(
                      parameters: method.parameters
                        ..removeWhere(
                          (element) => element.id == parameter.id,
                        )
                        ..add(parameter),
                    )),
                )
              : element,
        )
        .toList();
  }

  void updateArhitectureElementDescription(String id, String description) {
    state = state
        .map(
          (element) => //element.id == id ? element //.copyWith(description: description):
              element,
        )
        .toList();
  }

  void reset() => state = [];
}
