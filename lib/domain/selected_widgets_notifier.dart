import 'dart:developer';

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedWidgetsNotifier =
    StateNotifierProvider<SelectedWidgetsNotifier, SelectedElements>((ref) {
  return SelectedWidgetsNotifier(ref);
});

class SelectedWidgetsNotifier extends StateNotifier<SelectedElements> {
  final Ref _ref;
  SelectedWidgetsNotifier(this._ref) : super(SelectedElements());

  void selectWidget(BaseArhitectureElement arhitectureElement) {
    log('Selecting widget ${arhitectureElement.name}');
    final isFirstAlreadySelected = state.first != null;
    if (isFirstAlreadySelected) {
      state = state.copyWith(second: arhitectureElement);

      _ref
          .read(allArhitectureElementsNotifier.notifier)
          .addDependencyToArhitectureElement(
            arhitectureElement: state.second!,
            dependency: state.first!,
          );
      reset();
      return;
    }
    state = state.copyWith(first: arhitectureElement);
    log('State $state');
  }

  void reset() => state = SelectedElements();
}

class SelectedElements {
  final BaseArhitectureElement? first;
  final BaseArhitectureElement? second;

  SelectedElements({
    this.first,
    this.second,
  });

  SelectedElements copyWith({
    BaseArhitectureElement? first,
    BaseArhitectureElement? second,
  }) =>
      SelectedElements(
        first: first ?? this.first,
        second: second ?? this.second,
      );
}
