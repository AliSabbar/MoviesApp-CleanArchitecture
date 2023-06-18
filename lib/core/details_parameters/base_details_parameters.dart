import 'package:equatable/equatable.dart';

class BaseDetailsParameters extends Equatable {
  final int id;
  const BaseDetailsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}