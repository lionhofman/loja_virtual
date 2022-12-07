import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/app/domain/entities/show_case.dart';

import 'package:loja_virtual/app/domain/usecases/home/get_showcase_use_case.dart';

class HomeController extends GetxController {
  GetShowcaseUseCase _getShowcaseUseCase;
  RxList<ShowCase?> _listShowCase = <ShowCase>[].obs;

  //Get
  List<ShowCase?> get listShowCase => _listShowCase;
  HomeController(
    this._getShowcaseUseCase,
  );

  @override
  void onInit() async {
    super.onInit();
    asyncInit();
  }

  void asyncInit() async {
    getShowCaseHome();
  }

  Future<void> getShowCaseHome() async {
    Either<Exception, List<ShowCase?>> showCaseHome =
        await _getShowcaseUseCase.call(page: "home");

    showCaseHome.fold((l) {
      print("Failure in the query to home showCase");
    }, (data) {
      _listShowCase.clear();
      _listShowCase = data.obs;
      // print("TOTAL DE ${_listShowCase.length}");
      // _showCase.value = data;
    });
  }
}
