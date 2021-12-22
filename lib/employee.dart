class EmployeeModel {
  String id;
  String name;
  String age;

  EmployeeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        age = json['age'] as String;
}
