import 'package:flutter_arhitect/common/models/element_pair.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/extensions/global_key_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final arhitectureElementPairsProvider = Provider<List<ElementPair>>((ref) {
  final allArhitectureElements = ref.watch(allArhitectureElementsNotifier);
  final List<ElementPair> pairs = [];

  /// Make a pair of (element -> dependency) for each dependency of an element
  for (final element in allArhitectureElements) {
    for (final dependency in element.dependencies) {
      final first = WidgetScreenData(
        element.widgetsGlobalKey.getPosition(),
        element.widgetsGlobalKey.getSize(),
        element,
      );
      final second = WidgetScreenData(
        dependency.widgetsGlobalKey.getPosition(),
        dependency.widgetsGlobalKey.getSize(),
        dependency,
      );
      final pair = ElementPair(second, first);
      pairs.add(pair);
    }
  }
  return pairs;
});

// final elementsNotifier =
//     StateNotifierProvider<ElementPairsNotifier, List<ElementPair>>((ref) {
//   return ElementPairsNotifier();
// });

// class ElementPairsNotifier extends StateNotifier<List<ElementPair>> {
//   ElementPairsNotifier() : super([]);

//   void addPair(ElementPair pair) => state = [...state, pair];

//   void removePair(ElementPair pair) => state = [...state]..removeWhere(
//       (element) => element.id == pair.id,
//     );

//   void updatePair(ElementPair pair) => state = state
//       .map(
//         (oldPair) => oldPair.id == pair.id ? pair : oldPair,
//       )
//       .toList();
// }
