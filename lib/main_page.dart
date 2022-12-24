import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wishes_app/msgpage.dart';
import 'package:wishes_app/wishes_model.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  // List Wishes = [
  //   'Birth Day',
  //   'Annivarsary',
  //   'Valentine',
  //   'Good Mark',
  //   'Boyfriend'
  // ];

  go(BuildContext c, String text) {
    Navigator.push(
        c,
        MaterialPageRoute(
            builder: ((_) => msgPage(
                  title: text,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    // ==>> it will print the unique one mtlb jo repeat hue hai unko ek bar
    List unique = [];
    for (var item in Wishes) {
      unique.add(item.category);
    }
    unique = unique.toSet().toList();
    return Scaffold(
      body: GridView.builder(
          itemCount: unique.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  go(c, unique[i]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ]),
                  child: Center(
                    child: Text(
                      unique[i],
                      // Wishes[i].category!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
