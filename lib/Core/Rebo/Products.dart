import 'package:grocery_task/Core/APIs/ApiEndPoints.dart';
import 'package:grocery_task/Core/APIs/ApiServices.dart';
import 'package:grocery_task/Core/Models/ProductModel.dart';

class ProductsRebo{
  Future<List<ProductModel>> getAllProducts() async{
    var response = await ApipServices().get(ApiEndPoints().AllProducts);
    var ProductModelList = (response as List).map((Product) => ProductModel.fromJson(Product)).toList();
    return ProductModelList;
  }
}