import 'dart:async';

import 'package:apidemo_app/Models/createPost.dart';
import 'package:apidemo_app/Widgets/progressDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class FirstTask extends StatefulWidget {

  static String routeName = "/firstTask";

  @override
  _FirstTaskState createState() => _FirstTaskState();
}


Future<CreatePost> createUser(String name,String salary,String age) async{
  final String apiUrl = "http://dummy.restapiexample.com/api/v1/create";

  final response = await http.post(
    apiUrl,
    body: {
      "name" : name,
      "salary" : salary,
      "age" : age
    });

  if(response.statusCode == 200){
    final String res = response.body;
    return createPostFromJson(res);
  }else{
    return null;
  }
}


class _FirstTaskState extends State<FirstTask> {


  String nameNullError = "";
  String salaryNullError= "";
  String birthDateNullError= "";



  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController salaryTextEditingController = TextEditingController();
  String name = "";
  int maxLength = 100;


  String birthDate = "";
  int age = -1;

  CreatePost _createPost;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Demo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    maxLength: 100,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(fontSize: 14.0,),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0,)
                      ),
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.name,
                      style: GoogleFonts.poppins(fontSize: 18.0,),
                      onChanged: (String newVal) {
                        if (newVal.length <= maxLength) {
                          name = newVal;
                        }
                        else {
                          nameTextEditingController.value = new TextEditingValue(
                              text: name,
                              selection: new TextSelection(
                                  baseOffset: maxLength,
                                  extentOffset: maxLength,
                                  affinity: TextAffinity.downstream,
                                  isDirectional: false
                              ),
                              composing: new TextRange(
                                  start: 0, end: maxLength
                              )
                          );
                          nameTextEditingController.text = name;
                        }

                      }
                  ),

                  SizedBox(height: 20,),
                  TextFormField(
                    controller: salaryTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Salary",
                        labelStyle: TextStyle(fontSize: 14.0,),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0,
                        )
                    ),
                    style: GoogleFonts.poppins(fontSize: 14.0,),
                  ),
                  SizedBox(height: 30,),
                ],
              ),


              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    (age > -1)
                        ? Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                              border: Border.all(color: Colors.grey)
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("BirthDate: ",style: TextStyle(fontSize: 16,),),
                              Text("$birthDate",style: TextStyle(fontSize: 16,),)
                            ],
                          ),
                        ),

                      ],
                    )
                        : Text("Press button to select DOB:-",style: GoogleFonts.poppins(fontSize: 15),),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.blue[200],
                      splashColor: Colors.blue.shade100,
                      onPressed: () async {
                        DateTime birthDate = await selectDate(context, DateTime.now(),
                            lastDate: DateTime.now());
                        final df = new DateFormat('dd-MMM-yyyy');
                        this.birthDate = df.format(birthDate);

                        setState(() {
                          this.age = calculateAge(birthDate);
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(12),
                          child: Text("Select birthdate".toUpperCase(),style: GoogleFonts.poppins(fontSize: 16,),)),
                    )
                  ],
                ),
              ),

              SizedBox(height: 40,),


              RaisedButton(
                color: Colors.blue,
                splashColor: Colors.blue.shade300,
                onPressed: () async{
                  final String salary = salaryTextEditingController.text.toString();
                  final String name = nameTextEditingController.text.toString();

                  if(name.isEmpty){
                    setState(() {
                      nameNullError = "Please Enter your Name";
                    });
                    salaryNullError = "";
                    birthDateNullError = "";

                  }
                  else if(salary.isEmpty){
                    setState(() {
                      salaryNullError = "Please Enter your Salary";
                    });
                    nameNullError = "";
                    birthDateNullError = "";

                  }
                  else if(age == -1){
                    setState(() {
                      birthDateNullError = "Please Select your Birthdate";
                    });
                    nameNullError = "";
                    salaryNullError = "";

                  }
                  else{
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext){
                          return ProgressDialog(message: "Regestering Please Wait...",);
                        }
                    );

                    final CreatePost user = await createUser(name, salary, age.toString());
                    setState(() {
                      _createPost = user;
                    });

                    Navigator.pop(context);

                  }




                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 80),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Submit",style: GoogleFonts.poppins(fontSize: 20,),)),
              ),

              _createPost == null
                  ? Container(child: Text(
                " ${nameNullError} \n ${salaryNullError}  \n ${birthDateNullError}",
                style: GoogleFonts.poppins(fontSize: 18,color: Colors.red),),)


                  : Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("message:- ${_createPost.message} \n id:-${_createPost.data.id} ", style: GoogleFonts.poppins(fontSize: 18),),
              )



            ],
          ),
        ),
      ),

    );
  }

  void validateFields(String salary) async{

  }

  resetApp(){
    setState(() {
      nameTextEditingController.text = "";
      salaryTextEditingController.text = "";
      name = "";
      birthDate= "";
      age = -1;
    });

  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  selectDate(BuildContext context, DateTime initialDateTime, {DateTime lastDate}) async {
    Completer completer = Completer();
    String _selectedDateInString;

    showDatePicker(
        context: context,
        initialDate: initialDateTime,
        firstDate: DateTime(1970),
        lastDate: lastDate == null
            ? DateTime(initialDateTime.year + 10)
            : lastDate)
        .then((temp) {
      if (temp == null) return null;
      completer.complete(temp);
      setState(() {});
    });
    return completer.future;
  }
}