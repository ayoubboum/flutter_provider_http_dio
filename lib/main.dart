import 'package:connectivity/connectivity.dart';
import 'package:fltr_provider/provider/news_provider.dart';
import 'package:fltr_provider/provider/todo_provider.dart';
import 'package:fltr_provider/route.dart';
import 'package:fltr_provider/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }

  checkConnectivity() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // I am connected to a mobile network.
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text("mobile"),
    //   ));
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // I am connected to a wifi network.
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text("wifi"),
    //   ));
    // } else {
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text("None"),
    //   ));
    // }
  }
}
