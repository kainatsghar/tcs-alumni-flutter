import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_color.dart';
import '../../../utils/text_styles.dart';

class QuoridorLeaderboard extends StatelessWidget {
  final int userWins;
  final int userLosses;

  const QuoridorLeaderboard({
    Key? key,
    required this.userWins,
    required this.userLosses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data for Top Players (Replace with API call later)
    final topPlayers = [
      {'name': 'Zaid Khan', 'wins': 150, 'rank': 1},
      {'name': 'Ali Ahmed', 'wins': 142, 'rank': 2},
      {'name': 'Sara Malik', 'wins': 135, 'rank': 3},
      {'name': 'Hamza Sheikh', 'wins': 128, 'rank': 4},
      {'name': 'User 123', 'wins': 115, 'rank': 5},
    ];

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
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: topPlayers.length,
              itemBuilder: (context, index) {
                final player = topPlayers[index];
                return _leaderboardItem(
                  player['name'] as String,
                  player['wins'] as int,
                  player['rank'] as int,
                  false,
                );
              },
            ),
          ),
          // Current User Profile Section
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              border: Border(top: BorderSide(color: Colors.yellow.withOpacity(0.3), width: 1)),
            ),
            child: Column(
              children: [
                _leaderboardItem('YOU (Current Stats)', userWins, 42, true),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _statChip('Wins', userWins, Colors.green),
                    SizedBox(width: 20.w),
                    _statChip('Losses', userLosses, Colors.red),
                  ],
                ),
              ],
            ),
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
        boxShadow: isMe
            ? [BoxShadow(color: Colors.yellow.withOpacity(0.2), blurRadius: 8)]
            : null,
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
