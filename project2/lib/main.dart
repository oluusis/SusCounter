import 'package:flutter/material.dart';
import 'package:project2/start.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
        title: const Text(
          "SUS counter",
          style: TextStyle(
              height: 20,
              fontWeight: FontWeight.w700,
              fontFamily: "sans-serif-condensed"),
        ),
        centerTitle: true,
        backgroundColor: Colors.red),
    body: const Start(),
  )));
}







//stl -> v tomhle jde hot reload
/* class Home1 extends StatelessWidget {
const Home1({super.key});

@override
Widget build(BuildContext context) {
return const Placeholder();
}
}

class Home2 extends StatelessWidget {
const Home2({super.key});

@override
Container build(BuildContext context) {
return Container(
color: Colors.amber,
margin: const EdgeInsets.only(left: 10, top: 10),
padding: const EdgeInsets.all(20),
child: const Text(
  "Osss",
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 50),
),
);
}
}
 */