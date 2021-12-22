import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_flutter/employee.dart';

class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  final String baseUrl = "http://192.168.1.111:5000";

  getData() async {
    List<EmployeeModel> employees = [];
    final Dio dio = Dio();
    try {
      var res = await dio.get("$baseUrl/get-data");
      List<EmployeeModel>.from(
        employees = res.data["data"].map(
          (value) => EmployeeModel.fromJson(value),
        ),
      );
    } on DioError catch (e) {
      print(e);
    }
    return employees;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
                return ListTile(title: Text(snapshot.data[i].name));
              });
        } else {
          return const Text("No Data from API");
        }
      },
    );
  }
}
