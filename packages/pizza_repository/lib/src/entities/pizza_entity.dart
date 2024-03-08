import 'package:pizza_repository/src/models/pizza.dart';

class FoodMacroEntity {
  String macroName;
  String macroUnit;
  int macroValue;

  FoodMacroEntity(this.macroName, this.macroUnit, this.macroValue);

  Map<String, Object?> toDocument() {
    return {
      "macroName": macroName,
      "macroUnit": macroUnit,
      "macroValue": macroValue
    };
  }

  static FoodMacroEntity fromDocument(Map<String, dynamic> doc) {
    return FoodMacroEntity(
      doc['macroName'],
      doc['macroUnit'],
      doc['macroValue']
    );
  }
}

class PizzaEntity {
  String id;
  String name;
  String description;
  String imageUrl;
  FoodType foodType;
  int spiceLevel;
  double price;
  double discount;
  List<FoodMacro> macros;

  PizzaEntity(this.id, this.name, this.description, this.imageUrl,
      this.foodType, this.spiceLevel, this.price, this.discount, this.macros);

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'foodType': foodType.name,
      'spiceLevel': spiceLevel,
      'price': price,
      'discount': discount,
      'macros': macros.map((macro) => macro.toEntity().toDocument()).toList()
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc, String id) {
    List<FoodMacro> macros = doc['macros'] != null ? (doc['macros'] as List<dynamic> ?? [])
        .map((macro) => FoodMacro.fromEntity(FoodMacroEntity.fromDocument(macro)))
        .toList() : [];
    return PizzaEntity(
      id,
      doc['name'],
      doc['description'],
      doc['imageUrl'],
      FoodType.values.byName(doc['foodType']),
      doc['spiceLevel'],
      doc['price'].toDouble(),
      doc['discount'].toDouble(),
      macros
    );
  }
}