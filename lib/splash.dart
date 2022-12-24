import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wishes_app/main_page.dart';

class splasgPage extends StatefulWidget {
  const splasgPage({super.key});

  @override
  State<splasgPage> createState() => _splasgPageState();
}

class _splasgPageState extends State<splasgPage> {
  DateTime date = DateTime.now();
  void initState() {
    // var newTime = DateFormat('dd-MMMM-yyyy').format(date);

    Future.delayed(Duration(seconds: 5), (() {
      // print(newTime);
      print(date);

      // ===>> will push to main page

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => mainPage())));
      setState(() {
        title = "Good Evening";
      });
      // print("Future");
    }));
    super.initState();
  }

  String title = '';

  @override
  Widget build(BuildContext context) {
    int newtime = int.parse(DateFormat('kk').format(date));

    if (newtime <= 12) {
      title = ("Good Morning");
    } else if (newtime > 12 && newtime < 16) {
      title = ("Good Afternoon");
    } else if (newtime > 16 && newtime <= 21) {
      title = ("Good Evening");
    } else
      print("Good Night");

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Text(
        "$title",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontFamily: 'Homemade Sausage'),
      )),
    );
  }
}
