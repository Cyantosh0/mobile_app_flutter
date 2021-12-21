import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  getData() async {
    var data = [];
    var res = await http.get(Uri.parse("localhost:5000/get-data"));
    var jsonData = jsonDecode(res.body);

    for (var i in jsonData) {
      EmployeeModel d = EmployeeModel(i['id'], i['name'], i['age']);
      data.add(d);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
                return ListTile(title: Text(snapshot.data[i].name));
              });
        } else {
          return const Text("No Data");
        }
      },
    );
  }
}

class EmployeeModel {
  String id;
  String name;
  String age;
  EmployeeModel(this.id, this.name, this.age);
}
