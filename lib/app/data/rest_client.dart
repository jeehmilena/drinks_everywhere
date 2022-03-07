import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('random.php')
  Future<dynamic> getRandomDrink();
}
