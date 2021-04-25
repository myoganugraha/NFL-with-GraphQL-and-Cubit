mixin GraphQLQuery {
  static String readRepositories = """
  query  {
    players {
      name 
      position
      team
      jerseyNumber
    }
  }
  """;
}
