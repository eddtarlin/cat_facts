import 'package:cat_fact/config/api_addresses.dart';
import 'package:cat_fact/data/data_import.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'network_service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET(ApiAddress.randomFact)
  Future<CatFact> getRandomCatFact();
}
