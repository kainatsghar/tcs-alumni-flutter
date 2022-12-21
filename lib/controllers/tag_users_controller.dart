import 'package:get/get.dart';
import 'package:iobm/local_db/local_db.dart';

class TagController extends GetxController {
  List<DBAllUser> tagList = <DBAllUser>[].obs;

  addUser(allUser) {
    tagList.add(allUser);
  }

  remove(allUser) {
    tagList.remove(allUser);
  }
}
