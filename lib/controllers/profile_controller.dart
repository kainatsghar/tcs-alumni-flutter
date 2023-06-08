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

  updateFirebaseCount() async{
    List<int> totalCounts = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('messageKeys')
        .doc('keys')
        .collection(AppConstants.myId)
        .orderBy('time', descending: true)
        .get();

    for(int i=0; i<querySnapshot.docs.length; i++){
      totalCounts.add(int.parse(querySnapshot.docs[i]['readStatus']));
    }
    totalCounts = totalCounts.toSet().toList();
    preferencesFromMain.setString("firebaseCount", totalCounts.reduce((value, element) => value + element).toString());
    getInfo();
    print("snapshot= ${firebaseNotificationCount}");
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
