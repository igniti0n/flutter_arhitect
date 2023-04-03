import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/is_pannel_opened_state_provider.dart';
import 'package:flutter_arhitect/presentation/pannel/pannel_body.dart';
import 'package:flutter_arhitect/presentation/pannel/pannel_pully.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ElementInfoPannel extends HookConsumerWidget {
  const ElementInfoPannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPannelWidth = MediaQuery.of(context).size.width * 0.4;
    final maxPannelHeight = MediaQuery.of(context).size.height;

    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 350));
    final offsetAnimation = Tween<Offset>(
      begin: Offset(maxPannelWidth - 20, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    ref.listen<bool>(isPannelOpenedProvider, (_, isOpened) {
      if (isOpened) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });

    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (context, child) => Transform.translate(
        offset: offsetAnimation.value,
        child: child,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxPannelWidth,
            maxHeight: maxPannelHeight,
          ),
          child: Stack(
            children: const [
              PannelBody(),
              PannelPully(),
            ],
          ),
        ),
      ),
    );
  }
}
