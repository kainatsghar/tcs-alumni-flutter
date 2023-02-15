import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/all_users_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/text_styles.dart';

class NetWorkingScreen extends StatefulWidget {
  const NetWorkingScreen({Key? key}) : super(key: key);

  @override
  _NetWorkingScreenState createState() => _NetWorkingScreenState();
}

class _NetWorkingScreenState extends State<NetWorkingScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController? controller) async {
    _controller.complete(controller);
    if (currentLat != null) {
      controller!.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(currentLat ?? 16.2514, currentLng ?? 20.15513), 12));
    } else {
      await fetchCurrentLocation();
      controller!.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(currentLat ?? 16.2514, currentLng ?? 20.15513), 12));
    }
  }

  late List<DBAllUser> _users;

  late Future _fetchData;
  double radius = 15.0;

  Future<void> getRadius() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      radius = localStorage.getDouble('radius') ?? 15.0;
      currentLat = localStorage.getDouble('lat');
      currentLng = localStorage.getDouble("lng");
    });
  }

  late List<Marker> _markers;
  BitmapDescriptor? pinIcon;

  void setPicIcon() async {
    pinIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 2.5,
      ),
      AppImages.mapicon,
    );
  }

  double? currentLat;
  double? currentLng;

  Future<void> fetchCurrentLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    setState(() {
      currentLat = position.latitude;
      currentLng = position.longitude;
    });

    print(currentLat);
  }

  Future<void> addMarker(
    String id,
    double sLat,
    double sLng,
  ) async {
    _markers.add(
      Marker(
        markerId: MarkerId(id),
        position: LatLng(sLat, sLng),
      ),
    );
  }

  @override
  void initState() {
    _users = [];
    _markers = [];
    getRadius();
    setPicIcon();

    setDataFromDB();
    _fetchData = getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        titleSpacing: 0,
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 4.w),
        ),
        centerTitle: true,
        title: Text(
          Strings.alumniNearme,
          style: CustomTextStyles.text16SemiBoldW600,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _mapsContainer();
              } else {
                return _mapsContainer();
              }
            },
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      min: 0.0,
                      max: 15.0,
                      onChanged: (double value) async {
                        setState(
                          () {
                            radius = value;
                          },
                        );
                        _markers.clear();

                        for (var element in _users) {
                          if (element.userId != AppConstants.myId) {
                            double dif = getDistanceFromCurrentPosition(
                                currentLat ?? 25.5158522,
                                currentLng ?? 74.3410614,
                                double.parse(element.latitude ?? '25.5158522'),
                                double.parse(
                                    element.longitude ?? '74.3410614'));

                            if (dif <= radius) {
                              setState(
                                () {
                                  _markers.add(
                                    Marker(
                                      markerId: MarkerId(element.userId ?? ''),
                                      position: LatLng(
                                          double.parse(element.latitude ?? ''),
                                          double.parse(
                                              element.longitude ?? '')),
                                      icon: pinIcon!,
                                      onTap: () {
                                        Get.to(
                                          () => ProfileScreen(
                                            userID: element.userId,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        }
                        SharedPreferences localStorage =
                            await SharedPreferences.getInstance();
                        localStorage.setDouble('radius', radius);
                        localStorage.setDouble('lat', currentLat!);
                        localStorage.setDouble('lng', currentLng!);
                      },
                      value: radius,
                    ),
                  ),
                  Text(
                    "Radius ${radius.roundToDouble()} Km",
                    style: CustomTextStyles.text14SemiBoldW600,
                  ),
                ],
              ),
            ),
          )

          //_mapsContainer(),
        ],
      ),
    );
  }

  Widget _mapsContainer() {
    return Expanded(
      child: GoogleMap(
        myLocationEnabled: true,
        markers: Set.from(_markers),
        circles: {
          Circle(
            strokeWidth: 2,
            strokeColor: AppColor.blue,
            fillColor: Colors.blue.withOpacity(0.4),
            circleId: const CircleId("0"),
            center: LatLng(currentLat ?? 20.5158288, currentLng ?? 74.3410771),
            radius: radius * 1000,
          )
        },
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLat ?? 20.515995612742373,
              currentLng ?? 74.34127118785881),
          zoom: 12.0,
        ),
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _users = await database.getNetworkUsers(status: '1');

    _markers.clear();

    for (var element in _users) {
      if (element.userId != AppConstants.myId) {
        double dif = getDistanceFromCurrentPosition(
            currentLat ?? 50.1651652,
            currentLng ?? 74.3410614,
            double.parse(element.latitude ?? '50.1651652'),
            double.parse(element.longitude ?? '74.3410614'));
        print(dif);
        if (dif <= radius) {
          setState(
            () {
              _markers.add(
                Marker(
                  markerId: MarkerId(element.userId ?? ''),
                  position: LatLng(
                      double.parse(element.latitude ?? '50.1651652'),
                      double.parse(element.longitude ?? '74.3410614')),
                  icon: pinIcon!,
                  onTap: () {
                    Get.to(
                      () => ProfileScreen(
                        userID: element.userId,
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      }
    }
  }

  Future<void> getUsers() async {
    await fetchCurrentLocation();

    var response = await ApiCalls.getAllUsers(
      url:
          'api/get_users?next_page=0&name=&country=&city=&industry=&graduation_year=&branch=&is_mentor=&user_id=${AppConstants.myId}&company_id=&connected=&is_networking=Y',
    );

    if (response is ErrorEntity) {
    } else {
      AllUsersEntity usersEntity = AllUsersEntity().fromJson(response);
      if (usersEntity.success == 1) {
        database.insertAllUsers(usersEntity.result!);
        await setDataFromDB();
      }
    }
  }

  double getDistanceFromCurrentPosition(
      double startLat, double startLng, double endLat, double endLng) {
    double distance =
        Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
    return distance / 1000;
  }
}
