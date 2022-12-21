import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/custom_widgets.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/user_widget.dart';
import 'package:iobm/Widgets/widget_styles.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_helper.dart';

import 'package:iobm/networkcalls/response_models/cities_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

class AlumniScreen extends StatefulWidget {
  AlumniScreen({this.userID, this.checkMentor});
  final String? userID;
  final int? checkMentor;

  @override
  _AlumniScreenState createState() => _AlumniScreenState();
}

class _AlumniScreenState extends State<AlumniScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  bool wait = false;

  int? currentPage;
  int? totalPages;

  String selectedIndustry = "All";
  List graduationYearList = ["All"];
  String selectedYear = "All";
  String? selectedBranch;

  //Dropdown values
  String? _downIndustry = "All";
  String? _downBranch = "9999";

  String? _downYear = "All";

  String selectedCountryId = "";
  String selectedBranchId = "9999";
  bool dataFetched = false;
  int? selectedIndex = 0;

  addingYear() {
    for (var i = 0; i <= 40; i++) {
      int year = DateTime.now().year;
      setState(() {
        year = year - i;
        graduationYearList.add(
          year.toString(),
        );
      });
    }
  }

  bool isLoaded = true;

  late List<DBAllUser> _allUsers;

  late Future _fetchData;

  late List<DBCitie> _cities;
  late List<DBCountrie> _countries;
  late List<DBIndustrie> _industries;
  late List<DBBranche> _branches;

  @override
  void initState() {
    _allUsers = [];
    _countries = [];
    _cities = [];
    _industries = [];
    _branches = [];
    _countryController.text = 'Pakistan';
    _cityController.text = "All";

    _scrollController.addListener(_scrollListener);
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getFirstPageUsers();
    });

    // _fetchData = getFirstPageUsers();
    getData();
    addingYear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: widget.checkMentor == 0
            ? MyAppBar(
                title: Text(Strings.alumni),
                context: context,
              )
            : SecAppBar(
                title: Text(Strings.alumni),
                context: context,
              ),
        body: dataFetched
            ? Stack(
                children: [
                  _bodyContainer(),
                  wait
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container()
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _bodyContainer() {
    return Container(
      color: AppColor.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          AppConstants.appName == 'TLE'
              ? Column(
                  children: [
                    if (_branches.length > 2)
                      SizedBox(
                        height: 10.h,
                      ),
                    if (_branches.length > 2)
                      SizedBox(
                        height: 35.h,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _branches.length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = i;
                                        selectedBranchId = _branches[i].id!;
                                      });
                                      getFirstPageUsers();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            width: 2,
                                            color: selectedIndex == i
                                                ? AppColor.primaryColor
                                                : AppColor.white),
                                      )),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5),
                                        child: Text(_branches[i].title ?? '',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: selectedIndex == i
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: selectedIndex == i
                                                    ? AppColor.primaryColor
                                                    : AppColor.grey)),
                                      )),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                )
              : Container(),
          searchBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return getFirstPageUsers();
              },
              child: Container(
                child: _buildListViewWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.black12,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        top: 4.h,
        bottom: 0.h,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 25.w,
            color: AppColor.black45,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                cursorHeight: 15.h,
                style: TextStyle(fontSize: 13.sp),
                textCapitalization: TextCapitalization.words,
                onEditingComplete: () {
                  getFirstPageUsers();
                },
                onChanged: (String) {
                  getFirstPageUsers();
                },
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: AppColor.black38,
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.greyshade100,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (builder) {
                  return _filterClick();
                },
              );
            },
            icon: Icon(
              Icons.tune,
              size: 25.w,
              color: AppColor.black45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListViewWidget() {
    return _allUsers.isEmpty
        ? Center(
            child: Text(
              'No Users Found',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: AppColor.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            controller: _scrollController,
            itemCount: _allUsers.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              if (_allUsers[i].userId != AppConstants.myId) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ProfileScreen(userID: _allUsers[i].userId);
                            },
                          ),
                        );
                      },
                      child: UserWidget(
                        image: _allUsers[i].image ?? AppImages.profile,
                        name:
                            "${_allUsers[i].firstName} ${_allUsers[i].lastName}",
                        place: "${_allUsers[i].currentCityName}",
                        organization: _allUsers[i].organizationName ?? '',
                        designation: _allUsers[i].designation ?? '',
                        year: AppConstants.appName != 'TLE'
                            ? (_allUsers[i].graduationYear ?? "2015")
                            : '',
                        isMentor: _allUsers[i].isMentor ?? "0",
                        chatStatus: _allUsers[i].chatStatus,
                        id: _allUsers[i].userId,
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          );
  }

  Widget _filterClick() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Material(
          color: AppColor.transparent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                ),
                //height: 380.h,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        alignment: Alignment.topRight,
                        iconSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _country(),
                        SizedBox(
                          width: 10.w,
                        ),
                        _city(),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Industry',
                      style: filterTextstyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButton(
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        isExpanded: true,
                        value: _downIndustry,
                        onChanged: (value) {
                          setState(() {
                            _downIndustry = value as String;
                            selectedIndustry = _downIndustry ?? '';
                          });
                        },
                        items: _industries.map(
                          (industry) {
                            return DropdownMenuItem(
                                value: industry.title,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    industry.title ?? '',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ));
                          },
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Graduation Year',
                      style: filterTextstyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButton(
                        menuMaxHeight: 500,
                        underline: Container(),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        isExpanded: true,
                        value: _downYear,
                        onChanged: (newValue) {
                          setState(
                            () {
                              _downYear = newValue.toString();
                              selectedYear = _downYear ?? '';
                            },
                          );
                        },
                        items: graduationYearList.map(
                          (itemValue) {
                            return DropdownMenuItem(
                              value: itemValue,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  itemValue ?? '',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                    fontSize: ScreenUtil().setSp(14),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Branch',
                      style: filterTextstyle(),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: DropdownButton(
                          menuMaxHeight: 500,
                          underline: Container(),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black54,
                          ),
                          isExpanded: true,
                          onChanged: (newvalue) {
                            setState(() {
                              _downBranch = newvalue.toString();
                              selectedBranchId = newvalue.toString();
                              print(selectedBranchId);
                            });
                          },
                          value: _downBranch,
                          iconEnabledColor: AppColor.grey,
                          items: _branches.map(
                            (itemValue) {
                              return DropdownMenuItem(
                                value: itemValue.id,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    itemValue.title ?? '',
                                    style: TextStyle(
                                      // //Family: 'Nunito',
                                      fontSize: ScreenUtil().setSp(14),
                                      //     fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomWidget.myButton(
                          isBorder: true,
                          size: Size(80.w, 30.h),
                          name: 'Clear Filter',
                          onClicked: () async {
                            setState(() {
                              selectedIndustry = "All";
                              selectedYear = "All";
                              selectedBranchId = '9999';
                              _downBranch = '9999';
                              _downYear = "All";
                              _downIndustry = "All";
                              _cityController.text = "All";
                            });

                            Navigator.of(context).pop();
                            await getFirstPageUsers();
                          },
                        ),
                        SizedBox(width: 15.w),
                        CustomWidget.myButton(
                          isBorder: false,
                          size: Size(80.w, 30.h),
                          name: 'Apply Filter',
                          onClicked: () async {
                            Navigator.of(context).pop();
                            await getFirstPageUsers();
                            // await setDataFromDB();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _country() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Country',
              style: filterTextstyle(),
            ),
            TypeAheadFormField<DBCountrie>(
              //initialValue: 'Pakistan',
              textFieldConfiguration: TextFieldConfiguration(
                textCapitalization: TextCapitalization.sentences,
                controller: _countryController,
                // onSubmitted: (value) {
                //   airportSelected = null;
                //   _searchairports(value);
                //   SystemChannels.textInput.invokeMethod('TextInput.hide');
                // },
                decoration: WidgetStyle.thirnameTextFieldDecoration(hint: ""),
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
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black54,
                    ),
                  ),
                  dense: true,
                );
              },
              getImmediateSuggestions: false,
              onSuggestionSelected: (suggestion) {
                _countryController.text = suggestion.countryName ?? '';
                getCities(suggestion.countryId);
                setState(() {
                  selectedCountryId = suggestion.countryId ?? '';
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _city() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City',
            style: filterTextstyle(),
          ),
          TypeAheadFormField<DBCitie>(
            //initialValue: 'Pakistan',
            textFieldConfiguration: TextFieldConfiguration(
              textCapitalization: TextCapitalization.sentences,
              controller: _cityController,
              decoration: WidgetStyle.thirnameTextFieldDecoration(hint: ""),
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
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: AppColor.black54,
                  ),
                ),
                dense: true,
              );
            },
            getImmediateSuggestions: false,
            onSuggestionSelected: (suggestion) {
              _cityController.text = suggestion.cityName ?? '';
            },
          ),
        ],
      ),
    );
  }

  Widget searchUserBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        bottom: 8.h,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 25.w,
            color: AppColor.black45,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Mentor',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: AppColor.black38,
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.greyshade100,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              size: 25.w,
              color: AppColor.grey,
            ),
          )
        ],
      ),
    );
  }

  Future<void> getFirstPageUsers() async {
    setState(() {
      currentPage = 0;
      wait = true;
    });
    setDataFromDB();

    AllUserDataFetched dataFetched = await ApiHelper.getFirstPageUsers(
      currentPage: currentPage,
      city: _cityController.text == "All" ? "" : _cityController.text,
      countryId: selectedCountryId,
      industry: selectedIndustry == "All" ? "" : selectedIndustry,
      isMentor: widget.checkMentor == 1 ? "1" : "",
      year: selectedYear == "All" ? "" : selectedYear,
      branchId: selectedBranchId == '9999' ? "" : selectedBranchId,
      connected: "",
      organization: "",
      name: _searchController.text,
      connectionStatus: "",
    );

    if (dataFetched.done) {
      setDataFromDB();
      if (mounted) {
        setState(() {
          currentPage = currentPage! + 1;
        });
      }
    }
    if (mounted) {
      setState(() {
        wait = false;
      });
    }
  }

  Future<void> setDataFromDB() async {
    _allUsers = await database.getSpecificUsers(
      company: "",
      isMentor: widget.checkMentor == 1 ? "1" : "",
      isConnected: "",
      city: _cityController.text == "All" ? "" : _cityController.text,
      country: selectedCountryId,
      industry: selectedIndustry == "All" ? "" : selectedIndustry,
      branch: selectedBranchId == '9999' ? "" : selectedBranchId,
      name: _searchController.text,
      graduationYear: selectedYear == "All" ? "" : selectedYear,
      connectionStatus: "",
    );
    if (mounted) {
      setState(() {
        dataFetched = true;
      });
    }
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      //    message = "reach the bottom";
      loadMoreData();
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      //  message = "reach the top";
    }
  }

  Future<void> loadMoreData() async {
    setDataFromDB();
    setState(() {
      wait = true;
    });
    AllUserDataFetched dataFetched = await ApiHelper.getFirstPageUsers(
      currentPage: currentPage,
      city: _cityController.text == "All" ? "" : _cityController.text,
      countryId: selectedCountryId,
      industry: selectedIndustry == "All" ? "" : selectedIndustry,
      isMentor: widget.checkMentor == 1 ? "1" : "",
      year: selectedYear == "All" ? "" : selectedYear,
      branchId: selectedBranchId == '9999' ? "" : selectedBranchId,
      connected: "",
      organization: "",
      name: _searchController.text,
    );
    setState(() {
      wait = false;
    });
    if (dataFetched.done) {
      setDataFromDB();
      setState(() {
        currentPage = currentPage! + 1;
      });
    }
  }

  Future<void> getData() async {
    _countries = await database.getAllCountries();

    _industries = await database.getAllIndustries();
    _industries.insert(0, DBIndustrie(id: '99999', title: 'All'));

    _branches = await database.getAllBranches();
    _branches.insert(
      0,
      DBBranche(id: '9999', title: "All"),
    );
    var country =
        _countries.where((element) => element.countryName == 'Pakistan');
    String? id = country.first.countryId;

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
            (value) async => _cities = await database.getCities(countryId));
      }
    }
  }
}
