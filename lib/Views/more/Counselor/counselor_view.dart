import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class Counselor {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String specialty;

  const Counselor({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.specialty,
  });

  String get initials => name
      .split(' ')
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase())
      .take(2)
      .join();

  // Predefined color pairs for avatars (Background, Text)
  static const List<Map<String, Color>> _avatarPalette = [
    {'bg': Color(0xFFCECBF6), 'text': Color(0xFF3C3489)}, // Purple
    {'bg': Color(0xFF9FE1CB), 'text': Color(0xFF085041)}, // Green
    {'bg': Color(0xFFF4C0D1), 'text': Color(0xFF72243E)}, // Pink
    {'bg': Color(0xFFB5D4F4), 'text': Color(0xFF0C447C)}, // Blue
    {'bg': Color(0xFFFFE0B2), 'text': Color(0xFFE65100)}, // Orange
    {'bg': Color(0xFFD1C4E9), 'text': Color(0xFF4527A0)}, // Deep Purple
    {'bg': Color(0xFFF0F4C3), 'text': Color(0xFF827717)}, // Lime
    {'bg': Color(0xFFFFCCBC), 'text': Color(0xFFBF360C)}, // Deep Orange
  ];

  Map<String, Color> getColors() {
    // Generate a consistent color based on the name's hash
    final index = name.hashCode.abs() % _avatarPalette.length;
    return _avatarPalette[index];
  }
}

class CounselorView extends StatefulWidget {
  const CounselorView({super.key});

  static const _counselors = [
    Counselor(
      id: '101',
      name: 'Dr. Ayesha Khan',
      email: 'ayesha.khan@example.com',
      phone: '+923001234567',
      specialty: 'Therapist',
    ),
    Counselor(
      id: '102',
      name: 'Sana Raza',
      email: 'sana.raza@example.com',
      phone: '+923119876543',
      specialty: 'Psychologist',
    ),
    Counselor(
      id: '103',
      name: 'Omar Malik',
      email: 'omar.malik@example.com',
      phone: '+923335554444',
      specialty: 'Life Coach',
    ),
    Counselor(
      id: '139040',
      name: 'Nadia Baig',
      email: 'nadia.baig@example.com',
      phone: '+923217778888',
      specialty: 'Counselor',
    ),
    Counselor(
      id: '105',
      name: 'Zaid Ahmed',
      email: 'zaid.ahmed@example.com',
      specialty: 'Mental Health Expert',
    ),
    Counselor(
      id: '106',
      name: 'Hina Pervez',
      email: 'hina.p@example.com',
      phone: '+923000001111',
      specialty: 'Family Counselor',
    ),
  ];

  static const _purple = Color(0xFF6B5FD4);

  @override
  State<CounselorView> createState() => _CounselorViewState();
}

class _CounselorViewState extends State<CounselorView> {
  final TextEditingController _searchController = TextEditingController();
  List<Counselor> _filteredCounselors = CounselorView._counselors;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredCounselors = CounselorView._counselors
          .where((counselor) =>
              counselor.name
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              counselor.specialty
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
          .toList();
    });
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
            Text(
              '${_filteredCounselors.length} available specialists',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
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
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              itemCount: _filteredCounselors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return _CounselorCard(counselor: _filteredCounselors[index]);
              },
            ),
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
    if (counselor.phone == null) return;
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
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
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

          // Tappable call button
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

          // if (counselor.phone != null && counselor.phone!.isNotEmpty)
          //   GestureDetector(
          //     onTap: _launchPhone,
          //     child: Container(
          //       width: 38,
          //       height: 38,
          //       decoration: BoxDecoration(
          //         color: avatarBg.withOpacity(0.4),
          //         shape: BoxShape.circle,
          //       ),
          //       child: Icon(
          //         Icons.phone_rounded,
          //         size: 18,
          //         color: avatarText,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
