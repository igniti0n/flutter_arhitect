import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectingWidgetsNotifier =
    StateNotifierProvider<ConnectingWidgetsNotifier, WidgetsConnectionDetails>(
  (ref) {
    return ConnectingWidgetsNotifier();
  },
);

class ConnectingWidgetsNotifier
    extends StateNotifier<WidgetsConnectionDetails> {
  ConnectingWidgetsNotifier() : super(WidgetsConnectionDetails.empty());

  void updateFirstPointOffset({required Offset? firstPoint}) =>
      state = state.copyWith(firstPoint: firstPoint);

  void updateSecondPointOffset({required Offset? secondPoint}) {
// If not any point selected, ginore updating the second point for mouse movement & attachment

    if (state.firstPoint == null) {
      return;
    }
    state = state.copyWith(secondPoint: secondPoint);
  }

  void reset() => state = WidgetsConnectionDetails.empty();
}

class WidgetsConnectionDetails {
  final Offset? firstPoint;
  final Offset? secondPoint;

  WidgetsConnectionDetails({
    required this.firstPoint,
    required this.secondPoint,
  });

  factory WidgetsConnectionDetails.empty() =>
      WidgetsConnectionDetails(firstPoint: null, secondPoint: null);

  WidgetsConnectionDetails copyWith({
    Offset? firstPoint,
    Offset? secondPoint,
  }) =>
      WidgetsConnectionDetails(
        firstPoint: firstPoint ?? this.firstPoint,
        secondPoint: secondPoint ?? this.secondPoint,
      );
}
