import 'package:CoffeeAppUI/models/coffee_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CoffeeDetails extends StatefulWidget {
  int index;

  CoffeeDetails({this.index});

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
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
                    left: 50,
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Hero(
                          tag: coffee_list[index].image,
                          child: Image.asset(
                            coffee_list[index].image,
                            fit: BoxFit.contain,
                          )),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: coffee_list[index].backgroundColor,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  iconSize: 40,
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: coffee_list[index].backgroundColor,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  coffee_list[index].image,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 45,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmoothStarRating(
                                    rating: rating,
                                    isReadOnly: false,
                                    size: 30,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    allowHalfRating: true,
                                    spacing: 2.0,
                                    onRated: (value) {
                                      setState(() {
                                        rating = value;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(rating.toString(),style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500 
                                    ),),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
