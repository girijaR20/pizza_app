import 'package:pizza_repository/src/models/pizza.dart';

abstract class PizzaRepository {
  Future<List<Pizza>> getPizzas();
}