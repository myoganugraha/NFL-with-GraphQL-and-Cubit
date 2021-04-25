part of 'player_cubit.dart';

@immutable
abstract class PlayerState {
  const PlayerState();
}

class PlayerInitial extends PlayerState {}

class PlayerIsLoading extends PlayerState {
  const PlayerIsLoading();
}

class PlayerIsLoaded extends PlayerState {
  final List<PlayerModel> playerListData;
  const PlayerIsLoaded(this.playerListData);
}

class PlayerIsError extends PlayerState {
  final String message;
  const PlayerIsError(this.message);
}
