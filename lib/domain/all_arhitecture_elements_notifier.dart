import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/data/database_models/base_architecture_element_storage.dart';
import 'package:flutter_arhitect/data/database_models/feature_storage.dart';
import 'package:flutter_arhitect/data/managers/database_manager.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AllArhitectureElements = List<BaseArhitectureElement>;

final allArhitectureElementsNotifier = StateNotifierProvider<
    AllArhitectureElementsNotifier, AllArhitectureElements>(
  (ref) => AllArhitectureElementsNotifier(
    ref.watch(architectureElementMapperProvider),
    ref.watch(databaseFeaturesManagerProvider),
    ref.watch(selectedFeatureTabProviderProvider),
  ),
);

class AllArhitectureElementsNotifier
    extends StateNotifier<AllArhitectureElements> {
  final ArchitectureElementMapper<BaseArhitectureElement>
      _architectureElementMapper;
  final DatabaseManager<FeatureStorage> _databaseFeaturesManager;
  final String _selectedFeatureTab;

  AllArhitectureElementsNotifier(
    this._architectureElementMapper,
    this._databaseFeaturesManager,
    this._selectedFeatureTab,
  ) : super([]) {
    _getDataFromDatabaseForCurrentlySelectedFeature();
    // Refres the state after the keys are assignes to the widgets
    Future.delayed(const Duration(milliseconds: 100), () {
      state = [...state];
    });
  }

  Future<void> saveCurrentStateToDatabase() async {
    log('Saving current state to database...');
    final featuresStorage = FeatureStorage(
      elements: state
          .map((e) =>
              BaseArchitectureElementStorage.fromBaseArchitectureElement(e))
          .toList(),
      addedAt: DateTime.now(),
    );
    await _databaseFeaturesManager.addToCache(
      key: _selectedFeatureTab,
      boxName: FeatureStorage.boxName,
      cachedObject: featuresStorage,
    );
  }

  void addArhitectureElementFromTemplate(Template template) {
    final arhitectureElement = template.generateArhitectureElement();

    final randomNumber = math.Random().nextInt(100);
    arhitectureElement.copyWith(name: randomNumber.toString());

    state = [...state, arhitectureElement];
  }

  void removeArhitectureElement(BaseArhitectureElement arhitectureElement) {
    var newState = [...state]..removeWhere(
        (element) => element.id == arhitectureElement.id,
      );
    for (final currentElement in newState) {
      if (currentElement.dependencies
              .indexWhere((element) => element.id == arhitectureElement.id) >
          -1) {
        newState = newState
            .map(
              (element) => element.id == currentElement.id
                  ? element.copyWith(
                      dependencies: [...element.dependencies]..removeWhere(
                          (element) => element.id == arhitectureElement.id,
                        ),
                    )
                  : element,
            )
            .toList();
      }
    }
    state = newState;
    saveCurrentStateToDatabase();
  }

  void addDependencyToArhitectureElement({
    required BaseArhitectureElement arhitectureElement,
    required BaseArhitectureElement dependency,
  }) {
    if (arhitectureElement == dependency ||
        !arhitectureElement.layer.canConnectWithLayer(dependency.layer)) {
      return;
    }
    if (arhitectureElement.dependencies
        .any((element) => element.id == dependency.id)) {
      return;
    }
    if (dependency.dependencies
        .any((element) => element.id == arhitectureElement.id)) {
      return;
    }
    state = state.map(
      (element) {
        if (element.id != arhitectureElement.id) {
          return element;
        }
        if (element.dependencies.contains(dependency)) {
          return element;
        }
        return element.copyWith(
          dependencies: [...element.dependencies, dependency],
        );
      },
    ).toList();
    saveCurrentStateToDatabase();
  }

  void removeDependencyFromArhitectureElement({
    required BaseArhitectureElement arhitectureElement,
    required BaseArhitectureElement dependency,
  }) {
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? element.copyWith(
                  dependencies: [...element.dependencies]..removeWhere(
                      (element) => element.id == dependency.id,
                    ),
                )
              : element,
        )
        .toList();
    saveCurrentStateToDatabase();
  }

  void updateArhitectureElementCanvasPosition(
    BaseArhitectureElement arhitectureElement,
  ) {
    log('Updating arhitecture element: ${arhitectureElement.name}');
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? arhitectureElement
              : element,
        )
        .toList();
    saveCurrentStateToDatabase();
  }

  void onFormSubmitted({
    required BaseArhitectureElement arhitectureElement,
    required Map<String, dynamic> formMap,
  }) {
    final updatedArchitectureElement =
        _architectureElementMapper(arhitectureElement, formMap);

    var newState = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? updatedArchitectureElement
              : element,
        )
        .toList();
    for (final currentElement in newState) {
      if (currentElement.dependencies
              .indexWhere((element) => element.id == arhitectureElement.id) >
          -1) {
        newState = newState.map(
          (element) {
            if (element.id != updatedArchitectureElement.id) {
              final index = element.dependencies.indexWhere(
                (element) => element.id == updatedArchitectureElement.id,
              );
              if (index > -1) {
                return element.copyWith(
                  dependencies: [...element.dependencies]
                    ..removeAt(index)
                    ..insert(index, updatedArchitectureElement),
                );
              }
            }
            return element;
          },
        ).toList();
      }
    }
    state = newState;
    saveCurrentStateToDatabase();
  }

  void reset() => state = [];

  void _getDataFromDatabaseForCurrentlySelectedFeature() {
    _databaseFeaturesManager
        .getFromCache(
      key: _selectedFeatureTab,
      boxName: FeatureStorage.boxName,
    )
        .then((featuresStorage) {
      if (featuresStorage != null) {
        state = (featuresStorage.elements)
            .map(
              (storageElement) => storageElement.toBaseArchitectureElement(),
            )
            .toList();
      }
    });
  }
}
