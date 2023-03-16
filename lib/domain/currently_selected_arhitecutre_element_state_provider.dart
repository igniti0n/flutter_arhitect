import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentlySelectedArhitectureElementStateProvider =
    StateProvider<BaseArhitectureElement?>((ref) => null);

final arhitectureElementProvider =
    Provider.family<BaseArhitectureElement, String>((ref, id) {
  final allArhitectureElements = ref.watch(allArhitectureElementsNotifier);

  return allArhitectureElements.firstWhere(
    (element) => element.id == id,
    orElse: () => BaseArhitectureElement.empty(),
  );
});
