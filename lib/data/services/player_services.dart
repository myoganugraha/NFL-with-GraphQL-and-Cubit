import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nfl_with_graphql_and_cubit/data/model/player_model.dart';
import 'package:nfl_with_graphql_and_cubit/utils/graphql_query.dart';

class PlayerServices {
  PlayerServices(this._client);
  final GraphQLClient _client;

  Future<List<PlayerModel>> getPlayerList() async {
    try {
      final result = await _client.query(QueryOptions(
        document: gql(GraphQLQuery.readRepositories)
      ));
      if (result.data == null) return [];

      List availableData = result.data?['players'];
      return availableData.map((data) => PlayerModel.from(data)).toList();

    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }
}
