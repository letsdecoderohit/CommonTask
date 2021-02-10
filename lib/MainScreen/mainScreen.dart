import 'package:apidemo_app/FirstTask/firstTask.dart';
import 'package:apidemo_app/SecondTask/secondTask.dart';
import 'package:apidemo_app/ThirdTask/thirdTask.dart';
import 'package:apidemo_app/Widgets/progressDialog.dart';
import 'package:apidemo_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  static String routeName = "/mainScreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getProportionateScreenWidth(200),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, FirstTask.routeName);
                },
                padding: EdgeInsets.symmetric(vertical: 20),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),),
                child: Text("First Task", style: TextStyle(fontSize: 18),),
                splashColor: Colors.lightBlue,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: getProportionateScreenWidth(200),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, SecondTask.routeName);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext){
                        return ProgressDialog(message: "Fetching Please Wait...",);
                      }
                  );
                },
                padding: EdgeInsets.symmetric(vertical: 20),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),),
                child: Text("Second Task", style: TextStyle(fontSize: 18),),
                splashColor: Colors.lightBlue,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: getProportionateScreenWidth(200),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, ThirdTask.routeName);
                },
                padding: EdgeInsets.symmetric(vertical: 20),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),),
                child: Text("Third Task", style: TextStyle(fontSize: 18),),
                splashColor: Colors.lightBlue,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
