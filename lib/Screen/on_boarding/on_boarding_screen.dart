import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api_udemy/Screen/login/login.dart';
import 'package:shop_app_api_udemy/component.dart';
import 'package:shop_app_api_udemy/cubit/cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var controler = PageController();

  int _currentPage = 0;

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
          image: "assets/image/market1.png",
          title: "OnBoarding 1 title",
          body: "OnBoarding 1 Body"),
      BoardingModel(
          image: "assets/image/market2.png",
          title: "OnBoarding 2 title",
          body: "OnBoarding 2 Body"),
      BoardingModel(
          image: "assets/image/market3.png",
          title: "OnBoarding 3 title",
          body: "OnBoarding 3 Body")
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:(){
            navigateAndFinish(context, LoginScreen());
          }
          , child:Text(
                "Skip",
              style: TextStyle(
                fontSize: 20.0
              ),
              ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(

                onPageChanged: _onchanged,
                controller: controler,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoarderingItem(boarding[index]),
                itemCount: boarding.length,

              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(

                  controller: controler,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      dotColor: Colors.grey),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(_currentPage==(boarding.length-1)){
                      navigateAndFinish(context, LoginScreen());
                    }else{
                      controler.nextPage(
                                duration: Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoarderingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage("${model.image}"),
            ),
          ),
          Text(
            "${model.title}",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${model.body}",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
}

class BoardingModel {
   String image;
   String title;
  String body;

  BoardingModel({required this.image, required this.title, required this.body});
}
