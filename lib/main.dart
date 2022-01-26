import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testapi/Employee.dart';
import 'package:http/http.dart' as http;

import 'getservice.dart';

void main() {
  runApp(MyApp());
}

class Testapi extends StatefulWidget {
  const Testapi({Key? key}) : super(key: key);

  @override
  _TestapiState createState() => _TestapiState();
}

class _TestapiState extends State<Testapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Employee",
          ),
        ),
        body: Container(
      child: FutureBuilder(
        future: getEmployeeData(),
        builder: (context,AsyncSnapshot<List<Employee>>  snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
              //hasdata
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              
            case ConnectionState.done:
              List<Employee> emplist = snapshot.data ??[];
              return 
                   ListView.builder(
                    shrinkWrap: true,
                      itemCount: emplist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(emplist[index].employee_name),
                          ),
                        );
                      });

            default:
              return Text("Done");
          }
        },
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Testapi());
  }
}
