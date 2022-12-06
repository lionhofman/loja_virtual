import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:loja_virtual/app/data/models/show_case_response.dart';
import 'package:loja_virtual/app/domain/entities/show_case.dart';

abstract class HomeRemoteDataSource {
  Future<List<ShowCase?>> getShowCase({
    required String page,
    String? orderBy,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<ShowCase?>> getShowCase({required String page, String? orderBy}) {
    return handleShowCaseRequests(page: page);
  }

  //Reference
//https://firebase.google.com/docs/firestore/query-data/get-data#dart
//https://firebase.google.com/docs/firestore/query-data/queries#collection-group-query
  Future<List<ShowCase?>> handleShowCaseRequests({required String page}) async {
    CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection(page);
    List<ShowCase?> showCaseList = [];

    await collection.get().then((value) {
      for (var doc in value.docs) {
        showCaseList.add(ShowCaseResponse.fromFirestone(doc.data()));
      }
    });
    return showCaseList;
  }
}
