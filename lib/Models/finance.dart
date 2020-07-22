import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Bill.dart';

class Finance {
  String ownerID;
  String id;
  int budget;
  List<Bill> bills = [];
  Finance({this.budget, this.bills, this.ownerID, this.id});
  get toFirestore {
    //func calc
    return {
      'ownerID': this.ownerID,
      'budget': this.budget,
      'bills': [...this.bills?.map((bill) => bill.toFirestore())] ?? [],
    };
  }

  Finance.fromFirestore(DocumentSnapshot snap)
      : this(
          id: snap.documentID,
          ownerID: snap.data['ownerID'],
          budget: snap.data['budget'],
          bills: Bill().fromFirestore(snap),
        );

  //from firestore
  //tofirestore
  //calculate
}
