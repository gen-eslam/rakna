import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rakna/core/error/failure.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/networking/end_point/rakna_end_point.dart';
import 'package:rakna/features/auth/data/model/Auth_model.dart';
import 'package:rakna/features/auth/data/model/register_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, AuthModel>> login(
      {required String email, required String password});
  Future<Either<Failures, void>> verifyEmail({required String otp});
  Future<Either<Failures, AuthModel>> register(
      {required RegisterModel registerModel});
}

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failures, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      var result = await DioHelper.postData(
          url: RaknaEndPoints.login,
          data: AuthModel.logIn(email: email, password: password));
      return Right(AuthModel.fromJson(result.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(
        LocalFailures(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, AuthModel>> register(
      {required RegisterModel registerModel}) async {
    try {
      var result = await DioHelper.postData(
          url: RaknaEndPoints.singUp, data: registerModel.toJson());
      return Right(
        AuthModel.fromJson(result.data),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        LocalFailures(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> verifyEmail({required String otp}) async {
    try {
      var res = await DioHelper.getData(
          url: RaknaEndPoints.verifyEmail, queryParameters: {"otp": otp});
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
