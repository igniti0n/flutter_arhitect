import 'package:flutter/material.dart';

enum ArhitectureLayer {
  data,
  domain,
  presentation,
}

extension ArhitectureLayerExtension on ArhitectureLayer {
  bool canConnectWithLayer(ArhitectureLayer arhitectureLayer) {
    switch (this) {
      case ArhitectureLayer.data:
        return arhitectureLayer != ArhitectureLayer.presentation;
      case ArhitectureLayer.presentation:
        return arhitectureLayer != ArhitectureLayer.data;
      case ArhitectureLayer.domain:
        return true;
    }
  }

  Color get color {
    switch (this) {
      case ArhitectureLayer.data:
        return Colors.green[600]!;
      case ArhitectureLayer.domain:
        return Colors.yellow[600]!;
      case ArhitectureLayer.presentation:
        return Colors.blue[600]!;
    }
  }
}
