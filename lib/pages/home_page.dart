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
      backgroundColor: blackGroundColor,
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Row(
              children: [
                Image(image: AssetImage("assets/images/icone_comics.png"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
