import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// ignore: must_be_immutable
class historyUser extends StatefulWidget {
  @override
  _historyUserState createState() => _historyUserState();
}

class _historyUserState extends State<historyUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String displayName = "";

  @override
  void initState() {
  }



  Future<List<dynamic>> getList() async {
    var firestore = FirebaseFirestore.instance;
    var doc_ref = await firestore.collection("Users").where("userUid",isEqualTo:"userUid").get();
    print(doc_ref.docs[0].get("CheckIn"));
    List<dynamic> info = doc_ref.docs[0].get("CheckIn");

  }

    Future<List<dynamic>> getList1() async {
    var firestore = FirebaseFirestore.instance;
    var doc_ref = await firestore.collection("Users").where("userUid",isEqualTo:"userUid").get();
    print(doc_ref.docs[0].get("CheckIn"));
    List<dynamic> info = doc_ref.docs[0].get("CheckIn");
    return info;
  }

  
  Future<List<dynamic>> getList2() async {
    var firestore = FirebaseFirestore.instance;
    var doc_ref = await firestore.collection("Users").where("userUid",isEqualTo:"userUid").get();
    print(doc_ref.docs[0].get("CheckIn"));
    List<dynamic> info = doc_ref.docs[0].get("CheckIn");
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xFF039BE5),
        title: Text("History"),
        actions: <Widget>[
        ],
      ),

      body: Container(
        child: FutureBuilder(
            future: getList(),
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:  Text("risklevel"+"4",style: TextStyle())
            );
            }
            else if (snapshot.data.length == 0) {
              return Center(
                  child: Text("risklevel",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,))
              );
            }
            else if (snapshot.data.length == 4){
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["members"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] < 86400000))
                            .toString()),
                      );

                     return Center(
                  child: Text("risklevel"+"3",style: TextStyle())
              );
                    }),
              );
            }

                        else if (snapshot.data.length == 3){
                          getList();
              return Container(

                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["members"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] < 86400000))
                            .toString()),
                      );

                                           return Center(
                  child: Text("risklevel"+"2",style: TextStyle())
              );
                    }),
              );
            }

                        else if (snapshot.data.length == 2){
                          getList();
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["members"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] > 86400000))
                            .toString()),
                      );

                                                                 return Center(
                  child: Text("risklevel"+"2",style: TextStyle())
              );
                    }),
              );
            }

                        else if (snapshot.data.length == 4){
                          getList1();
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["CheckIn"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] < 1209600000))
                            .toString()),
                      );

                                                                 return Center(
                  child: Text("risklevel"+"2",style: TextStyle())
              );
                    }),
              );
            }

                                    else if (snapshot.data.length == 3){
                          getList1();
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["CheckIn"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"]< 1209600000))
                            .toString()),
                      );

                                                                 return Center(
                  child: Text("risklevel"+"2",style: TextStyle())
              );
                    }),
              );
            }
                        else if (snapshot.data.length == 2){
                          getList2();
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["CheckIn"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] < 1209600000))
                            .toString()),
                      );
                    }),
              );
            }
                                    else if (snapshot.data.length == 1){
                          getList2();
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["CheckIn"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] < 1209600000))
                            .toString()),
                      );
                                                                 return Center(
                  child: Text("risklevel"+"1",style: TextStyle())
              );
                    }),
              );
            }
          },
        ),
      ),

      




    );
  }

  
}
