import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PannelPully extends ConsumerWidget {
  const PannelPully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(currentlySelectedArhitectureElementStateProvider.notifier)
            .state = null;
        Scaffold.of(context).closeEndDrawer();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          backgroundBlendMode: BlendMode.src,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        height: 58,
        width: 64,
        child: const Icon(
          Icons.close_rounded,
          size: 68,
        ),
      ),
    );
  }
}
