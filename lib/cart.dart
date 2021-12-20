import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key key,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController taskcontroller = TextEditingController();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('CART').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cart Screen",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  return ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      // return ListTile(
                      //   title: Text(data['CART'],style: TextStyle(
                      //     fontSize: 40,
                      //     fontWeight: FontWeight.bold
                      //   ),),
                      //   subtitle: Image.asset(
                      //     data["IMAGE"],
                      //     height: 200,
                      //     width: 200,
                      //   ),
                      //   trailing: Wrap(
                      //     spacing: 1,
                      //     children: [
                      //       IconButton(
                      //           onPressed: () {
                      //             document.reference.delete();
                      //           },
                      //           icon: Icon(Icons.delete,),color: Colors.red,),
                      //     ],
                      //   ),
                      // );
                      return Container(
                        margin: EdgeInsets.all(20.0),
                        height: 170,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(data["IMAGE"]),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            data['CART'],
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    width: 0.8,
                                                    color: Colors.black54)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20.0,
                                                ),
                                                Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 20.0,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              document.reference.delete();
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                            ),
                                            color: Colors.red,
                                            iconSize: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              )),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 100,
          decoration:
              BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            )
          ]),
          child: Center(
            child: FlatButton(
              child: Text(
                "CHECKOUT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
              onPressed: () {},
            ),
          ),
        ));
  }
}
