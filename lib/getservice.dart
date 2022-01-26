import 'dart:convert';

import 'Employee.dart';
import 'package:http/http.dart' as http;
Future<List<Employee>> getEmployeeData() async {
    var response = await http
        .get(Uri.https("dummy.restapiexample.com", "api/v1/employees"));
    var jsondata = jsonDecode(response.body);
    var employee = jsondata["data"];
    List<Employee> employees = [];
    for (var e in employee) {
      Employee employ = Employee(
          e['id'].toString(),
          e['employee_name'].toString(),
          e['employee_salary'].toString(),
          e['employee_age'].toString(),
          e['profile_image']);
      employees.add(employ);
    }
    return employees;
  }


