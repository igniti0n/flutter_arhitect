import 'dart:convert';

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';

class FeatureStorage {
  final List<BaseArhitectureElement> elements;
  final DateTime addedAt;

  FeatureStorage({
    required this.elements,
    required this.addedAt,
  });

  @override
  factory FeatureStorage.fromMap(Map<String, dynamic> map) {
    return FeatureStorage(
      elements: (jsonDecode(map['elements']) as List)
          .map((e) => BaseArhitectureElement.fromMap(e))
          .toList(),
      addedAt: DateTime.parse(map['addedAt']),
    );
  }

  @override
  Map<String, String> toMap() {
    return {
      'elements': jsonEncode(elements.map((e) => e.toMap()).toList()),
      'addedAt': addedAt.toIso8601String(),
    };
  }
}
