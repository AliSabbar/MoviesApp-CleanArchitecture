// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({
    required this.errorMessageModel,
  });
}

class InternetException implements Exception {
  final String message;
  InternetException({
    required this.message,
  });
  
}
