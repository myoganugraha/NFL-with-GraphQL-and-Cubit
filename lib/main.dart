import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nfl_with_graphql_and_cubit/cubit/player/player_cubit.dart';
import 'package:nfl_with_graphql_and_cubit/data/services/player_services.dart';
import 'package:nfl_with_graphql_and_cubit/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => PlayerCubit(PlayerServices(GraphQLClient(
                  cache: GraphQLCache(store: InMemoryStore()),
                  link: HttpLink(Platform.isIOS
                      ? 'http://localhost:4000/graphql'
                      : 'http://10.0.2.2:4000/graphql'),
                )))
                  ..getPlayerList()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
