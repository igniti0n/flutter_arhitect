import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentlySelectedArhitectureElementStateProvider =
    StateProvider<BaseArhitectureElement?>((ref) => null);

final currentMethodsAndParametersStateProvider =
    StateProvider<List<Tuple2<Widget, List<Widget>>>>((ref) => []);

final didChangeCurrentlySelectedArhitectureElementStateProvider =
    StateProvider<bool>((ref) => false);

final arhitectureElementProvider =
    Provider.family<BaseArhitectureElement, String>((ref, id) {
  final currentlySelectedArhitectureElement =
      ref.watch(currentlySelectedArhitectureElementStateProvider);
  final allArhitectureElements = ref.watch(allArhitectureElementsNotifier);

  return allArhitectureElements.firstWhere(
    (element) => element.id == (currentlySelectedArhitectureElement?.id ?? ''),
    orElse: () => BaseArhitectureElement.empty(),
  );
});
