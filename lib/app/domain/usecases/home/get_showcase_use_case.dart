import 'package:dartz/dartz.dart';
import 'package:loja_virtual/app/domain/entities/show_case.dart';
import 'package:loja_virtual/app/domain/repositories/home_repository.dart';

class GetShowcaseUseCase {
  final HomeRepository _homeRepository;
  GetShowcaseUseCase(
    this._homeRepository,
  );

  Future<Either<Exception, List<ShowCase?>>> call(
      {required String page}) async {
    return await _homeRepository.getShowCase(page: page);
  }
}
