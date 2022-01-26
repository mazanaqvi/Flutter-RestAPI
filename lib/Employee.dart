import 'dart:convert';

import 'package:http/http.dart' as http;

class Employee {
  final String id,employee_name, employee_salary, employee_age,profile_image;
  Employee(this.id,this.employee_name, this.employee_salary, this.employee_age,this.profile_image);
}
