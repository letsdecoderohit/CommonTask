import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SecondTask extends StatefulWidget {
  static String routeName = "/secondTask";
  @override
  _SecondTaskState createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {



  Map data;
  List userData;

  Future<String> getData() async{
    http.Response response = await http.get("http://dummy.restapiexample.com/api/v1/employees");
    print(response.body);
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];

    });
    debugPrint(userData.toString());
    Navigator.pop(context);
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: userData == null ? Text("Loading..") : Text("Http get Request")
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(
                 children: [
                   // profile image is null in the API , so its throwing error in log , so commenting that part
                   // CircleAvatar(
                   //   backgroundImage: NetworkImage(userData[index]["profile_image"]),
                   // ),
                   Image.asset("assets/images/user_icon.png",width: 40,height: 40,),
                   SizedBox(width: 20,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Employee Name:- ${userData[index]["employee_name"]}"),
                       Text("Employee Age:- ${userData[index]["employee_age"]}"),
                       Text("Employee Salary:- ${userData[index]["employee_salary"]}"),
                     ],
                   )


                 ],
               ),
             ),
            );
          },
      ),
    );
  }
}
