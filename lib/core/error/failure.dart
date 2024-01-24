import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class LocalFailures extends Failures {
  LocalFailures(String errorMessage) : super(errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(String errorMessage) : super(errorMessage);

  factory ServerFailure.fromDioError(DioException dioExceptionErrorType) {
    switch (dioExceptionErrorType.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection TimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send Timeout");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExceptionErrorType.response!.statusCode!,
            dioExceptionErrorType.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled ");
      case DioExceptionType.unknown:
        if (dioExceptionErrorType.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        } else {
          return ServerFailure("UnExpected Error , Please try again");
        }
      default:
        return ServerFailure("Oops UnExpected Error ");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure("Bad Request: ${response["error"]["message"]}");
      case 401:
        return ServerFailure("Unauthorized: ${response["error"]["message"]}");
      case 402:
        return ServerFailure(
            "Payment Required: Payment is required to access this resource.");
      case 403:
        return ServerFailure("Forbidden: ${response["error"]["message"]}");
      case 404:
        return ServerFailure("Not Found: Your request was not found.");
      case 405:
        return ServerFailure(
            "Method Not Allowed: This HTTP method is not supported for this resource.");
      case 406:
        return ServerFailure(
            "Not Acceptable: The requested resource cannot produce the content in the format specified.");
      case 407:
        return ServerFailure(
            "Proxy Authentication Required: You must authenticate with the proxy server.");
      case 408:
        return ServerFailure(
            "Request Timeout: The server timed out waiting for the request.");
      case 409:
        return ServerFailure(
            "Conflict: There was a conflict with the current state of the resource.");
      case 410:
        return ServerFailure(
            "Gone: The requested resource is no longer available.");
      case 411:
        return ServerFailure(
            "Length Required: The 'Content-Length' header is missing or invalid.");
      case 412:
        return ServerFailure(
            "Precondition Failed: The server does not meet one of the preconditions specified in the request.");
      case 413:
        return ServerFailure(
            "Payload Too Large: The request payload exceeds the server's limits.");
      case 414:
        return ServerFailure(
            "URI Too Long: The request URI exceeds the server's limits.");
      case 415:
        return ServerFailure(
            "Unsupported Media Type: The media type of the request is not supported.");
      case 416:
        return ServerFailure(
            "Range Not Satisfiable: The requested range is not satisfiable.");
      case 417:
        return ServerFailure(
            "Expectation Failed: The server cannot meet the requirements of the 'Expect' header.");
      case 418:
        return ServerFailure("I'm a Teapot: This request cannot be handled.");
      case 421:
        return ServerFailure(
            "Misdirected Request: The request was directed at a server that is not able to produce a response.");
      case 422:
        return ServerFailure(
            "Unprocessable Entity: The server understands the content type but cannot process the request.");
      case 423:
        return ServerFailure(
            "Locked: The resource is locked and cannot be accessed.");
      case 424:
        return ServerFailure(
            "Failed Dependency: The request failed due to a failed dependency.");
      case 425:
        return ServerFailure(
            "Unordered Collection: The server is unable to respond to the request.");
      case 426:
        return ServerFailure(
            "Upgrade Required: The client must upgrade to a newer protocol.");
      case 428:
        return ServerFailure(
            "Precondition Required: The server requires the request to be conditional.");
      case 429:
        return ServerFailure(
            "Too Many Requests: Please slow down and try again later.");
      case 431:
        return ServerFailure(
            "Request Header Fields Too Large: The request headers are too large.");
      case 451:
        return ServerFailure(
            "Unavailable For Legal Reasons: Access to this resource is denied for legal reasons.");
      case 500:
        return ServerFailure("Internal Server Error: Please try again later.");
      case 501:
        return ServerFailure(
            "Not Implemented: The server does not support the functionality required to fulfill the request.");
      case 502:
        return ServerFailure(
            "Bad Gateway: The server received an invalid response from the upstream server.");
      case 503:
        return ServerFailure("Service Unavailable: Please try again later.");
      case 504:
        return ServerFailure("Gateway Timeout: Please try again later.");
      case 505:
        return ServerFailure(
            "HTTP Version Not Supported: The server does not support the HTTP protocol version.");
      case 506:
        return ServerFailure(
            "Variant Also Negotiates: The server has an internal configuration error.");
      case 507:
        return ServerFailure(
            "Insufficient Storage: The server is unable to store the representation needed to complete the request.");
      case 508:
        return ServerFailure(
            "Loop Detected: The server detected an infinite loop while processing the request.");
      case 510:
        return ServerFailure(
            "Not Extended: Further extensions to the request are required.");
      case 511:
        return ServerFailure(
            "Network Authentication Required: The client must authenticate with the network before accessing the resource.");
      default:
        return ServerFailure("An unknown error occurred: Please try again.");
    }
  }
}
