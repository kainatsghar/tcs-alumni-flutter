import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/Views/more/Counselor/councelor_controller.dart';
import 'package:iobm/Views/more/Counselor/councelor_model.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class CounselorView extends StatefulWidget {
  const CounselorView({super.key});

  @override
  State<CounselorView> createState() => _CounselorViewState();
}

class _CounselorViewState extends State<CounselorView> {
  final TextEditingController _searchController = TextEditingController();
  final CouncelorController _controller = Get.put(CouncelorController());

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Counselors',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Obx(() => Text(
                  '${_controller.filteredList.length} available specialists',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                )),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            color: AppColor.primaryColor,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => _controller.searchCounselor(value),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Search counselors...',
                  hintStyle: TextStyle(color: Colors.white60, fontSize: 14),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.white70, size: 18),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
            ),
          ),

          // Section label
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ALL COUNSELORS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF888780),
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),

          // List
          Expanded(
            child: Obx(() {
              if (_controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (_controller.filteredList.isEmpty) {
                return const Center(child: Text("No Counselors Found"));
              }
              return RefreshIndicator(
                backgroundColor: AppColor.white,
                color: AppColor.primaryColor,
                onRefresh: () => _controller.getCouncelorList(),
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  itemCount: _controller.filteredList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return _CounselorCard(
                        counselor: _controller.filteredList[index]);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CounselorCard extends StatelessWidget {
  const _CounselorCard({required this.counselor});
  final Counselor counselor;

  Future<void> _launchEmail() async {
    final uri = Uri(scheme: 'mailto', path: counselor.email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchPhone() async {
    if (counselor.phone == null || counselor.phone!.isEmpty) return;
    final uri = Uri(scheme: 'tel', path: counselor.phone!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = counselor.getColors();
    final avatarBg = colors['bg']!;
    final avatarText = colors['text']!;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E6F4), width: 0.5),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 23,
            backgroundColor: avatarBg,
            child: Text(
              counselor.initials,
              style: TextStyle(
                color: avatarText,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  counselor.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C2C2A),
                  ),
                ),
                const SizedBox(height: 2),

                // Tappable email
                GestureDetector(
                  onTap: _launchEmail,
                  child: Text(
                    counselor.email,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B5FD4),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF6B5FD4),
                    ),
                  ),
                ),

                const SizedBox(height: 5),
                if(counselor.specialty.isNotEmpty)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: avatarBg.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    counselor.specialty,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: avatarText,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Chat Button
              GestureDetector(
                onTap: () {
                  Get.to(() => ChatInvitationScreen(
                        receiverId: counselor.id,
                        name: counselor.name,
                        image: "",
                      ));
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: avatarBg.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 18,
                    color: avatarText,
                  ),
                ),
              ),

              // Call Button
              if (counselor.phone != null && counselor.phone!.isNotEmpty) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _launchPhone,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: avatarBg.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.phone_rounded,
                      size: 18,
                      color: avatarText,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
