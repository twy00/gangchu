import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SummaryList extends StatefulWidget {
  final vid;
  const SummaryList({this.vid});

  @override
  _SummaryListState createState() => _SummaryListState();
}
class _SummaryListState extends State<SummaryList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("video").snapshots(),
      builder: (context, snapshot) {
        List<QueryDocumentSnapshot> l = snapshot.data.docs;
        var idx = l.indexWhere((element) => element.data()["id"]==widget.vid);
        var summaryitems = snapshot.data.docs[idx].data()["summary"].toList();
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: summaryitems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Text("${summaryitems[index]['timestamp']}", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3)),
                  Text(" : "),
                  Text("...${summaryitems[index]['text']}...")

                ],
              ),
            );
            },
          );

      },
    );
  }
}