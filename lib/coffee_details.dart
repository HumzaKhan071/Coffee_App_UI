import 'package:CoffeeAppUI/models/coffee_data.dart';
import 'package:flutter/material.dart';

class CoffeeDetails extends StatelessWidget {
  int index;

  CoffeeDetails({this.index});

  @override
  Widget build(BuildContext context) {
    int index = 1;
    var rating = 3.0;
    int quantity = 1;

    bool switchvalue = true;

    bool isFavorite = true;

    return Scaffold(
      backgroundColor: coffee_list[index].backgroundColor,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 60,
                    child: Image.asset("assets/images/menu.png"),
                  ),
                  Container(
                    height: 50,
                    width: 60,
                    child: Image.asset("assets/images/shopping-cart.png"),
                  )
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70))),
                    ),
                  ],
                ),
                Positioned(
                    left: 30,
                    child: Container(
                      height: 400,
                      width: 400,
                      child: Hero(
                          tag: coffee_list[index].image,
                          child: Image.asset(coffee_list[index].image,fit: BoxFit.contain,)),
                    ))
              ],
            ))
          ],
        ),
      )),
    );
  }
}
