import 'package:cat_fact/config/api_addresses.dart';
import 'package:cat_fact/data/data_import.dart';
import 'package:flutter/material.dart';

class FactsRepository {
  final RestClient _restClient;
  FactsRepository({required RestClient restClient}) : _restClient = restClient;

  Future<CatFact> getRandomCatFact() async {
    return await _restClient.getRandomCatFact();
  }

  String getRandomCatImage() {
    return ApiAddress.randomCatImage;
  }
}
