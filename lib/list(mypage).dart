import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'video_main.dart';

class Mlist extends StatefulWidget {
  final theme;
  const Mlist({Key key, this.theme}) : super(key: key);
  @override
  _MlistState createState() => _MlistState();
}

class _MlistState extends State<Mlist> {
  final imageheight = 120.0;
  final imagewidth = 180.0;
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("user").snapshots(),
      builder: (context, snapshot) {
        List<QueryDocumentSnapshot> l = snapshot.data.docs;
        var idx = l.indexWhere((element) => element.data()["id"]=="user1");
        var items = snapshot.data.docs[idx].data()[widget.theme].reversed.toList();
        print("$items");

        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("video").snapshots(),
          builder: (context, snapshot) {
            // List<QueryDocumentSnapshot> vidl = snapshot.data.docs.reversed.toList();
            List<QueryDocumentSnapshot> vidl = snapshot.data.docs;
            var viditem = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[0])].data();
            var viditem1 = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[1])].data();
            var viditem2 = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[2])].data();
            var viditem3 = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[3])].data();
            var viditem4 = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[4])].data();
            var viditem5 = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[5])].data();
            var viditem6 = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == items[6])].data();
            print("${viditem["id"]}");
            return Container( //영상 리스트 container
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 600.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem["thumbnails"])
                      ),
                          SizedBox(
                            width: 200,
                            child: Text(viditem["title"]),
                          ),

                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem1["thumbnails"])
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(viditem1["title"]),
                      ),

                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem2["thumbnails"])
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(viditem2["title"]),
                      ),

                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem3["thumbnails"])
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(viditem3["title"]),
                      ),

                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem4["thumbnails"])
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(viditem4["title"]),
                      ),

                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem5["thumbnails"])
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(viditem5["title"]),
                      ),

                    ],
                  ),

                  SizedBox(
                    height:20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: imagewidth, height: imageheight, color: Colors.white,
                          child: Image.network(viditem6["thumbnails"])
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(viditem6["title"]),
                      ),

                    ],
                  ),
                ],
              ),

            );

        },
        );
      },
    );


  }
}