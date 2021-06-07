import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          // future: Future.delayed(Duration(seconds: 2), ()=>456),//根據future的狀態
          future: Future.delayed(Duration(seconds: 2), ()=>throw ("oops")),//顯示錯誤狀態
          initialData: 72,//initialData的功能是在Future還沒完成之前, 在snapshot.data裡面填入這個值.
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }

            if (snapshot.hasError){
              return Icon(Icons.error, size: 80,);
            }
            if(snapshot.hasData){
              return Text("${snapshot.data}", style: TextStyle(fontSize: 72),);
            }
            return CircularProgressIndicator();
            // //如果future還沒完成, 就顯示一個進度條
            // if (snapshot.connectionState == ConnectionState.waiting){
            //   return CircularProgressIndicator();
            // }
            // if (snapshot.connectionState == ConnectionState.done){
            //   if (snapshot.hasError){//==snapshot.error != null
            //     return Icon(Icons.error, size: 80,);
            //   }
            //   // return Text("${snapshot.data}");
            //   return Text("${snapshot.data}", style: TextStyle(fontSize: 72),);
            // }
            // throw "should not happen";

          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
