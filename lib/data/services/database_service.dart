import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseServiceImpl();
});

abstract class DatabaseService {
  Future<List<BaseArhitectureElement>> getStoredArhitectureElements();
  Future<void> addArhitectureElement({required BaseArhitectureElement element});
  Future<BaseArhitectureElement> deleteArhitectureElements(
      {required String id});
}

class DatabaseServiceImpl extends DatabaseService {
  @override
  Future<List<BaseArhitectureElement>> getStoredArhitectureElements() async {
    return [
      BaseArhitectureElement.empty().copyWith(
        name: 'Repository',
        brickBundleName: 'clean_repository',
        layer: ArhitectureLayer.data,
      ),
      BaseArhitectureElement.empty().copyWith(
        name: 'Service',
        brickBundleName: 'clean_service',
        layer: ArhitectureLayer.data,
      ),
      BaseArhitectureElement.empty().copyWith(
        name: 'Page',
        brickBundleName: 'page',
        layer: ArhitectureLayer.data,
      ),
      // BaseArhitectureElement.empty().copyWith(
      //   name: 'Repository',
      //   brickBundleName: 'clean_repository',
      //   layer: ArhitectureLayer.data,
      // ),
      // BaseArhitectureElement.empty().copyWith(
      //   name: 'Repository',
      //   brickBundleName: 'clean_repository',
      //   layer: ArhitectureLayer.data,
      // )
    ];
  }

  @override
  Future<void> addArhitectureElement(
      {required BaseArhitectureElement element}) {
    // TODO: implement addArhitectureElement
    throw UnimplementedError();
  }

  @override
  Future<BaseArhitectureElement> deleteArhitectureElements(
      {required String id}) {
    // TODO: implement deleteArhitectureElements
    throw UnimplementedError();
  }
}
