import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scaleUpdateDetailsStateProvider =
    StateProvider<ScaleUpdateDetails>((ref) {
  return ScaleUpdateDetails();
});
