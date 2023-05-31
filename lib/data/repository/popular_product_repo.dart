
import 'package:get/get.dart';

import '../../utils/constants/app_constants.dart';
import '../api/api_client.dart';

class PopularProductRepo extends GetxService{

final ApiClient apiClient;
PopularProductRepo({required this.apiClient});

Future<Response>getPopularProductList()async{

  return await apiClient.getData(AppConstants.PRODUCT_URI);

}


}