import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor
      ),
      child: Center(
        child: Text(
          "BROTHERLY",
          style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).primaryColor,
              decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}
