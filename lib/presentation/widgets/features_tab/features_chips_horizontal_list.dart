import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/features_selection/features_provider.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/presentation/widgets/features_tab/feature_chip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturesChipsHorizontalList extends ConsumerStatefulWidget {
  const FeaturesChipsHorizontalList({super.key});

  @override
  ConsumerState<FeaturesChipsHorizontalList> createState() =>
      _GroupDatesHorizontalListState();
}

class _GroupDatesHorizontalListState
    extends ConsumerState<FeaturesChipsHorizontalList> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final features = ref.watch(featuresProvider);

    ref.listen(selectedFeatureTabProviderProvider, (_, date) {
      _controller.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutExpo,
      );
    });

    return SizedBox(
      height: 44,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: ListView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                ...features
                    .map(
                      (date) => FeatureChip.enabeld(date),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
