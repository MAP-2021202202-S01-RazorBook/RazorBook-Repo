import 'package:flutter/material.dart';
import 'package:razor_book/view_model/home_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var data = HomeViewModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text('${data.getCounter()}'),
          TextButton(onPressed: () {
            setState((){
              data.inc();
            });
          }, child: Icon(Icons.add)),
        ],
        ),
      )
    );
  }
}