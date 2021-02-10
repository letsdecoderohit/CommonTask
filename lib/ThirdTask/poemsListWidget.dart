import 'package:apidemo_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PoemListWidget extends StatelessWidget {

  final String imageVal;
  final String heading;


  PoemListWidget(this.imageVal, this.heading);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          width: getProportionateScreenWidth(185),
          height: getProportionateScreenHeight(250),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 160,
                  width: 160,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(imageVal, fit: BoxFit.fill,)
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 48,
                child: Container(
                  height: 85,
                  width: 85,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: SvgPicture.asset("assets/icons/ic_play.svg",height: 70,width: 70,)),
                ),
              ),

            ],
          ),
        ),
        Text(heading,style: GoogleFonts.poppins(fontSize: 16,), textAlign: TextAlign.center,)
      ],
    );
  }
}
