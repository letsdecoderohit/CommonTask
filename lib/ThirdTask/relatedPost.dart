import 'package:apidemo_app/ThirdTask/poemsListWidget.dart';
import 'package:apidemo_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RelatedPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset("assets/images/user_icon.png",height: 40,width: 40,),
                  SizedBox(width: 20,),
                  Text("Bedtime Stories", style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,),
            height: getProportionateScreenHeight(300),
            width: double.infinity,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                PoemListWidget("assets/images/nature1.jpg","Nature 1"),
                PoemListWidget("assets/images/nature2.jpg","Nature 2"),
                PoemListWidget("assets/images/nature3.jpg","Nature 3"),
                PoemListWidget("assets/images/nature4.jpg","Nature 4"),
                PoemListWidget("assets/images/nature5.jpg","Nature 5"),
                PoemListWidget("assets/images/nature6.jpg","Nature 6"),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
