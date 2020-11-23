import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../tracing.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState+
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = "";
  

  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width  of our screen
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                fullName = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (fullName != "" && fullName != null)
            ? FirebaseFirestore.instance
            .collection('Users')
            .where("searchKeywords", arrayContains: fullName)
            .snapshots()
            : FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data.docs[index];
              return Card(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                  InkWell(
                    child: Text(
                      data.data()['fullName'],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                         onTap: () {
                           Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) => traceScreen(value: data.data()['fullName'])));
                         },
                    )

                  ],
                ),
              );

              
            },
          );
        },
      ),
    );
  }
}
