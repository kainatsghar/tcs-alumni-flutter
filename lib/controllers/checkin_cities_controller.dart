import 'dart:convert';

import 'package:get/get.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/search_city_entity.dart';

import '../models/error_entity.dart';

class CityController extends GetxController {
  List<City> cities = <City>[].obs;
  RxString selectedName = ''.obs;
  var cityId = ''.obs;
  RxBool loading = false.obs;

  void selectCity(name, id) {
    selectedName.value = name;
    cityId.value = id;
  }

  Future<void> getCities(cityName) async {
    loading.value = true;
    var response = await ApiCalls.searchCity(name: cityName);
    if (response is ErrorEntity) {
    } else {
      SearchCityEntity cityEntity =
          SearchCityEntity.fromJson(jsonEncode(response));
      if (cityEntity.success == 1) {
        cities.clear();
        for (var element in cityEntity.city!) {
          cities.add(
            City(
              name: element.cityName,
              id: element.cityId,
              countryId: element.countryId,
            ),
          );
          loading.value = false;
        }
      }
    }
  }
}

class City {
  String? name;
  int? id;
  int? countryId;
  City({
    this.id,
    this.name,
    this.countryId,
  });
}
