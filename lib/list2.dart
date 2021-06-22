import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'video_main.dart';
import "dart:math";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Hlist2 extends StatefulWidget {
  final page;
  final i;
  const Hlist2({this.page, this.i});

  @override
  _Hlist2State createState() => _Hlist2State();
}

class _Hlist2State extends State<Hlist2> {
  final route = {0:"view", 1:"like", 2:"date"};
  final t = {0: "Recommendation by View Count", 1: "Recommendation by Like Count", 2:"Recently Uploaded Videos"};
  var imageheight = 120.0;
  @override
  Widget build(BuildContext context) {
    var randnum = Random().nextInt(9);
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("video").snapshots(),
      builder: (context, videosnapshot) {
        List<QueryDocumentSnapshot> l = videosnapshot.data.docs;
        var cat = videosnapshot.data.docs[l.indexWhere((element) => element.data()["id"] == widget.i)].data()["category"];

        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("recommendation").snapshots(),
          builder: (context, snapshot){
            List<QueryDocumentSnapshot> recl = snapshot.data.docs;
            var idx = recl.indexWhere((element) => element.data()["id"] == route[widget.page]);
            var item = snapshot.data.docs[idx].data()[cat]["rec$randnum"];
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection("user").snapshots(),
              builder: (context, snapshot){
                List<QueryDocumentSnapshot> userl = snapshot.data.docs;
                var uidx = userl.indexWhere((element) => element.data()["id"]=="user1");
                var likehistory = snapshot.data.docs[uidx].data()["likehistory"];
                var viewhistory = snapshot.data.docs[uidx].data()["viewhistory"];
                CollectionReference users = FirebaseFirestore.instance.collection("user");
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(child:Text("$cat : ${t[widget.page]}", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),margin: EdgeInsets.only(left:10, top: 15.0, bottom:5, right:10)),
                      SizedBox(
                        height: 250,
                        width: 2500,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            var viditem = videosnapshot.data.docs[l.indexWhere((e) => e.data()["id"] == item[index])].data();
                            return Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [

                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: GestureDetector(
                                          child: Image.network(viditem["thumbnails"]),
                                          onTap: () {
                                            viewhistory.add(viditem["id"]);
                                            var newviewhistory = viewhistory.toSet().toList();
                                            users.doc("user1").update({
                                              "id": "user1",
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
                                      )
                                    ],
                                  ),
                                ],
                              ),

                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );

              Text("$item");
          },
        );
      },
    );
      Text("${widget.i}");
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