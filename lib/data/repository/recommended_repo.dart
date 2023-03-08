import 'package:food/data/api/api_client.dart';
import 'package:food/utils/constants/app_constants.dart';
import 'package:get/get.dart';

class RecommendedRepo extends GetxService{

final ApiClient apiClient;
RecommendedRepo({required this.apiClient});

Future<Response>getRecommendedProductList()async{

  return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);

}


}