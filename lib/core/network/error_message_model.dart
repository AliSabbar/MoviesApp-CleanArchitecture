// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String message;
  final bool success;
  const ErrorMessageModel({
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          statusCode: json['status_code'],
          message: json['status_message'],
          success: json['success']);

  @override
  List<Object> get props => [statusCode, message, success];
}
