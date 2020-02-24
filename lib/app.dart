import 'package:fltr_provider/provider/news_provider.dart';
import 'package:fltr_provider/provider/todo_provider.dart';
import 'package:fltr_provider/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
