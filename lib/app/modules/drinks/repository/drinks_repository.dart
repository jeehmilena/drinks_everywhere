import 'package:drinks_everywhere/app/data/rest_client.dart';

class DrinksRepository {
  final RestClient api;

  DrinksRepository(this.api);

  Future<dynamic> getRandomDrinks() async {
    return api.getRandomDrink();
  }
}
