import 'package:flutter_arhitect/models/element_pair.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final elementsNotifier =
    StateNotifierProvider<ElementPairsNotifier, List<ElementPair>>((ref) {
  return ElementPairsNotifier();
});

class ElementPairsNotifier extends StateNotifier<List<ElementPair>> {
  ElementPairsNotifier() : super([]);

  void addPair(ElementPair pair) => state = [...state, pair];

  void removePair(ElementPair pair) => state = [...state]..removeWhere(
      (element) => element.id == pair.id,
    );

  void updatePair(ElementPair pair) => state = state
      .map(
        (oldPair) => oldPair.id == pair.id ? pair : oldPair,
      )
      .toList();
}
