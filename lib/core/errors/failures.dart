import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please Try later!');
      default:
        return ServerFailure('Oops! Something went wrong... :(');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try again later');
    } else {
      return ServerFailure('Oops! Something went wrong... :(');
    }
  }
}
