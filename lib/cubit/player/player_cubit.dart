import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nfl_with_graphql_and_cubit/data/model/player_model.dart';
import 'package:nfl_with_graphql_and_cubit/data/services/player_services.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit(this._playerServices) : super(PlayerInitial());
  final PlayerServices _playerServices;

  Future<void> getPlayerList() async {
    try {
      emit(PlayerIsLoading());
      final playerListData = await _playerServices.getPlayerList();
      Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

        emit(PlayerIsLoaded(playerListData));
      });
    } catch (error) {
      print(error.toString());
      emit(PlayerIsError(error.toString()));
    }
  }
}
