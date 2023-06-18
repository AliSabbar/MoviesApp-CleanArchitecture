import 'package:movie_app/tv/domain/entities/tv_creators.dart';

class TvCreatorsModel extends TvCreators {
  const TvCreatorsModel(
      {required super.id, required super.name, required super.image});
      
  factory TvCreatorsModel.fromJson(Map<String, dynamic> json) =>
      TvCreatorsModel(
          id: json['id'], name: json['name'], image: json['profile_path']);
}
