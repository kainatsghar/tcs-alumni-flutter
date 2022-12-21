import 'dart:convert';

import 'package:get/get.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/feelings_entity.dart';

class FeelingController extends GetxController {
  late List<FeelModel> feelings = <FeelModel>[].obs;
  var feelingName = ''.obs;
  var feelingIcon = ''.obs;
  var feelingId = ''.obs;

  Future<void> getFeelings() async {
    var response = await ApiCalls.getFeelings();
    if (response is ErrorEntity) {
    } else {
      FeelingsEntity feelingsEntity =
          FeelingsEntity.fromJson(jsonEncode(response));
      if (feelingsEntity.success == 1) {
        feelings.clear();
        for (var element in feelingsEntity.result!) {
          feelings.add(
            FeelModel(
              id: element.id,
              feeling: element.feelingName,
              emoji: element.feelingIcon,
            ),
          );
        }
      }
    }
  }

  void selectFeeling(name, icon, id) {
    feelingName.value = name;
    feelingIcon.value = icon;
    feelingId.value = id;
  }
}

class FeelModel {
  int? id;
  String? feeling;
  String? emoji;
  FeelModel({
    this.id,
    this.emoji,
    this.feeling,
  });
}
