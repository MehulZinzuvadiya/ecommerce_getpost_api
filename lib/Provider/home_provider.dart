import 'package:ecommerce_getpost_api/Utils/api_helper.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List<dynamic> productList = [];

  Future<List<dynamic>> getProduct() async {
    ApiHelper apiHelper = ApiHelper();
    List<dynamic> productModel1 = await apiHelper.getProductApi();
    productList = productModel1;
    return productList;
  }

  Future<String> productPostdata(
      p_name, p_rate, p_offer, p_desc, p_cate, p_price) async {
    ApiHelper a1 = ApiHelper();
    var data = await a1.postProductApi(
        p_name, p_rate, p_offer, p_desc, p_cate, p_price);
    notifyListeners();
    if (data == null) {
      return "failed";
    }
    return "Success";
  }
}
