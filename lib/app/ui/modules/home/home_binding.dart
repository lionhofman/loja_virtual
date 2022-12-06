import 'package:get/get.dart';
import 'package:loja_virtual/app/data/datasources/home_remote_data_source.dart';
import 'package:loja_virtual/app/data/repositories/home_repository_impl.dart';
import 'package:loja_virtual/app/domain/repositories/home_repository.dart';
import 'package:loja_virtual/app/domain/usecases/home/get_showcase_use_case.dart';
import 'package:loja_virtual/app/ui/modules/home/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
    Get.lazyPut<HomeRepository>(
        () => HomeRepositoryImpl(Get.find<HomeRemoteDataSource>()));
    Get.lazyPut(() => GetShowcaseUseCase(Get.find<HomeRepository>()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<GetShowcaseUseCase>()));
  }
}
