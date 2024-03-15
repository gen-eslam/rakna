import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rakna/core/error/failure.dart';
import 'package:rakna/core/networking/end_point/payment_end_points.dart';
import 'package:rakna/core/networking/payment_aPi_helper.dart';
import 'package:rakna/features/payment/data/model/authentication_request_model.dart';
import 'package:rakna/features/payment/data/model/order_registration_model.dart';
import 'package:rakna/features/payment/data/model/payment_reqeust_model.dart';

abstract class PaymentRepo {
  Future<Either<Failures, PaymentRequestModel>> paymentRequest({
    required int price,
    required String orderId,
    required String token,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  });
  Future<Either<Failures, AuthenticationRequestModel>> authenticationRequest();
  Future<Either<Failures, OrderRegistrationModel>> orderRegistration(
      {required int price, required String token});
}

class PaymentRepoImpl implements PaymentRepo {
  @override
  Future<Either<Failures, AuthenticationRequestModel>>
      authenticationRequest() async {
    try {
      var result = await PaymentApiHelper.postData(
        url: PaymentEndPoints.authenticationRequest,
        data: AuthenticationRequestModel.sendBody(),
      );

      return Right(AuthenticationRequestModel.fromJson(result.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(LocalFailures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, OrderRegistrationModel>> orderRegistration({
    required int price,
    required String token,
  }) async {
    try {
      var result = await PaymentApiHelper.postData(
        url: PaymentEndPoints.orderRegistration,
        data: OrderRegistrationModel.sendBody(
          price: price,
          token: token,
        ),
      );

      return Right(OrderRegistrationModel.fromJson(result.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(LocalFailures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, PaymentRequestModel>> paymentRequest({
    required int price,
    required String orderId,
    required String token,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    try {
      var result = await PaymentApiHelper.postData(
        url: PaymentEndPoints.paymentKeyRquest,
        data: PaymentRequestModel.sendBody(
          email: email,
          price: price,
          orderId: orderId,
          token: token,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
        ),
      );

      return Right(PaymentRequestModel.fromJson(result.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(LocalFailures(errorMessage: error.toString()));
    }
  }
}
