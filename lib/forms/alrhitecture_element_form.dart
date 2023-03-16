// import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
// import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:uuid/uuid.dart';

// typedef FormMapper<Entity> = Entity Function(Map<String, dynamic>);

// final registerFormMapperProvider = Provider<FormMapper<BaseArhitectureElement>>(
//   (_) => RegisterForm.registerFromJson,
// );

// abstract class RegisterForm {
//   static const nameKey = 'first_name';
//   static const lastNameKey = 'last_name';
//   static const emailKey = 'email';
//   static const passwordKey = 'password';
//   static const repeatPasswordKey = 'repeat_password';

//   static BaseArhitectureElement registerFromJson(
//           Map<String, dynamic> formMap) =>
//       BaseArhitectureElement(
//         id: '',
//         widgetsGlobalKey: GlobalKey(),
//         layer: ArhitectureLayer.domain,
//         name: name,
//         dependencies: dependencies,
//         methods: methods,
//         dataValue: dataValue,
//         brickBundleName: brickBundleName,
//       );
// }
