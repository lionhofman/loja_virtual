import 'package:dartz/dartz.dart';

import 'package:loja_virtual/app/data/datasources/home_remote_data_source.dart';
import 'package:loja_virtual/app/domain/entities/show_case.dart';
import 'package:loja_virtual/app/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepositoryImpl(
    this._homeRemoteDataSource,
  );

  @override
  Future<Either<Exception, List<ShowCase?>>> getShowCase(
      {required String page, String? orderBy}) async {
    try {
      var homeShowCase = await _homeRemoteDataSource.getShowCase(
        page: page,
      );
      return Right(homeShowCase);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
