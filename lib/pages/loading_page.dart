import 'package:flutter/material.dart';
import 'package:flutter_marvel/pages/home_page.dart';
import 'package:flutter_marvel/themes/theme.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int splashScreenTime = 4;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashScreenTime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottieJSON/71732-spiderman.json',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
