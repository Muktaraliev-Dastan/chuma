///фреймворк
import 'dart:async';

///дата-провайдер
import 'package:chum2/src/common/data/data_providers/chum_server_api_client.dart';

///модели
import 'package:chum2/src/common/models/models.dart';

///репозиторий загрузки продуктов
class ProductRepository {
  ProductRepository({ChumServerApiClient? chumServerApiClient})
      : _chumServerApiClient = chumServerApiClient ?? ChumServerApiClient();

  final ChumServerApiClient _chumServerApiClient;

  Future<List<Product>> fetchMainPageProducts() async {
    final result = await _chumServerApiClient.fetchMainPageProducts();
    return result;
  }
}
