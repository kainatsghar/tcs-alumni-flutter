import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/controllers/checkin_cities_controller.dart';

import '../../utils/app_color.dart';

class CheckinScreen extends StatefulWidget {
  const CheckinScreen({Key? key}) : super(key: key);

  @override
  State<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  final CityController _cityController = Get.put(CityController());
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkin',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextField(
                    style: TextStyle(fontSize: 13.sp),
                    textCapitalization: TextCapitalization.words,
                    onEditingComplete: () {
                      _cityController.getCities(_searchController.text);
                    },
                    onChanged: (st) {
                      _cityController.getCities(_searchController.text);
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.black38,
                      ),
                      filled: true,
                      fillColor: AppColor.grey.shade300,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Obx(
                () => _cityController.selectedName.toString() != ''
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${_cityController.selectedName}'),
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                    _cityController.selectCity('', '');
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 22.w,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              _citiesBuilder(),
            ],
          ),
          Obx(
            () => _cityController.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    ));
  }

  Widget _citiesBuilder() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: _cityController.cities.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.back();
                _cityController.selectCity(_cityController.cities[index].name,
                    _cityController.cities[index].id.toString());
              },
              title: Text(
                _cityController.cities[index].name ?? '',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: AppColor.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
