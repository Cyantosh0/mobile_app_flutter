import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = 1;

  increase() {
    setState(() {
      data++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("$data"),
      const SizedBox(height: 10),
      ElevatedButton(onPressed: increase, child: const Text("Increase"))
    ]));
  }
}
