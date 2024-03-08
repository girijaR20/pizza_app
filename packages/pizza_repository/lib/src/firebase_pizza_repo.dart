import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_repository/src/entities/pizza_entity.dart';
import 'package:pizza_repository/src/models/pizza.dart';
import 'package:pizza_repository/src/pizza_repo.dart';

class FirebasePizzaRepo implements PizzaRepository {
  static const String collectionName = "pizzas";
  final pizzaCollection = FirebaseFirestore.instance.collection(collectionName);

  @override
  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection
          .get()
          .then((value) =>
          value.docs.map((doc) {
            PizzaEntity entity = PizzaEntity.fromDocument(doc.data(), doc.id);
            return Pizza.fromEntity(entity);
          }
          ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}