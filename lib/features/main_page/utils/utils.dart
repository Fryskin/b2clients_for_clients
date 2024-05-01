import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  // CRUD FOR ORDERS
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  // personal orders document IDs
  List<String> documentIDs = [];

  // get personal orders document IDs
  Future getDocumentIDs(String userUID) async {
    await orders
        .where('uid', isEqualTo: userUID)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              documentIDs.add(document.reference.id);
            }));
  }
}
