import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/screens/home/views/details_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  const PizzaCard({super.key, required this.pizza});

  String _mapFoodTypeToText(FoodType foodType) {
    switch (foodType) {
      case FoodType.veg:
        return "Veg";
      case FoodType.nonveg:
        return "Non-Veg";
    }
  }
  
  Color _mapFoodTypeToColor(FoodType foodType) {
    switch (foodType) {
      case FoodType.veg:
        return Colors.green;
      case FoodType.nonveg:
        return Colors.redAccent;
    }
  }

  String _mapSpiceLevelToText(int spiceLevel) {
      switch (spiceLevel) {
        case 1:
          return "🌶️ Subtle";
        case 2:
          return "🌶️ Balanced";
        case 3:
          return "🌶️ Assertive";
        case 4:
          return "🌶️ Intense";
        case 5:
          return "🌶️ Fiery";
      }
      return "🌶️ Balanced";
  }

  Color _mapSpiceLevelToColor(int spiceLevel) {
    switch (spiceLevel) {
      case 1:
        return Colors.green.shade300;
      case 2:
        return Colors.green.shade500;
      case 3:
        return Colors.orange.shade300;
      case 4:
        return Colors.red.shade300;
      case 5:
        return Colors.red.shade500;
    }
    return Colors.green.shade500;
  }

  double _getDiscountedPrice(double price, double discount) {
    double discountedPrice = price - (price * (discount / 100));
    return double.parse(discountedPrice.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(pizza)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pizza.imageUrl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: _mapFoodTypeToColor(pizza.foodType),
                        borderRadius: BorderRadius.circular(30)),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Text(
                        _mapFoodTypeToText(pizza.foodType),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        _mapSpiceLevelToText(pizza.spiceLevel),
                        style: TextStyle(
                            color: _mapSpiceLevelToColor(pizza.spiceLevel),
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                pizza.name,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                pizza.description,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade700),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 11.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$${_getDiscountedPrice(pizza.price, pizza.discount)}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .colorScheme
                                .primary),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "\$${pizza.price}",
                        style: TextStyle(
                            decoration:
                            TextDecoration.lineThrough,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(2))),
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                          size: 15,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
