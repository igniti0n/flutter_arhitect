import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_arhitect/presentation/widgets/dialogs/remove_feature_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeatureChip extends ConsumerStatefulWidget {
  final String name;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Function(WidgetRef ref)? onTap;

  const FeatureChip({
    super.key,
    required this.name,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  });

  factory FeatureChip.enabeld(
    String name,
  ) {
    return FeatureChip(
      name: name,
      textColor: AppColors.text4,
      backgroundColor: AppColors.background2,
      borderColor: AppColors.border3,
      onTap: (ref) {
        ref.read(selectedFeatureTabProviderProvider.notifier).state = name;
      },
    );
  }

  factory FeatureChip.disabeld(
    String name,
  ) {
    return FeatureChip(
      name: name,
      textColor: AppColors.text3,
      backgroundColor: AppColors.background1,
      borderColor: Colors.transparent,
      onTap: null,
    );
  }

  @override
  ConsumerState<FeatureChip> createState() => _FeatureChipState();
}

class _FeatureChipState extends ConsumerState<FeatureChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final selectedFeature = ref.watch(selectedFeatureTabProviderProvider);
    final isSelected = widget.name == selectedFeature;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ShaderMask(
            blendMode: isHovered ? BlendMode.srcATop : BlendMode.dst,
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                AppColors.background2.withOpacity(0.4),
                AppColors.background2.withOpacity(0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: GestureDetector(
              onTap: () => widget.onTap?.call(ref),
              child: Container(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                    color: isSelected ? AppColors.border7 : widget.borderColor,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: isSelected ? AppColors.white : widget.textColor,
                      ),
                ),
              ),
            ),
          ),
          if (isHovered)
            Positioned(
              top: -4,
              right: 10,
              child: Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: AppColors.background2,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          RemoveFeatureDialog(featureName: widget.name),
                    );
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.icon1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
