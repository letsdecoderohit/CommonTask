import 'package:apidemo_app/ThirdTask/poemsListWidget.dart';
import 'package:apidemo_app/ThirdTask/relatedPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';

class MusicPlayer extends StatelessWidget {

  final String imgPath;
  final String imgText;

  MusicPlayer(this.imgPath, this.imgText);

  @override
  Widget build(BuildContext context) {

    Duration position = new Duration();
    Duration musicLength = new Duration();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(300),
                child: Stack(
                  children: [
                    Container(
                       width: double.infinity,
                        child: Image.asset(imgPath,fit: BoxFit.fill,)
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          width: double.infinity,
                          child: Image.asset("assets/images/story-top-cloud.png",)
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 15,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(360),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text( "${imgText}",style: GoogleFonts.poppins(fontSize: 18),),
                        ),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(220),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: SvgPicture.asset("assets/icons/ic_play.svg",height: 90,)
                          ),
                          Positioned(
                            top: 35,
                            left: 20,
                            child: Container(
                              alignment: Alignment.topLeft,
                                child: SvgPicture.asset("assets/icons/ic_play.svg",height: 45,)
                            ),
                          ),
                          Positioned(
                            top: 33,
                            right: 20,
                            child: Container(
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset("assets/icons/ic_pause.svg",height: 45,)
                            ),
                          ),

                          Positioned(
                            bottom: 20,
                            left: 50,
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset("assets/icons/download_unsubscribed.svg",height: 55,)
                            ),
                          ),

                          Positioned(
                            bottom: 20,
                            right: 50,
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset("assets/icons/ic_share.svg",height: 55,)
                            ),
                          ),



                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("00:00",textAlign: TextAlign.left,),
                          ),
                          Expanded(
                            child: Slider(
                                value: position.inSeconds.toDouble(),
                                max: musicLength.inSeconds.toDouble(),
                                activeColor: Colors.blue,
                                inactiveColor: Colors.blue[800],

                                onChanged: null,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text("00:00",textAlign: TextAlign.right,),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(60),
                child: Container(
                    width: double.infinity,
                    child: Image.asset("assets/images/story-bottom-cloud.png",fit: BoxFit.fill,)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,),
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
          )
        ),
      ),
    );
  }
}

