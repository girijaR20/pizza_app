import 'package:pizza_repository/src/entities/pizza_entity.dart';

enum FoodType {veg, nonveg}

class FoodMacro {
  String macroName;
  String macroUnit;
  int macroValue;

  FoodMacro(this.macroName, this.macroUnit, this.macroValue);

  FoodMacroEntity toEntity() {
    return FoodMacroEntity(
        macroName,
        macroUnit,
        macroValue
    );
  }

  static FoodMacro fromEntity(FoodMacroEntity entity) {
    return FoodMacro(
      entity.macroName,
      entity.macroUnit,
      entity.macroValue
    );
  }
}

class Pizza {
  String id;
  String name;
  String description;
  String imageUrl;
  FoodType foodType;
  int spiceLevel;
  double price;
  double discount;
  List<FoodMacro> macros;

  Pizza(this.id, this.name, this.description, this.imageUrl, this.foodType,
      this.spiceLevel, this.price, this.discount, this.macros);

  PizzaEntity toEntity() {
    return PizzaEntity(
        id,
        name,
        description,
        imageUrl,
        foodType,
        spiceLevel,
        price,
        discount,
        macros
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
        entity.id,
        entity.name,
        entity.description,
        entity.imageUrl,
        entity.foodType,
        entity.spiceLevel,
        entity.price,
        entity.discount,
        entity.macros
    );
  }
}