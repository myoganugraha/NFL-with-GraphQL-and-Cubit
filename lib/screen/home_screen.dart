import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfl_with_graphql_and_cubit/cubit/player/player_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter w/ GraphQL & Cubit',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(child: BlocBuilder<PlayerCubit, PlayerState>(
        builder: (_, state) {
          if (state is PlayerIsError) {
            return Container(
              child: Center(
                child: Text(state.message),
              ),
            );
          } else if (state is PlayerIsLoaded) {
            return ListView.separated(
                itemBuilder: (_, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      title: Text(
                          '${state.playerListData[index].jerseyNumber} - ${state.playerListData[index].name}'),
                      subtitle: Text(
                          '${state.playerListData[index].team} - ${state.playerListData[index].position}'),
                    ),
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: state.playerListData.length);
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      )),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
