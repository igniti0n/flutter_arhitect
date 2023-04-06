import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/presentation/pannel/pannel_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef ArchitectureElementMapper<Entity> = Entity Function(
  BaseArhitectureElement baseArhitectureElement,
  Map<String, dynamic>,
);

final registerFormMapperProvider =
    Provider<ArchitectureElementMapper<BaseArhitectureElement>>(
  (_) => ArchitectureElementForm.updateArchitectureElementFromJson,
);

abstract class ArchitectureElementForm {
  static const nameKey = 'name';
  static const descriptionKey = 'description';
  static String methodReturnValueForKey({required String methodKey}) =>
      'method_return-value_$methodKey';
  static String methodNameForKey({required String methodKey}) =>
      'method_name_$methodKey';
  static String parameterTypeForKey({
    required String methodKey,
    required String parameterKey,
  }) =>
      'parameter_type_${methodKey}_$parameterKey';
  static String parameterNameForKey({
    required String methodKey,
    required String parameterKey,
  }) =>
      'parameter_name_${methodKey}_$parameterKey';

  static BaseArhitectureElement updateArchitectureElementFromJson(
    BaseArhitectureElement baseArhitectureElement,
    Map<String, dynamic> formMap,
  ) =>
      baseArhitectureElement.copyWith();

  static void removeMethodFromForm({
    required String methodKey,
    required WidgetRef ref,
  }) {
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.methodReturnValueForKey(
            methodKey: methodKey,
          ),
          isSetState: false,
        );
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.methodNameForKey(
            methodKey: methodKey,
          ),
          isSetState: false,
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
          isSetState: false,
        );
    ref.read(formKeyProvider).currentState?.removeInternalFieldValue(
          ArchitectureElementForm.parameterTypeForKey(
            methodKey: methodKey,
            parameterKey: parameterKey,
          ),
          isSetState: false,
        );
  }
}
