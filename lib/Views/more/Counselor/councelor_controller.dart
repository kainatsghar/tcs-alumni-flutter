import 'package:get/get.dart';
import 'package:iobm/networkcalls/api_config.dart';
import 'package:iobm/models/error_entity.dart';
import 'councelor_model.dart';

class CouncelorController extends GetxController {
  RxList<Counselor> councelorList = <Counselor>[].obs;
  RxList<Counselor> filteredList = <Counselor>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCouncelorList();
  }

  Future<void> getCouncelorList() async {
    isLoading.value = true;
    try {
      final response = await NetworkCalls.getWebCall('api/get_counselors');
      print('>>>>>>>>>>>>>>>>>>>> $response');

      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          var list = response['data'] as List;
          councelorList.value = list.map((e) => Counselor.fromJson(e)).toList();
          filteredList.value = councelorList;
        } else {
          print("API Error: ${response['message']}");
        }
      } else if (response is ErrorEntity) {
        print("Network/Server Error: ${response.message}");
      }
    } catch (e) {
      print("Exception fetching counselors: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void searchCounselor(String query) {
    if (query.isEmpty) {
      filteredList.value = councelorList;
    } else {
      filteredList.value = councelorList
          .where((c) =>
              c.name.toLowerCase().contains(query.toLowerCase()) ||
              c.specialty.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
