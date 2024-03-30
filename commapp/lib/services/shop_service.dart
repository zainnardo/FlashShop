import 'package:commapp/core/constants/api_constants.dart';
import 'package:commapp/core/constants/enums/request_type.dart';
import 'package:commapp/core/utils/network/network_manager.dart';
import 'package:commapp/models/product_model.dart';

class ShopService {
  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<List<ProductModel>?> fetchAllProducts(
      {Map<String, dynamic>? params}) async {
    return await _networkManager!.request(
      method: ReqTypes.get,
      path: ApiConstants.products,
      model: ProductModel(),
      queryParameters: params,
    );
  }
}