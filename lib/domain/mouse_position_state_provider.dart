import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mousePositionStateProvider = StateProvider<Offset>((ref) {
  return Offset.zero;
});
