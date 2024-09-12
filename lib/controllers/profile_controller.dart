import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:iobm/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

class ProfileController extends GetxController {
  String? image;
  String? firstName;
  String? lastName;
  int? notificationCount;
  late int firebaseNotificationCount;

  @override
  void onInit() {
    getInfo();
    firebaseNotificationCount = 0;
    super.onInit();
  }

  void getInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    image = localStorage.getString('userImage');
    firstName = localStorage.getString('firstName');
    lastName = localStorage.getString('lastName');
    notificationCount = int.parse(localStorage.getString('count')??"0");
    firebaseNotificationCount = int.parse(localStorage.getString("firebaseCount")??"0");
    print("CheckCounter $notificationCount");
    update();
  }

  updateFirebaseCount() async {
    List<int> totalCounts = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('messageKeys')
          .doc('keys')
          .collection(AppConstants.myId)
          .orderBy('time', descending: true)
          .get();

      for (int i = 0; i < querySnapshot.docs.length; i++) {
        totalCounts.add(int.parse(querySnapshot.docs[i]['readStatus']));
      }

      // Remove duplicates
      totalCounts = totalCounts.toSet().toList();

      if (totalCounts.isNotEmpty) {
        // Sum up the counts and save it to preferences
        preferencesFromMain.setString("firebaseCount", totalCounts.reduce((value, element) => value + element).toString());
      } else {
        // Handle the case when totalCounts is empty
        preferencesFromMain.setString("firebaseCount", "0");
      }

      getInfo();
      print("snapshot= $firebaseNotificationCount");

    } catch (e) {
      print("Error occurred: $e");
    }
  }


  updateImage(String userImage) {
    image = userImage;
    update();
  }

  void increment() async {
    notificationCount = notificationCount! + 1;
    update();
  }

  void zeroCount() async {
    notificationCount = 0;

    update();
  }

}
