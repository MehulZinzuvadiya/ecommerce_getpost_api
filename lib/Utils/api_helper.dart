import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/product_model.dart';

class ApiHelper {
  Future<List<dynamic>> getProductApi() async {
    String apiLink =
        "https://apidatahub.000webhostapp.com/MyShop/API/products.php";
    Uri uri = Uri.parse(apiLink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);

    List<dynamic> productModel =
        json.map((e) => ProductModel().ProductFromJson(e)).toList();

    return productModel;
  }

  Future<String> postProductApi(String name,String rate,String price,String offer,String d1,String category)
  async {
    String postlink="https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";
    Uri url=Uri.parse(postlink);
    var response=await http.post(url,body: {
      "p_name":name,
      "p_rate":rate,
      "p_price":price,
      "p_offer":offer,
      "p_desc":d1,
      "p_category":category,
    });
    if(response.statusCode==200) {
      return "Success";
    } else {
      return "Failed";
    }
  }
}
