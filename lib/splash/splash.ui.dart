import 'package:aigen_tech_test/login/login.ui.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class SplashUi extends StatefulWidget {
  SplashUi({Key key}) : super(key: key);

  @override
  _SplashUiState createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashUi> {
    List<Slide> slides = new List();

@override
  void initState() {
    super.initState();
slides.add(Slide(title: "Browse Listing"));
slides.add(Slide(title: "Create your own listing"));
slides.add(Slide(title: "Contact lister"));
  }
    gotoMainPage() async {
//    await Future.delayed(Duration(seconds: 1, milliseconds: 500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => LoginUI()));
  }
  @override
  Widget build(BuildContext context) {
   return IntroSlider(slides: slides, colorSkipBtn: Colors.black,
      colorDoneBtn: Colors.black,
      onDonePress: gotoMainPage,
      onSkipPress: gotoMainPage,);
  }
}