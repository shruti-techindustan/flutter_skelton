
import 'package:dio/dio.dart';
import 'package:flutter_demo_app/services/models/error_response/error_response.dart';
import 'package:flutter_demo_app/values/strings.dart';

class NetworkErrorHandler {
  static ErrorResponse handleError(var error) {
    if (error is DioError) {
      ErrorResponse errorResponse = new ErrorResponse();
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorResponse.message = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorResponse.message = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorResponse.message = Strings.CONNECTION_ERROR_MESSAGE;
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorResponse.message =
              "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorResponse = ErrorResponse.fromJson(error.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorResponse.message = "Timeout error.";
          break;
      }
      return errorResponse;
    } else if (error.toString().toLowerCase().contains("socketexception")) {
      return new ErrorResponse(
          message: Strings.CONNECTION_ERROR_MESSAGE,
          field: "ConnectionError",
          errorType: "ConnectionError",
          references: "");
    } else {
      return new ErrorResponse(
          message: Strings.SOMETHING_WENT_WRONG,
          field: "UnknownError",
          errorType: "UnknownError",
          references: "");
    }
  }
}
