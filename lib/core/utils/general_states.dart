import '../../movies/domain/entities/movie.dart';
import 'enums.dart';

class GeneralStates {
  final String message;
  final dynamic data;
  final RequestStates requestStates;
  GeneralStates({
    this.message = '',
    this.data = const [],
    this.requestStates = RequestStates.loading,
  });
}
