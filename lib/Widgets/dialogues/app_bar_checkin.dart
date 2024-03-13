import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/cities_entity.dart';
import 'package:iobm/networkcalls/response_models/edit_city_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/text_styles.dart';
import '../widget_styles.dart';

class CheckInDialog extends StatefulWidget {
  const CheckInDialog({Key? key}) : super(key: key);

  @override
  State<CheckInDialog> createState() => _CheckInDialogState();
}

class _CheckInDialogState extends State<CheckInDialog> {
  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  late List<DBCitie> _cities;

  late Future _fetchData;

  late List<DBCountrie> _countries;

  String selectedCityId = "";
  String? currentCityName;

  @override
  void initState() {
    _cities = [];
    _countries = [];
    _countryController.text = 'Pakistan';
    _fetchData = getCity();

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(currentCityName);
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 16,
        child: FutureBuilder(
          future: _fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _bodyColumn();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _bodyColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dialogueTitleBar(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration:  BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _country(),
                  SizedBox(
                    width: 10.w,
                  ),
                  _city(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 10.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side:  BorderSide(
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(70.w, 20.h)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        Strings.cancel,
                        style: CustomTextStyles.text12RegularW400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(horizontal: 10.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side:  BorderSide(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(70.w, 20.h))),
                      onPressed: () {
                        if (selectedCityId != "") {
                          updateCity();
                        } else
                          print('empty cityID');
                      },
                      child: Text(
                        'Check In',
                        style: CustomTextStyles.text12RegularW400,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _dialogueTitleBar() {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          'Enter Country and City',
          style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.white,),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _country() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Country*',
            // filterTextstyle()
            style: CustomTextStyles.text14SemiBoldW600,
          ),
          TypeAheadFormField<DBCountrie>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _countryController,
              style: CustomTextStyles.text12RegularW400,
              textCapitalization: TextCapitalization.sentences,
              decoration: WidgetStyle.secNameTextFieldDecoration(hint: ""),
            ),
            suggestionsCallback: (pattern) async {
              return _countries
                  .where(
                    (item) => item.countryName!.toLowerCase().startsWith(
                          pattern.toLowerCase(),
                        ),
                  )
                  .toList();
            },
            transitionBuilder: (context, child, controller) {
              return child;
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(
                  suggestion.countryName ?? '',
                  style: CustomTextStyles.text12RegularW400,
                ),
                dense: true,
              );
            },
            getImmediateSuggestions: false,
            onSuggestionSelected: (suggestion) {
              _countryController.text = suggestion.countryName ?? '';
              getCities(suggestion.countryId);
              // setState(() {
              //   //selectedCountryId = suggestion.countryId ?? '';
              // });
            },
          ),
        ],
      ),
    );
  }

  Widget _city() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City*',
            style: CustomTextStyles.text14SemiBoldW600,
          ),
          TypeAheadFormField<DBCitie>(
            textFieldConfiguration: TextFieldConfiguration(
              textCapitalization: TextCapitalization.sentences,
              controller: _cityController,
              style: CustomTextStyles.text12RegularW400,
              decoration: WidgetStyle.secNameTextFieldDecoration(hint: ""),
            ),
            suggestionsCallback: (pattern) async {
              return _cities
                  .where(
                    (item) => item.cityName!.toLowerCase().startsWith(
                          pattern.toLowerCase(),
                        ),
                  )
                  .toList();
            },
            transitionBuilder: (context, child, controller) {
              return child;
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(
                  suggestion.cityName ?? '',
                  style: CustomTextStyles.text12RegularW400,
                ),
                dense: true,
              );
            },
            getImmediateSuggestions: false,
            onSuggestionSelected: (suggestion) {
              _cityController.text = suggestion.cityName ?? '';
              setState(() {
                selectedCityId = suggestion.cityId ?? "";
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> getCity() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    currentCityName = localStorage.getString('currentCity');
    _cityController.text = currentCityName ?? '';
  }

  Future<void> getData() async {
    _countries = await database.getAllCountries();
    print("_countries=${_countries}");
    var country =
        _countries.where((element) => element.countryName == 'Pakistan');
    String? id = country.first.countryId;
    selectedCityId = id ?? '';
    await getCities(id);
  }

  Future<void> getCities(countryId) async {
    var response = await ApiCalls.getCities(countryId: countryId);
    if (response is ErrorEntity) {
    } else {
      CitiesEntity citiesEntity = CitiesEntity().fromJson(response);
      if (citiesEntity.success == 1) {
        print('added cities');
        await database.deleteCities(countryId);
        await database.insertAllCities(citiesEntity.cities).then(
              (value) async => _cities = await database.getCities(countryId),
            );
      }
    }
  }

  Future<void> updateCity() async {
    var response = await ApiCalls.editCurrentCity(
      userId: AppConstants.myId,
      cityName: _cityController.text,
      cityId: selectedCityId,
    );

    if (response is ErrorEntity) {
    } else {
      EditCityEntity cityEntity = EditCityEntity.fromJson(jsonEncode(response));
      if (cityEntity.success == 1) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString("currentCity", _cityController.text);
        Get.back();
        await Fluttertoast.showToast(
          msg: cityEntity.message ?? "Your City has been updated successfully",
        );
      }
    }
  }

}
