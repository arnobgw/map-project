import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:map_project/Models/finance.dart';

class FinanceProvider {
  String documentId;
//instance
  final CollectionReference financeCollection =
      Firestore.instance.collection('finance');
  FinanceProvider({this.documentId});
  //get document
  Future<Finance> get getDocument async {
    DocumentSnapshot snap = await financeCollection.document(documentId).get();
    return Finance.fromFirestore(snap);
  }

  //storing
  Future addDocument(Finance finance) async {
    final docRef = await financeCollection.add(finance.toFirestore);
    return docRef.documentID;
  }

  //updating
  Future setDocument(Finance finance) {
    return financeCollection.document(finance.id).setData(finance.toFirestore);
  }

  //delete doc
}
