import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/components/macro.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;
  const DetailsScreen(this.pizza, {super.key,});

  double _getDiscountedPrice(double price, double discount) {
    double discountedPrice = price - (price * (discount / 100));
    return double.parse(discountedPrice.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - (40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  image: Image.network(pizza.imageUrl).image
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2,2),
                    blurRadius: 3
                  )
                ]
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3,3),
                  blurRadius: 5
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                         Expanded(
                          flex: 2,
                          child: Text(
                            pizza.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    "\$${_getDiscountedPrice(pizza.price, pizza.discount)}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:Theme.of(context).colorScheme.primary
                                    )
                                ),
                                Text(
                                    "\$${pizza.price}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12,),
                    const Row(
                      children: [
                        PizzaMacroWidget(
                          title: "Calories",
                          value: 267,
                          icon: FontAwesomeIcons.fire,
                        ),
                        SizedBox(width: 10,),
                        PizzaMacroWidget(
                          title: "Protein",
                          value: 36,
                          icon: FontAwesomeIcons.dumbbell,
                        ),
                        SizedBox(width: 10,),
                        PizzaMacroWidget(
                          title: "Fat",
                          value: 21,
                          icon: FontAwesomeIcons.drumstickBite,
                        ),
                        SizedBox(width: 10,),
                        PizzaMacroWidget(
                          title: "Carbs",
                          value: 38,
                          icon: FontAwesomeIcons.carrot,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(
                        onPressed: () {

                        },
                        style: TextButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        child: const Text(
                            "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
