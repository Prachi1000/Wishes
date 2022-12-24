import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatelessWidget {
  String? detail;
  DetailPage({this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 100),
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
                // height: 500,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      detail!,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Share.share(detail!);
                  },
                  icon: Icon(Icons.share),
                  iconSize: 30,
                ),
                IconButton(
                    onPressed: () {
                      FlutterClipboard.copy(detail!).whenComplete(() =>
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Copied"))));
                    },
                    icon: Icon(Icons.copy))
              ],
            )
          ],
        ),
      ),
    );
  }
}
