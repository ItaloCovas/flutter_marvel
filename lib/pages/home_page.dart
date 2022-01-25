import 'package:flutter/material.dart';
import 'package:flutter_marvel/themes/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/spiderman.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Marvel Comics",
                        style: TextStyle(color: titleColor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/deadpool.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Marvel Series",
                        style: TextStyle(color: titleColor),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
