import 'dart:math';
import 'package:get/get.dart';
import '../models/additives_model.dart';

class FoodController extends GetxController {
  // Category
  String _category = '';
  String get category => _category;
  set setCategory(String newValue) {
    _category = newValue;
    print(category);
  }

  // Food Types
  RxList<String> _types = <String>[].obs;
  RxList<String> get types => _types;
  set setTypes(String newValue) {
    _types.add(newValue);
  }

  // ID Generator
  int generateId() {
    int min = 0;
    int max = 10000;
    return min + Random().nextInt(max - min);
  }

  // Additives List
  RxList<Additive> _additivesList = <Additive>[].obs;
  RxList<Additive> get additives => _additivesList;

  void addAdditive({required String title, required double price}) {
    final newAdditive = Additive(id: generateId(), title: title, price: price);
    _additivesList.add(newAdditive);
  }

  void clearAdditives() {
    _additivesList.clear();
  }
}
