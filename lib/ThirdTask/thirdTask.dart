import 'package:apidemo_app/ThirdTask/musicPlayer.dart';
import 'package:apidemo_app/ThirdTask/relatedPost.dart';
import 'package:apidemo_app/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class ThirdTask extends StatefulWidget {
  static String routeName = "/thirdTask";
  @override
  _ThirdTaskState createState() => _ThirdTaskState();
}

class _ThirdTaskState extends State<ThirdTask> {

  int currentPos = 0;
  List<String> listPaths = [
    "assets/images/nature1.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
  ];
  List<String> listText = [
    "Nature1",
    "Nature2",
    "Nature3",
    "Nature4",
    "Nature5",
    "Nature6",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(250),
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/home-header.png",height: 200,),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Stack(
                        children: [
                          SvgPicture.asset("assets/icons/star_premium.svg"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/cloud-header.png",height: 210,),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: Container(
                      child: IconButton(
                        icon: Icon(Icons.linear_scale_sharp,size: 30,color: Colors.white,),
                        onPressed: (){
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(330),
              color: Colors.white,
              child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: listPaths.length,
                      options: CarouselOptions(
                          height: getProportionateScreenHeight(260),
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }
                      ),
                      itemBuilder: (context,index){
                        return MyImageView(listPaths[index],listText[index]);
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listPaths.map((url) {
                        int index = listPaths.indexOf(url);
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPos == index
                                ? Colors.black
                                : Colors.grey[300],
                          ),
                        );
                      }).toList(),
                    ),
                  ]
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(470),
              color: Colors.white,
              child: RelatedPost(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyImageView extends StatelessWidget{

  String imgPath;
  String imgText;

  MyImageView(this.imgPath,this.imgText);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: getProportionateScreenHeight(320),
          color: Colors.white,
          margin: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => MusicPlayer(imgPath,imgText)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(imgPath, fit: BoxFit.fill,),
            ),
          ),
        ),
        Positioned(
            top: 20,
            left:30,
            child: Text(imgText,style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,decoration: TextDecoration.none),)),
        Positioned(
            top: 80,
            left:30,
            child: SvgPicture.asset("assets/icons/ic_play.svg",height: 70,)),
      ],
    );
  }

}


