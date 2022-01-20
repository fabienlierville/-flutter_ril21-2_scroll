import 'package:flutter/material.dart';

class PageListView extends StatefulWidget {
  const PageListView({Key? key}) : super(key: key);

  @override
  _PageListViewState createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Center(

      ),
    );
  }
}
