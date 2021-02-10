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
          height: MediaQuery.of(context).size.width * 0.55,
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenHeight(200),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(imageVal, fit: BoxFit.fill,)
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 55,
                child: Container(
                  height: getProportionateScreenHeight(80),
                  width: getProportionateScreenHeight(80),
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
