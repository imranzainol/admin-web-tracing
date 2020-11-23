import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Screens/Home/Components/app_bar.dart';
import 'final.dart';
import 'loading.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class traceScreen extends StatefulWidget {

  final String value; 

  const traceScreen({Key key,this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState+
    return _traceScreenState();
  }
}
// ignore: camel_case_types
class _traceScreenState extends State<traceScreen> {

  Future<List<dynamic>> getList() async {
    var firestore = FirebaseFirestore.instance;
    var doc_ref = await firestore.collection("Users").where("fullName",isEqualTo:widget.value).get();
    print(doc_ref.docs[0].get("history"));
    List<dynamic> info = doc_ref.docs[0].get("history");
    return info;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width  of our screen
    return Scaffold(

      body: new Builder(
        builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            CustomAppBar(),
            // It will cover 1/3 of free spaces
              Expanded(
                flex: 2,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [

                  Text(
                    widget.value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

/*               Padding(
              padding: EdgeInsets.all(32),
              child: FlatButton(
                padding: EdgeInsets.all(32),
                onPressed: () async {},
                child: Text(
                  "          Tracin          ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ) */
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 8,
            child: FutureBuilder(
            future: getList(),
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Body()
            );
            }
            else if (snapshot.data.length == 0) {
              return Center(
                  child: Text("No history",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,))
              );
            }
            else {
              return Container(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text
                          (snapshot.data[index]["groupName"]),

                        trailing: Text(DateFormat("dd-MM-yyyy | hh:mm:ss")
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                            snapshot.data[index]["time"] * 1000))
                            .toString()),
                      );
                    }),
              );
            }
          },
        ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                padding: EdgeInsets.all(32),
                onPressed: () async {
                           Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) => finallyScreen()));
                },
                child: Text(
                  "          Tracing          ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            
            // it will cover 2/3 of free spaces
          ],
        );
        }
      ),
    );
  }
}
