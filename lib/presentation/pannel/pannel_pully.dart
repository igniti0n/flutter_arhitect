import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/currently_selected_arhitecture_element_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PannelPully extends ConsumerWidget {
  const PannelPully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        bool? confirmed = true;
        if (ref
            .read(didChangeCurrentlySelectedArhitectureElementStateProvider)) {
          confirmed = await showConfirmDialog(context);
        }
        if (confirmed == true) {
          Scaffold.of(context).closeEndDrawer();
        }
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

  Future<bool?> showConfirmDialog(BuildContext context) => showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Prompt'),
          content: const Text(
            'Are you sure you want to exit drawer before saving?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      );
}
