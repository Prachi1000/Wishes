import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wishes_app/detail.dart';
import 'package:wishes_app/wishes_model.dart';

class msgPage extends StatelessWidget {
  String? title;
  msgPage({this.title});

  go(BuildContext c, String text) {
    Navigator.push(
        c,
        MaterialPageRoute(
            builder: ((_) => DetailPage(
                  detail: text,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: Wishes.where((element) => element.category == title)
              .map(
                (e) => InkWell(
                  onTap: () {
                    go(context, e.message!);
                  },
                  child: Card(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.message!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
