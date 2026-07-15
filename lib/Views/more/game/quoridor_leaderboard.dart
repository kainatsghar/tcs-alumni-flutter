import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_color.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/app_constants.dart';
import '../../../networkcalls/api_calls.dart';
import '../../../networkcalls/response_models/quoridor_leaderboard_entity.dart';

class QuoridorLeaderboard extends StatefulWidget {
  const QuoridorLeaderboard({Key? key}) : super(key: key);

  @override
  _QuoridorLeaderboardState createState() => _QuoridorLeaderboardState();
}

class _QuoridorLeaderboardState extends State<QuoridorLeaderboard> {
  bool _isLoading = true;
  QuoridorLeaderboardEntity? _leaderboardData;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchLeaderboard();
  }

  Future<void> _fetchLeaderboard() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await ApiCalls.getQuoridorLeaderboard(userId: AppConstants.myId);
      if (response != null && response is Map<String, dynamic>) {
        setState(() {
          _leaderboardData = QuoridorLeaderboardEntity.fromJson(response);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = "Failed to load leaderboard data.";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Color(0xFF2C3E50),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            'LEADERBOARD',
            style: CustomTextStyles.text16SemiBoldW600.copyWith(
              color: Colors.yellow,
              letterSpacing: 2,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Top Strategic Players',
            style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey[400]),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: Colors.yellow))
                : _errorMessage != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_errorMessage!, style: const TextStyle(color: Colors.white70)),
                            TextButton(
                              onPressed: _fetchLeaderboard,
                              child: const Text('Retry', style: TextStyle(color: Colors.yellow)),
                            )
                          ],
                        ),
                      )
                    : _buildLeaderboardList(),
          ),
          // Current User Profile Section
          if (!_isLoading && _leaderboardData?.result?.currentUserStats != null)
            _buildCurrentUserSection(_leaderboardData!.result!.currentUserStats!),
        ],
      ),
    );
  }

  Widget _buildLeaderboardList() {
    final players = _leaderboardData?.result?.topPlayers ?? [];
    if (players.isEmpty) {
      return const Center(child: Text('No players found', style: TextStyle(color: Colors.white70)));
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        bool isMe = player.userId == AppConstants.myId;
        return _leaderboardItem(
          player.name ?? 'Unknown',
          player.wins ?? 0,
          player.rank ?? (index + 1),
          isMe,
        );
      },
    );
  }

  Widget _buildCurrentUserSection(CurrentUserStats stats) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        border: Border(top: BorderSide(color: Colors.yellow.withOpacity(0.3), width: 1)),
      ),
      child: Column(
        children: [
          _leaderboardItem('YOU (Current Stats)', stats.wins ?? 0, stats.rank ?? 0, true),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _statChip('Wins', stats.wins ?? 0, Colors.green),
              SizedBox(width: 20.w),
              _statChip('Losses', stats.losses ?? 0, Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statChip(String label, int value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        '$label: $value',
        style: CustomTextStyles.text12SemiBoldW600.copyWith(color: color),
      ),
    );
  }

  Widget _leaderboardItem(String name, int wins, int rank, bool isMe) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: isMe ? AppColor.primaryColor : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isMe ? Colors.yellow : Colors.transparent, width: 1),
        boxShadow: isMe ? [BoxShadow(color: Colors.yellow.withOpacity(0.2), blurRadius: 8)] : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.w,
            backgroundColor: isMe ? Colors.yellow : Colors.grey[800],
            child: Text(
              '#$rank',
              style: CustomTextStyles.text12SemiBoldW600.copyWith(
                color: isMe ? Colors.black : Colors.white,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: CustomTextStyles.text14SemiBoldW600.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                if (isMe)
                  Text(
                    'Level: Strategic Pro',
                    style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey[400], fontSize: 10.sp),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'WINS',
                style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey[400]),
              ),
              Text(
                '$wins',
                style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.yellow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
