import 'package:flutter_arhitect/domain/currently_selected_arhitecutre_element_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isPannelOpenedProvider = StateProvider<bool>((ref) {
  final selectedElement =
      ref.watch(currentlySelectedArhitectureElementStateProvider);

  return selectedElement != null;
});
