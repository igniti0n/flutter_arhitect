import 'package:flutter_arhitect/common/models/element_pair.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/extensions/global_key_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final arhitectureElementPairsProvider = Provider<List<ElementPair>>((ref) {
  final allArhitectureElements = ref.watch(allArhitectureElementsNotifier);
  List<ElementPair> pairs = [];

  /// Make a pair of (element -> dependncy) for each dependency of an element
  for (var element in allArhitectureElements) {
    for (var depedency in element.dependencies) {
      final first = WidgetScreenData(
        element.widgetsGlobalKey.getPosition(),
        element.widgetsGlobalKey.getSize(),
      );
      final second = WidgetScreenData(
        depedency.widgetsGlobalKey.getPosition(),
        depedency.widgetsGlobalKey.getSize(),
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
