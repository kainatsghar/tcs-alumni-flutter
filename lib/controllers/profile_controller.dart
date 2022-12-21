import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  String? image;
  String? firstName;
  String? lastName;
  var notificationCount;

  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  void getInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    image = localStorage.getString('userImage');
    firstName = localStorage.getString('firstName');
    lastName = localStorage.getString('lastName');
    notificationCount = localStorage.getString('count') ?? '0';

    update();
  }

  updateImage(String userImage) {
    image = userImage;
    update();
  }

  void increment() async {
    notificationCount = notificationCount + 1;

    update();
  }

  void zeroCount() async {
    notificationCount = 0;

    update();
  }
}
