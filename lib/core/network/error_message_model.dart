import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int state;
  final  error;
  final String message;

 const ErrorMessageModel({
    required this.state,
    required this.error,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      state: json["state"],
      error: json["errors"],
      message: json["message"],
    );
  }

  @override
  List<Object?> get props => [
        state,
        error,
        message,
      ];
}
