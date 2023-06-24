import 'package:flutter/material.dart';
import 'package:flutter_arhitect/presentation/common/app_button.dart';
import 'package:flutter_arhitect/presentation/widgets/dialogs/add_feature_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFeatureChip extends ConsumerStatefulWidget {
  const AddFeatureChip({
    super.key,
  });

  @override
  ConsumerState<AddFeatureChip> createState() => _AddFeatureChipState();
}

class _AddFeatureChipState extends ConsumerState<AddFeatureChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: AppButton.primary(
          text: '+',
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => const AddFeatureDialog(),
            );
          },
        ),
      ),
    );
  }
}
