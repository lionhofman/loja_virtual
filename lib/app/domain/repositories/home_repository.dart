import 'package:dartz/dartz.dart';
import 'package:loja_virtual/app/domain/entities/show_case.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<ShowCase?>>> getShowCase({
    required String page,
    String? orderBy,
  });
}
