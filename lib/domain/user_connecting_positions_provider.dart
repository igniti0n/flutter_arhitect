import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/mouse_position_state_provider.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_arhitect/extensions/global_key_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userConnectingPositionsProvider = Provider<ConnectingPositions>((ref) {
  final selectedWidgets = ref.watch(selectedWidgetsNotifier);
  final mouseOffset = ref.watch(mousePositionStateProvider);

  if (selectedWidgets.first == null) {
    return ConnectingPositions();
  }
  final widgetSize = selectedWidgets.first!.widgetsGlobalKey.getSize();
  final offsetFromTopLeftToCenter =
      Offset(widgetSize.width / 2, widgetSize.height / 2);
  final screenOffset = selectedWidgets.first!.widgetsGlobalKey.getPosition() +
      offsetFromTopLeftToCenter;
  return ConnectingPositions(first: screenOffset, second: mouseOffset);
});

// ignore: prefer-match-file-name
class ConnectingPositions {
  final Offset? first;
  final Offset? second;

  ConnectingPositions({this.first, this.second});
}
