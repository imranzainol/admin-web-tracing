import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Screens/Home/Components/app_bar.dart';
class finallyScreen extends StatefulWidget {

  final String value; 

  const finallyScreen({Key key,this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState+
    return _finallyScreenState();
  }
}

// ignore: camel_case_types
class _finallyScreenState extends State<finallyScreen> {
  
  String qrData = "";
  String qrDataA = "";
  String qrDataB = "";
  String qrDataC = "";
  String phoneNo = "";
  String phoneNoA = "";
  String phoneNoB = "";
  String phoneNoC = "";
  String email = "";
  String emailA = "";
  String emailB = "";
  String emailC = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        // it will take full width
        width: size.width,
        decoration: BoxDecoration(
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            CustomAppBar(),
            // It will cover 1/3 of free spaces
              Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [

                  Text(
                    "Infected",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    "Name:"+qrData+"               "+"Phone Number:"+phoneNo+"               "+"Email:"+email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

                                    Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),


                  Text(
                    "Contact Level 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    "Name:"+qrDataA+"               "+"Phone Number:"+phoneNoA+"               "+"Email:"+emailA,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

                                    Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

                  Text(
                    "Contact Level 2",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    "Name:"+qrDataB+"               "+"Phone Number:"+phoneNoB+"               "+"Email:"+emailB,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

                                    Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

                  Text(
                    "Contact Level 3",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    "Name:"+qrDataC+"               "+"Phone Number:"+phoneNoC+"               "+"Email:"+emailC,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),


              Padding(
              padding: EdgeInsets.all(32),
              child: FlatButton(
                padding: EdgeInsets.all(32),
                onPressed: () async {

                  var docRef = await FirebaseFirestore.instance.collection("Users")
                      .where("riskLevel",isEqualTo:4).get();
                  docRef.docs.forEach((result) {
                    setState(() {
                    qrData = result.data()['fullName'];
                    phoneNo = result.data()['phoneNo'];
                    email = result.data()['email'];
                    });
                  });
                  var docRefA = await FirebaseFirestore.instance.collection("Users")
                      .where("riskLevel",isEqualTo:3).get();
                  docRefA.docs.forEach((result) {
                    setState(() {
                    qrDataA = result.data()['fullName'];
                    phoneNoA = result.data()['phoneNo'];
                    emailA = result.data()['email'];
                    });
                  });
                  var docRefB = await FirebaseFirestore.instance.collection("Users")
                      .where("riskLevel",isEqualTo:2).get();
                  docRefB.docs.forEach((result) {
                    setState(() {
                    qrDataB = result.data()['fullName'];
                    phoneNoB = result.data()['phoneNo'];
                    emailB = result.data()['email'];
                    });
                  });
                  var docRefC = await FirebaseFirestore.instance.collection("Users")
                      .where("riskLevel",isEqualTo:1).get();
                  docRefC.docs.forEach((result) {
                    setState(() {
                    qrDataC = result.data()['fullName'];
                    phoneNoC = result.data()['phoneNo'];
                    emailC = result.data()['email'];
                    });
                  });

                },
                child: Text(
                  "          Output          ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
