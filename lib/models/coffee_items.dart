import 'package:CoffeeAppUI/coffee_details.dart';
import 'package:CoffeeAppUI/models/coffee_data.dart';
import 'package:flutter/material.dart';

class CoffeeItems extends StatelessWidget {
  final int index;
  const CoffeeItems({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CoffeeDetails(
                      index: index,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: coffee_list[index].backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  coffee_list[index].name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Colors.black12,
                        coffee_list[index].backgroundColor,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(
                child: Hero(
                    tag: coffee_list[index].image,
                    child: Image.asset(
                      coffee_list[index].image,
                      fit: BoxFit.contain,
                    )))
          ],
        ),
      ),
    );
  }
}
