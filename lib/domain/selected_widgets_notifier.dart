import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedWidgetsNotifier =
    StateNotifierProvider<SelectedWidgetsNotifier, SelectedElements>((ref) {
  return SelectedWidgetsNotifier(ref);
});

class SelectedElements {
  final GlobalKey? first;
  final GlobalKey? second;

  SelectedElements({
    this.first,
    this.second,
  });

  SelectedElements copyWith({
    GlobalKey? first,
    GlobalKey? second,
  }) =>
      SelectedElements(
        first: first ?? this.first,
        second: second ?? this.second,
      );
}

class SelectedWidgetsNotifier extends StateNotifier<SelectedElements> {
  final Ref _ref;
  SelectedWidgetsNotifier(this._ref) : super(SelectedElements());

  void selectWidget(GlobalKey widgetKey) {
    log('Selecting widget.');
    final isFirstAlreadySelected = state.first != null;
    if (isFirstAlreadySelected) {
      state = state.copyWith(second: widgetKey);
      return;
    }
    state = state.copyWith(first: widgetKey);
  }

  void reset() => state = SelectedElements();
}
