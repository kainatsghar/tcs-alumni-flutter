import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/Views/more/profile_screen.dart';

import 'package:iobm/Widgets/user_widget.dart';

import 'package:iobm/local_db/local_db.dart';

import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

import '../../Widgets/sec_appbar.dart';

class ConnectionsScreen extends StatefulWidget {
  const ConnectionsScreen({Key? key}) : super(key: key);

  @override
  _ConnectionsScreenState createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> {
  final ScrollController _scrollController = ScrollController();
  late List<DBAllUser> _connectionList;

  late Future _fetchData;

  int? currentPage;

  @override
  void initState() {
    _connectionList = [];

    _fetchData = getConnectionUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.myConnections),
        context: context,
      ),
      body: DefaultTabController(
        length: 2,
        child: _bodyColumn(),
      ),
    );
  }

  Widget _bodyColumn() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColor.black12, width: 2),
            ),
          ),
          child: TabBar(
            labelPadding: const EdgeInsets.symmetric(vertical: 13),
            labelStyle: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              fontWeight: FontWeight.bold,
              fontFamily: 'Gotham',
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              fontWeight: FontWeight.w400,
              fontFamily: 'Gotham',
            ),
            indicatorColor: AppColor.primaryColor,
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.grey,
            tabs: const [
              Text(Strings.invitations),
              Text(Strings.connections),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              FutureBuilder(
                future: _fetchData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _invitationView();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: _fetchData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _myConnectionView();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _invitationView() {
    return Container(
      child: _buildInviteListViewWidget(),
    );
  }

  Widget _myConnectionView() {
    return Container(
      child: _buildConnectListViewWidget(),
    );
  }

  Widget _buildInviteListViewWidget() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _connectionList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int i) {
          if (_connectionList[i].connectionStatus == 'ACCEPT') {
            return const SizedBox();
          } else {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProfileScreen(
                            userID: _connectionList[i].userId,
                          );
                        },
                      ),
                    ).then((value) => getConnectionUsers());
                  },
                  child: UserWidget(
                    image: _connectionList[i].image ?? AppImages.profile,
                    // profession:  "president",
                    name:
                        "${_connectionList[i].firstName} ${_connectionList[i].lastName}",
                    place: "${_connectionList[i].currentCityName}",
                    organization: _connectionList[i].organizationName ?? '',
                    designation: _connectionList[i].designation ?? '',
                    year: _connectionList[i].graduationYear ?? "2015",
                    isMentor: _connectionList[i].isMentor ?? "0",
                    chatStatus: _connectionList[i].chatStatus,
                    id: _connectionList[i].userId,
                  ),
                ),
              ],
            );
          }
        });
  }

  Widget _buildConnectListViewWidget() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _connectionList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i) {
        if (_connectionList[i].connectionStatus == 'ACCEPT') {
          return Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ProfileScreen(userID: _connectionList[i].userId);
                    },
                  ),
                ).then((value) => getConnectionUsers());
              },
              child: UserWidget(
                image: _connectionList[i].image ?? AppImages.profile,
                // profession:  "president",
                name:
                    "${_connectionList[i].firstName} ${_connectionList[i].lastName}",
                place: "${_connectionList[i].currentCityName}",
                organization: _connectionList[i].organizationName ?? '',
                designation: _connectionList[i].designation ?? '',
                year: _connectionList[i].graduationYear ?? "2015",
                isMentor: _connectionList[i].isMentor ?? "0",
                chatStatus: _connectionList[i].chatStatus,
                id: _connectionList[i].userId,
              ),
            ),
          ]);
        }
        else {
          return const SizedBox();
        }
      },
    );
  }

  Future<void> setDataFromDB() async {
    _connectionList = await database.getConnections(connected: 'Y');
  }

  Future<void> getConnectionUsers() async {
    setState(() {
      currentPage = 0;
    });
    setDataFromDB();

    AllUserDataFetched dataFetched = await ApiHelper.getFirstPageUsers(
      currentPage: currentPage,
      city: "",
      countryId: "",
      industry: "",
      isMentor: "",
      year: "",
      name: "",
      branchId: "",
      connected: "Y",
      organization: "",
    );

    if (dataFetched.done) {
      setDataFromDB();

      if (mounted) {
        setState(
          () {
            currentPage = currentPage! + 1;
          },
        );
      }
    }
  }

}
