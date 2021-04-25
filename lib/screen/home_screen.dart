import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HttpLink _httpLink = HttpLink(Platform.isIOS
      ? 'http://localhost:4000/graphql'
      : 'http://10.0.2.2:4000/graphql');

  ValueNotifier<GraphQLClient> _client;

  String readRepositories = """
  query  {
    players {
      name 
      position
      team
      jerseyNumber
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: _client,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter w/ GraphQL & BLoC',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SafeArea(
          child: Query(
            options: QueryOptions(document: gql(readRepositories)),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.isLoading) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (result.hasException) {
                return Container(
                  child: Center(
                    child: Text(result.exception.toString()),
                  ),
                );
              }

              if (result.data.isNotEmpty) {
                List data = result.data['players'];
                return ListView.separated(
                    itemBuilder: (_, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          title: Text(
                              '${data[index]['jerseyNumber']} - ${data[index]['name']}'),
                          subtitle: Text(
                              '${data[index]['team']} - ${data[index]['position']}'),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => Divider(),
                    itemCount: data.length);
              }

              return Container(
                child: Center(child: Text('ok')),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _client = ValueNotifier(
      GraphQLClient(
        link: _httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
}
