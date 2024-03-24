import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rakna/core/error/failure.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/networking/end_point/rakna_end_point.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/features/setting/data/model/driver_model.dart';

abstract class DriverRepo {
  DriverModel getDriverData();
  Future<Either<Failures, Map<String, dynamic>>> getDriverDataApi();
}

class DriverRepoImpl implements DriverRepo {
  @override
  DriverModel getDriverData() {
    return DriverModel.getDriver(
        token: CacheService.getDataString(key: Keys.token)!);
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> getDriverDataApi() async {
    var result = await DioHelper.getData(
      url: RaknaEndPoints.getDriverProfile,
      token: CacheService.getDataString(key: Keys.token),
    );
    print(result);
    return const Right({});
  }
}
