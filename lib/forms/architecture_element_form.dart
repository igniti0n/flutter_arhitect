import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/parameter.dart';
import 'package:flutter_arhitect/presentation/pannel/pannel_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef ArchitectureElementMapper<Entity> = Entity Function(
  BaseArhitectureElement baseArhitectureElement,
  Map<String, dynamic>,
);

final architectureElementMapperProvider =
    Provider<ArchitectureElementMapper<BaseArhitectureElement>>(
  (_) => ArchitectureElementForm.updateArchitectureElementFromJson,
);

abstract class ArchitectureElementForm {
  static const nameKey = 'name';
  static const descriptionKey = 'description';
  static const _methodReturnValuePattern = 'method_return_value_';
  static const _methodNamePattern = 'method_name_';
  static const _parameterTypePattern = 'parameter_type_';
  static const _parameterNamePattern = 'parameter_name_';
  static String methodReturnValueForKey({required String methodKey}) =>
      '$_methodReturnValuePattern$methodKey';
  static String methodNameForKey({required String methodKey}) =>
      '$_methodNamePattern$methodKey';
  static String parameterTypeForKey({
    required String methodKey,
    required String parameterKey,
  }) =>
      '$_parameterTypePattern${methodKey}_$parameterKey';
  static String parameterNameForKey({
    required String methodKey,
    required String parameterKey,
  }) =>
      '$_parameterNamePattern${methodKey}_$parameterKey';

  static BaseArhitectureElement updateArchitectureElementFromJson(
    BaseArhitectureElement baseArhitectureElement,
    Map<String, dynamic> formMap,
  ) {
    final methodsMap = <String, Method>{};
    final parametersMap = <String, Parameter>{};
    for (final entry in formMap.entries) {
      if (entry.key.startsWith(_methodNamePattern) ||
          entry.key.startsWith(_methodReturnValuePattern)) {
        final methodKey = entry.key
            .replaceAll(_methodNamePattern, '')
            .replaceAll(_methodReturnValuePattern, '');
        final method =
            methodsMap.putIfAbsent(methodKey, () => Method.defaultMethod());
        if (entry.key.startsWith(_methodNamePattern)) {
          methodsMap[methodKey] = method.copyWith(methodName: entry.value);
        } else {
          methodsMap[methodKey] = method.copyWith(type: entry.value);
        }
      } else if (entry.key.startsWith(_parameterNamePattern) ||
          entry.key.startsWith(_parameterTypePattern)) {
        final methodParameterKeys = entry.key
            .replaceAll(_parameterNamePattern, '')
            .replaceAll(_parameterTypePattern, '');
        final parameter = parametersMap.putIfAbsent(
          methodParameterKeys,
          () => Parameter.defaultParameter(),
        );
        if (entry.key.startsWith(_parameterNamePattern)) {
          parametersMap[methodParameterKeys] =
              parameter.copyWith(parameterName: entry.value);
        } else {
          parametersMap[methodParameterKeys] =
              parameter.copyWith(type: entry.value);
        }
      }
    }
    final methods = <Method>[];
    for (final methodEntry in methodsMap.entries) {
      var method = methodEntry.value;
      for (final parameterEntry in parametersMap.entries) {
        if (parameterEntry.key.startsWith(methodEntry.key)) {
          method = method.copyWith(
            parameters: [...method.parameters, parameterEntry.value],
          );
        }
      }
      methods.add(method);
    }
    return baseArhitectureElement.copyWith(
      name: formMap[ArchitectureElementForm.nameKey],
      description: formMap[ArchitectureElementForm.descriptionKey],
      methods: methods,
    );
  }

  static void removeMethodFromForm({
    required String methodKey,
    required WidgetRef ref,
  }) {
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.methodReturnValueForKey(
            methodKey: methodKey,
          ),
          // isSetState: false,
        );
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.methodNameForKey(
            methodKey: methodKey,
          ),
          // isSetState: false,
        );
  }

  static void removeParameterFromForm({
    required String methodKey,
    required String parameterKey,
    required WidgetRef ref,
  }) {
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.parameterNameForKey(
            methodKey: methodKey,
            parameterKey: parameterKey,
          ),
          // isSetState: false,
        );
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.parameterTypeForKey(
            methodKey: methodKey,
            parameterKey: parameterKey,
          ),
          // isSetState: false,
        );
  }
}
