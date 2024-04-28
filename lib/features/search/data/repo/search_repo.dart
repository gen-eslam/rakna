import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rakna/core/error/failure.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/networking/end_point/rakna_end_point.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/features/search/data/model/city_garage_model.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<CityGarageModel>>> getCitys();
  Future<Either<Failures, List<GarageModel>>> getGaragesInCity(
      {required String city});
}

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failures, List<CityGarageModel>>> getCitys() async {
    try {
      var result = await DioHelper.getData(
          url: RaknaEndPoints.citys,
          token: CacheService.getDataString(key: Keys.token));

      return Right((result.data)
          .map((e) => CityGarageModel.fromJson(e))
          .cast<CityGarageModel>()
          .toList());
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(LocalFailures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, List<GarageModel>>> getGaragesInCity(
      {required String city}) async {
    try {
      var result = await DioHelper.getData(
        token: CacheService.getDataString(key: Keys.token),
        url: RaknaEndPoints.garagesInCity,
        queryParameters: {"City": city},
      );
      return Right((result.data)
          .map((e) => GarageModel.fromJson(e))
          .cast<GarageModel>()
          .toList());
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(LocalFailures(errorMessage: error.toString()));
    }
  }
}
