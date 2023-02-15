
import 'package:covid_list/api/covid_api_provider.dart';
import 'package:covid_list/model/covid_model/covid_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}