import 'dart:io';
import 'package:dio/dio.dart';

class ExceptionHandle {
  static const int success = 200;
  static const int unauthorized = 401;
  static const int notFound = 404;

  static const int netError = 1000;
  static const int parseError = 1001;
  static const int socketError = 1002;
  static const int httpError = 1003;
  static const int connectTimeoutError = 1004;
  static const int sendTimeoutError = 1005;
  static const int receiveTimeoutError = 1006;
  static const int cancelError = 1007;
  static const int unknownError = 9999;

  static final Map<int, NetError> ErrorMap = <int, NetError>{};

  static NetError handleException(dynamic error) {
    if (error is DioError) {
      if (error.type.errorCode == 0) {
        return _handleException(error.error);
      } else {
        return ErrorMap[error.type.errorCode]!;
      }
    } else {
      return _handleException(error);
    }
  }

  static NetError _handleException(dynamic error) {
    int errorCode = unknownError;
    if (error is SocketException) {
      errorCode = socketError;
    }
    if (error is HttpException) {
      errorCode = httpError;
    }
    if (error is FormatException) {
      errorCode = parseError;
    }
    return ErrorMap[errorCode]!;
  }
}

class NetError {
  NetError(this.code, this.msg);

  int code;
  String msg;
}

extension DioErrorTypeExtension on DioErrorType {
  int get errorCode => [
        ExceptionHandle.connectTimeoutError,
        ExceptionHandle.sendTimeoutError,
        ExceptionHandle.receiveTimeoutError,
        0,
        ExceptionHandle.cancelError,
        0,
      ][index];
}
