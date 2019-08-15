import 'package:flutter/material.dart';
import 'dart:async';

main(){
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    home: Age(),
  ));
}

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  double age=0.0;
  var selectedYear;


 void show(){
    showDatePicker(context: context,
                   initialDate: DateTime(2019),
                   firstDate: DateTime(1900),
                   lastDate: DateTime.now()).then((DateTime dr){
                     setState((){
                       selectedYear=dr.year;

                      // calculateAge();
                       age=(2019-selectedYear).toDouble();
                     });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Age'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(


              color: Colors.black,
              onPressed: show,child: Text(selectedYear!=null?selectedYear.toString():'select your Age',style: TextStyle(fontSize: 23),),
            borderSide: BorderSide(color: Colors.black,width: 3),
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(

                  topLeft: Radius.circular(50.7),bottomLeft: Radius.circular(50.7))),
            ),
            Text('your Age :${age.toStringAsFixed(0)}',style:TextStyle(fontSize: 19,fontWeight: FontWeight.bold) ,)
          ],
        ),
      ),
    );
  }
}
