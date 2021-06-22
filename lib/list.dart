import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'video_main.dart';
import "dart:math";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Hlist extends StatefulWidget {
  final page;
  final i;
  const Hlist({this.page, this.i});
  @override
  _HlistState createState() => _HlistState();
}

class _HlistState extends State<Hlist> {
  final imageheight = 120.0;
  var router = {0: ["byhistory","bythumbnail", "bytitle"], 1:[0,1,2]};
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("user").snapshots(),
      builder: (context, snapshot) {
        List<QueryDocumentSnapshot> l = snapshot.data.docs.reversed.toList();
        var idx = l.indexWhere((element) => element.data()["id"] == "user1");
        var items = snapshot.data.docs[idx].data()["viewhistory"];
        var likehistory = snapshot.data.docs[idx].data()["likehistory"];
        var lastitem = items.last;
        var catlist = [];
        CollectionReference users = FirebaseFirestore.instance.collection("user");
        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("video2").snapshots(),
          builder: (context, snapshot) {
            List<QueryDocumentSnapshot> vidl = snapshot.data.docs.reversed.toList();
            var lastitemdata = snapshot.data.docs[vidl.indexWhere((e) => e.data()["id"] == lastitem)].data();
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 250,
                    width: 2500,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index){
                        print("${lastitemdata["recommendation"]['${widget.i}']}");
                        var vid = lastitemdata["recommendation"]['${widget.i}'][index];
                        var viditem = snapshot.data.docs[vidl.indexWhere((element) => element.data()["id"] == vid)];
                        return Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 200,
                                child: GestureDetector(
                                  child: Image.network(viditem["thumbnails"]),
                                  onTap: () {
                                    items.add(viditem["id"]);
                                    var newviewhistory = items.toSet().toList();
                                    users.doc("user1").update({
                                      "id":"user1",
                                      "likehistory": likehistory,
                                      "viewhistory": newviewhistory
                                    });
                                    print("$newviewhistory");
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => VideoMain(vid: viditem["id"]),
                                    )
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top:10, bottom: 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(viditem["title"]),
                                ),
                              ),
                            ],
                          )
                        );

                          Text("${lastitemdata["recommendation"]['${widget.i}'][index]}  ");
                      },
                    ),
                  )
                ],
              ),
            );

          },
        );
      },
    );
      Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 180.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.red,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => VideoMain(vid:"0N_vjYKtx88"),

                        )
                        );
                      }
                  )
              ),
              Text("title1", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],

          ),
          Column(
              children: <Widget>[
                Container(width: 240.0, height: imageheight, color: Colors.blue,),
                Text("title2", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
                Text("Channel, View, Dates"),
              ]
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.green,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.yellow,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.purple,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.orange,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.pink,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.lightBlueAccent,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.green,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),
          Column(
            children: <Widget>[
              Container(width: 240.0, height: imageheight, color: Colors.lightGreenAccent,),
              Text("title3", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0), ),
              Text("Channel, View, Dates"),
            ],
          ),


        ],
      ),

    );
  }
}