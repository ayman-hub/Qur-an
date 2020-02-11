import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshaf/feature/data/model/data_body_model.dart';
import 'package:moshaf/feature/data/model/data_model.dart';
import 'package:moshaf/feature/data/model/read_model.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:flutter/material.dart';

abstract class RemoteDataSource {
  // to get the query of the name
  /// throw exception [ServerException]
  Stream<List<DataModel>> getAllName();

  // to get the query of the name sorah
  /// throw exception [ServerException]
  Stream<List<DataBodyModel>> getAllSorah(String name);

  Future<List<ReadModel>> getAllPage();
}

class RemoteDataSourceImp extends RemoteDataSource {
  Firestore firestore;

  RemoteDataSourceImp({@required this.firestore});

  @override
  Stream<List<DataModel>> getAllName() {
    print('get  all name from remote source');
    List<DataModel> listDocuments = List<DataModel>();
    Stream<List<DataModel>> snapshot = firestore
        .collection(FIREBASE_COLLECITON)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      print("snapshot name length: ${snapshot.documents.length}");
      snapshot.documents.forEach((doc) {
        listDocuments.add(DataModel(
            name: doc[FIREBASE_NAME], imageurl: doc[FIREBASE_IMAGE_URL]));
      });
      return listDocuments;
    });
    return snapshot;
  }

  @override
  Stream<List<DataBodyModel>> getAllSorah(String name) {
    print('get into all sorah from remote data');
    List<DataBodyModel> listDocuments = List<DataBodyModel>();
    Stream<List<DataBodyModel>> snapshot =
        firestore.collection(name).snapshots().map((QuerySnapshot snapshot) {
      print("snapshot sorah length: ${snapshot.documents.length}");
      snapshot.documents.forEach((doc) {
        listDocuments.add(
            DataBodyModel(name: doc[FIREBASE_SORAH], url: doc[FIREBASE_URL]));
      });
      return listDocuments;
    });
    return snapshot;
  }

  @override
  Future<List<ReadModel>> getAllPage() async {
    List<ReadModel> listDocuments = List<ReadModel>();
    /*await firestore
        .collection(FIRESTORE_COLLECTION_PAGE)
        .getDocuments()
        .then((data) {
      data.documents.forEach((doc) {
        listDocuments.add(ReadModel.map(doc.data));
      });
    });*/
    return listDocuments;
  }
}
