import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "position")
  final String position;
  @JsonKey(name: "team")
  final String team;
  @JsonKey(name: "jerseyNumber")
  final int jerseyNumber;

  PlayerModel(
      {this.name = "",
      this.position = "",
      this.team = "",
      this.jerseyNumber = 0});

  factory PlayerModel.from(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);

  @override
  List<Object> get props => [name, position, team, jerseyNumber];
}
