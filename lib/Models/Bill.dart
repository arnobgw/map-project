import 'package:cloud_firestore/cloud_firestore.dart';

class Bill {
  String name;
  int amount;
  Bill([this.amount, this.name]);
  Bill.fromFirestore(Map<dynamic, dynamic> map)
      : this(
          map['amount'],
          map['name'],
        );

  toFirestore() {
    return {'name': this.name, 'amount': this.amount};
  }

  fromFirestore(DocumentSnapshot snap) {
    if (snap.data['bills'] != null) {
      List<Bill> bills = List.from(snap.data['bills']).map((map) {
        Bill.fromFirestore(map);
      }).toList();
      return bills;
    }
    return null;
  }
}
