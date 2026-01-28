import 'package:dio/dio.dart';
import 'package:grocery_task/Core/APIs/ApiEndPoints.dart';
class ApipServices{
  static final dio = Dio(BaseOptions(baseUrl: ApiEndPoints().BaseUrl));

  Future<dynamic> get(String endpoint)async{
    var response = await dio.get(ApiEndPoints().AllProducts);
    return response.data;
  }

}