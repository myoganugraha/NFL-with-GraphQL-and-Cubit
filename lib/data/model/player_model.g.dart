// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) {
  return PlayerModel(
    name: json['name'] as String,
    position: json['position'] as String,
    team: json['team'] as String,
    jerseyNumber: json['jerseyNumber'] as int,
  );
}

Map<String, dynamic> _$PlayerModelToJson(PlayerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'team': instance.team,
      'jerseyNumber': instance.jerseyNumber,
    };
