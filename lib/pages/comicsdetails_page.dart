import 'package:flutter/material.dart';
import 'package:flutter_marvel/themes/theme.dart';

class ComicsDetailsPage extends StatefulWidget {
  ComicsDetailsPage({Key? key}) : super(key: key);

  @override
  State<ComicsDetailsPage> createState() => _ComicsDetailsPageState();
}

class _ComicsDetailsPageState extends State<ComicsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryBlack,
        elevation: 0,
      ),
    );
  }
}
