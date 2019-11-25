import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/ad/ad.ui.dart';
import 'package:aigen_tech_test/interfaces/i.adui.helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {

              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(FontAwesomeIcons.list),
                text: "Ads for you",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.ad),
                text: "My Ads",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[AdUi(false), AdUi(true)],
        ),
      ),
    );
  }
}
