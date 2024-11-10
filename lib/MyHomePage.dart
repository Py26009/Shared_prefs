import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getValueFromPrefs();
  }

  void getValueFromPrefs() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Home'),
     ),
     body: Column(
       children: [
         Text(name!='' ? 'Welcome, $name': "" ),
         TextField(
           controller: nameController,
         ),
         ElevatedButton(onPressed: () async{
           SharedPreferences prefs = await SharedPreferences.getInstance();
           prefs.setString('name', nameController.text.toString());
         },
             child:Text('Save'), )
       ],
     ),
   );
  }
}
