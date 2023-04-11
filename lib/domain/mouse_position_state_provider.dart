import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mousePositionStateProvider = StateProvider<Offset>((ref) {
  return Offset.zero;
});
