import 'package:food/data/api/api_client.dart';
import 'package:food/utils/constants/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{

final ApiClient apiClient;
PopularProductRepo({required this.apiClient});

Future<Response>getPopularProductList()async{

  return await apiClient.getData(AppConstants.PRODUCT_URI);

}


}